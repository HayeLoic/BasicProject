﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web.Http;
using BasicProject.Library.Business.FileLoading;

namespace BasicProject.WebApp.ApiControllers
{
    [RoutePrefix("api/loadFile")]
    public class LoadFileController : ApiController
    {
        private readonly IFileLoader fileLoader;

        public LoadFileController(IFileLoader fileLoader)
        {
            this.fileLoader = fileLoader;
        }

        [Route("getDefaultUploadFileDestination")]
        [HttpGet]
        public string GetDefaultUploadFileDestination()
        {
            return this.fileLoader.GetDefaultUploadFileDestination();
        }

        [Route("uploadFileToReadStream")]
        [HttpPost]
        public UploadFileResultModel UploadFileToReadStream()
        {
            UploadFileResultModel uploadFileResultModel = new UploadFileResultModel();
            try
            {
                Stream stream = this.Request.Content.ReadAsStreamAsync().Result;
                uploadFileResultModel = this.fileLoader.UploadFile(stream);
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
                uploadFileResultModel.ErrorMessage = exception.Message;
            }
            return uploadFileResultModel;
        }

        [Route("uploadFile")]
        [HttpPost]
        public async Task<UploadFileResultModel> UploadFile()
        {
            UploadFileResultModel uploadFileResultModel = new UploadFileResultModel();
            try
            {
                if (!Request.Content.IsMimeMultipartContent())
                {
                    throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
                }

                MultipartMemoryStreamProvider provider = new MultipartMemoryStreamProvider();
                await Request.Content.ReadAsMultipartAsync(provider);
                Stream stream = provider.Contents[0].ReadAsStreamAsync().Result;

                byte[] bytesFileName = await provider.Contents[1].ReadAsByteArrayAsync();
                string fileName = System.Text.Encoding.UTF8.GetString(bytesFileName);

                uploadFileResultModel = this.fileLoader.UploadFile(stream, this.fileLoader.GetDefaultUploadFileDestination(), fileName);
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
                uploadFileResultModel.ErrorMessage = exception.Message;
            }
            return uploadFileResultModel;
        }

        [Route("getFiles")]
        [HttpGet]
        public IEnumerable<FileModel> GetFiles()
        {
            try
            {
                return this.fileLoader.GetFiles(this.fileLoader.GetDefaultUploadFileDestination());
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
                return null;
            }
        }

        [Route("downloadFile/{fileId}")]
        [HttpGet]
        public HttpResponseMessage DownloadFile(int fileId)
        {
            try
            {
                FileModel fileModel = this.fileLoader.GetFile(fileId, this.fileLoader.GetDefaultUploadFileDestination());
                Stream stream = this.fileLoader.GetStream(fileId, this.fileLoader.GetDefaultUploadFileDestination());

                HttpResponseMessage httpResponseMessage = new HttpResponseMessage(HttpStatusCode.OK)
                {
                    Content = new StreamContent(stream)
                };
                httpResponseMessage.Content.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");
                httpResponseMessage.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment")
                {
                    FileName = fileModel.Name
                };

                return httpResponseMessage;
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, exception.Message);
            }
        }
    }
}
