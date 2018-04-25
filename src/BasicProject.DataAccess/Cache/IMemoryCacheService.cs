using System;

namespace BasicProject.DataAccess.Cache
{
    public interface IMemoryCacheService
    {
        T Get<T>(string cacheId);
        T AddOrGetExisting<T>(string key, Func<T> valueFactory);
        T InsertCache<T>(string key, T objectToCache, TimeSpan expiration);
        void Clear();
    }
}