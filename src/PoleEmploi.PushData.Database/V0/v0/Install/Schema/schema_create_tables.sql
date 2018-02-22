USE [QUESTTODB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if not exists(select 1 from sys.objects where upper(name) = upper('AnswerList') and type = 'U')
begin
	CREATE TABLE [dbo].[AnswerList](
		[IdAnswerList] [int] NOT NULL,
		[Description] [varchar](100) NOT NULL,
	 CONSTRAINT [PK_AnswerList] PRIMARY KEY CLUSTERED 
	(
		[IdAnswerList] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('Answers') and type = 'U')
begin
	CREATE TABLE [dbo].[Answers](
		[IdAnswersList] [int] NOT NULL,
		[IdAnswer] [int] NOT NULL,
		[CodeAnswerSource] [varchar](10) NOT NULL,
		[CodeAnswerDest] [varchar](10) NOT NULL,
		[LabelAnswer] [nvarchar](500) NOT NULL,
	 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
	(
		[IdAnswersList] ASC,
		[IdAnswer] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('ParentQuestions') and type = 'U')
begin
	CREATE TABLE [dbo].[ParentQuestions](
		[IdParentQuestion] [int] NOT NULL,
		[LabelQuestion] [nvarchar](500) NOT NULL,
		[CodeParentQuestion] [varchar](10) NOT NULL,
	 CONSTRAINT [PK_ParentQuestions] PRIMARY KEY CLUSTERED 
	(
		[IdParentQuestion] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('Platform') and type = 'U')
begin
	CREATE TABLE [dbo].[Platform](
		[IdPlatform] [int] NOT NULL,
		[Desciption] [nvarchar](500) NOT NULL,
		[PlatFormName] [nvarchar](50) NULL,
	 CONSTRAINT [PK_Platform2] PRIMARY KEY CLUSTERED 
	(
		[IdPlatform] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('PlatformDetail') and type = 'U')
begin
	CREATE TABLE [dbo].[PlatformDetail](
		[ParameterType] [varchar](50) NULL,
		[ParameterName] [varchar](50) NOT NULL,
		[ParameterValue] [varchar](250) NOT NULL,
		[IdPlatform] [int] NOT NULL,
	 CONSTRAINT [PK_PlatformDetail] PRIMARY KEY CLUSTERED 
	(
		[ParameterName] ASC,
		[IdPlatform] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('PlatformTreatment') and type = 'U')
begin
	CREATE TABLE [dbo].[PlatformTreatment](
		[IdTraitment] [int] NOT NULL,
		[IdPlatformSource] [int] NOT NULL,
		[IdPlatformDest] [int] NOT NULL,
		[IdQuestionnaireVersion] [int] NOT NULL,
	 CONSTRAINT [PK_PlatformTreatment] PRIMARY KEY CLUSTERED 
	(
		[IdTraitment] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('ProjectQuestionnaire') and type = 'U')
begin
	CREATE TABLE [dbo].[ProjectQuestionnaire](
		[ProjectId] [int] NOT NULL,
		[ProjectCde] [varchar](50) NOT NULL,
		[IdQuestionnaire] [int] NOT NULL,
	 CONSTRAINT [PK_ProjectQuestionnaire] PRIMARY KEY CLUSTERED 
	(
		[ProjectId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('Questionnaire') and type = 'U')
begin
	CREATE TABLE [dbo].[Questionnaire](
		[IdQuestionnaire] [int] NOT NULL,
		[QuestionnaireCode] [varchar](50) NOT NULL,
		[Description] [nvarchar](200) NOT NULL,
	 CONSTRAINT [PK_Questionnaire] PRIMARY KEY CLUSTERED 
	(
		[IdQuestionnaire] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('QuestionnaireData') and type = 'U')
begin
	CREATE TABLE [dbo].[QuestionnaireData](
		[IdInterview] [bigint] NOT NULL,
		[IdQuestion] [int] NOT NULL,
		[IdAnswer] [int] NOT NULL,
		[Verbatim] [nvarchar](max) NULL,
	 CONSTRAINT [PK_QuestionnaireData] PRIMARY KEY CLUSTERED 
	(
		[IdInterview] ASC,
		[IdQuestion] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('QuestionnaireDataExported') and type = 'U')
begin
	CREATE TABLE [dbo].[QuestionnaireDataExported](
		[IdTraitment] [int] NOT NULL,
		[IdInterview] [bigint] NOT NULL,
		[IdQuestionnaireVersion] [int] NOT NULL,
		[IdQuestion] [int] NOT NULL,
		[IdAnswer] [int] NOT NULL,
		[InterviewNumber] [bigint] NOT NULL,
		[Verbatim] [nvarchar](max) NULL,
		[ExportedDate] [datetime] NOT NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('QuestionnairePlatform') and type = 'U')
begin
	CREATE TABLE [dbo].[QuestionnairePlatform](
		[IdTraitment] [int] NOT NULL,
		[IdQuestionnaireVersion] [int] NOT NULL,
		[IdPlatformSource] [int] NOT NULL,
		[IdPlateformDest] [int] NOT NULL,
	 CONSTRAINT [PK_QuestionnairePlatform] PRIMARY KEY CLUSTERED 
	(
		[IdTraitment] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('QuestionnaireQuestion') and type = 'U')
begin
	CREATE TABLE [dbo].[QuestionnaireQuestion](
		[IdQuestionnaireVersion] [int] NOT NULL,
		[IdQuestion] [int] NOT NULL,
	 CONSTRAINT [PK_QuestionnaireQuestion] PRIMARY KEY CLUSTERED 
	(
		[IdQuestionnaireVersion] ASC,
		[IdQuestion] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('QuestionnaireTraited') and type = 'U')
begin
	CREATE TABLE [dbo].[QuestionnaireTraited](
		[IdInterview] [bigint] NOT NULL,
		[Idtraitment] [int] NOT NULL,
		[IdQuestionnaireVersion] [int] NOT NULL,
		[InterviewNumber] [int] NOT NULL,
		[IsCompleteFromSource] [bit] NOT NULL,
		[IsSentToDestination] [bit] NOT NULL,
	 CONSTRAINT [PK_QuestionnaireTraited] PRIMARY KEY CLUSTERED 
	(
		[IdInterview] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('QuestionnaireTraitment') and type = 'U')
begin
	CREATE TABLE [dbo].[QuestionnaireTraitment](
		[IdTraitment] [int] NOT NULL,
		[IdQuestionnaire] [int] NOT NULL,
	 CONSTRAINT [PK_QuestionnairePlatform_2] PRIMARY KEY NONCLUSTERED 
	(
		[IdTraitment] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('QuestionnaireVersion') and type = 'U')
begin
	CREATE TABLE [dbo].[QuestionnaireVersion](
		[IdQuestionnaireVersion] [int] NOT NULL,
		[IdQuestionnaire] [int] NOT NULL,
		[QuestionnaireVersion] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_QuestionnaireVersion] PRIMARY KEY CLUSTERED 
	(
		[IdQuestionnaireVersion] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('Questions') and type = 'U')
begin
	CREATE TABLE [dbo].[Questions](
		[IdQuestion] [int] NOT NULL,
		[IdParentQuestion] [int] NOT NULL,
		[CodeQuestionSource] [varchar](10) NOT NULL,
		[CodeQuestionDestination] [varchar](10) NOT NULL,
		[LabelQuestion] [nvarchar](500) NOT NULL,
		[IdAnswerList] [int] NOT NULL,
		[IdQuestiontype] [int] NOT NULL,
		[IsFromSource] [bit] NOT NULL,
		[IsToDestination] [bit] NOT NULL,
	 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
	(
		[IdQuestion] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('QuestionType') and type = 'U')
begin
	CREATE TABLE [dbo].[QuestionType](
		[IdQuestionType] [int] NOT NULL,
		[QuestionType] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_QuestionType] PRIMARY KEY CLUSTERED 
	(
		[IdQuestionType] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('Treatment') and type = 'U')
begin
	CREATE TABLE [dbo].[Treatment](
		[IdTraitment] [int] NOT NULL,
		[Description] [nvarchar](500) NOT NULL,
		[IsActive] [bit] NOT NULL,
		[IdPlatformSource] [int] NOT NULL,
		[IdPlatformDest] [int] NOT NULL,
		[IdQuestionnaireVersion] [int] NOT NULL,
	 CONSTRAINT [PK_Traitment] PRIMARY KEY CLUSTERED 
	(
		[IdTraitment] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('TreatmentDetail') and type = 'U')
begin
	CREATE TABLE [dbo].[TreatmentDetail](
		[IdTraitment] [int] NOT NULL,
		[ParameterName] [nchar](10) NOT NULL,
		[ParameterValue] [nchar](10) NOT NULL,
	 CONSTRAINT [PK_TraitmentDetail] PRIMARY KEY CLUSTERED 
	(
		[IdTraitment] ASC,
		[ParameterName] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('NLog') and type = 'U')
begin
	CREATE TABLE [dbo].[NLog](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[CreateDate] DateTime NOT NULL,
		[MachineName] nvarchar(256) NOT NULL,
		[ProcessId] BIGINT NOT NULL,
		[ProcessName] [nvarchar](256) NOT NULL,
		[Version] [nvarchar](256) NOT NULL,
		[LogLevel] [nvarchar](256) NOT NULL,
		[Message] [nvarchar](max),
		[Exception] [nvarchar](max),
		[StackTrace] [nvarchar](max),
	 CONSTRAINT [PK_NLog] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end

if not exists(select 1 from sys.objects where upper(name) = upper('DF_QuestionnaireTraited_IsCompleteFromSource') and type = 'D')
begin
	ALTER TABLE [dbo].[QuestionnaireTraited] ADD CONSTRAINT [DF_QuestionnaireTraited_IsCompleteFromSource] DEFAULT ((0)) FOR [IsCompleteFromSource]
end

if not exists(select 1 from sys.objects where upper(name) = upper('DF_Questions_IsFromSource') and type = 'D')
begin
	ALTER TABLE [dbo].[Questions] ADD CONSTRAINT [DF_Questions_IsFromSource] DEFAULT ((0)) FOR [IsFromSource]
end

if not exists(select 1 from sys.objects where upper(name) = upper('DF_Questions_IsToDestination') and type = 'D')
begin
	ALTER TABLE [dbo].[Questions] ADD CONSTRAINT [DF_Questions_IsToDestination] DEFAULT ((0)) FOR [IsToDestination]
end

if not exists(select 1 from sys.objects where upper(name) = upper('DF_Traitment_IsActive') and type = 'D')
begin
	ALTER TABLE [dbo].[Treatment] ADD CONSTRAINT [DF_Traitment_IsActive] DEFAULT ((0)) FOR [IsActive]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Answers_AnswerList') and type = 'F')
begin
	ALTER TABLE [dbo].[Answers] WITH CHECK ADD CONSTRAINT [FK_Answers_AnswerList] FOREIGN KEY([IdAnswersList])
	REFERENCES [dbo].[AnswerList] ([IdAnswerList])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Answers_AnswerList') and type = 'F')
begin
	ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_AnswerList]
end

if not exists(select * from sys.objects where upper(name) = upper('FK_PlatformDetail_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformDetail] WITH CHECK ADD CONSTRAINT [FK_PlatformDetail_Platform] FOREIGN KEY([IdPlatform])
	REFERENCES [dbo].[Platform] ([IdPlatform])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformDetail_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformDetail] CHECK CONSTRAINT [FK_PlatformDetail_Platform]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] WITH CHECK ADD CONSTRAINT [FK_PlatformTraitment_Platform] FOREIGN KEY([IdPlatformDest])
	REFERENCES [dbo].[Platform] ([IdPlatform])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] CHECK CONSTRAINT [FK_PlatformTraitment_Platform]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] WITH CHECK ADD CONSTRAINT [FK_PlatformTraitment_QuestionnaireVersion] FOREIGN KEY([IdQuestionnaireVersion])
	REFERENCES [dbo].[QuestionnaireVersion] ([IdQuestionnaireVersion])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] CHECK CONSTRAINT [FK_PlatformTraitment_QuestionnaireVersion]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_Traitment') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] WITH CHECK ADD CONSTRAINT [FK_PlatformTraitment_Traitment] FOREIGN KEY([IdTraitment])
	REFERENCES [dbo].[Treatment] ([IdTraitment])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_Traitment') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] CHECK CONSTRAINT [FK_PlatformTraitment_Traitment]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_AnswersData_Questions') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireData] WITH CHECK ADD CONSTRAINT [FK_AnswersData_Questions] FOREIGN KEY([IdQuestion])
	REFERENCES [dbo].[Questions] ([IdQuestion])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_AnswersData_Questions') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireData] CHECK CONSTRAINT [FK_AnswersData_Questions]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireData_QuestionnaireTraited') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireData] WITH CHECK ADD CONSTRAINT [FK_QuestionnaireData_QuestionnaireTraited] FOREIGN KEY([IdInterview])
	REFERENCES [dbo].[QuestionnaireTraited] ([IdInterview])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireData_QuestionnaireTraited') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireData] CHECK CONSTRAINT [FK_QuestionnaireData_QuestionnaireTraited]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireQuestion_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireQuestion] WITH CHECK ADD CONSTRAINT [FK_QuestionnaireQuestion_QuestionnaireVersion] FOREIGN KEY([IdQuestionnaireVersion])
	REFERENCES [dbo].[QuestionnaireVersion] ([IdQuestionnaireVersion])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireQuestion_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireQuestion] CHECK CONSTRAINT [FK_QuestionnaireQuestion_QuestionnaireVersion]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireQuestion_Questions') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireQuestion] WITH CHECK ADD CONSTRAINT [FK_QuestionnaireQuestion_Questions] FOREIGN KEY([IdQuestion])
	REFERENCES [dbo].[Questions] ([IdQuestion])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireQuestion_Questions') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireQuestion] CHECK CONSTRAINT [FK_QuestionnaireQuestion_Questions]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireTraited_Traitment') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireTraited] WITH CHECK ADD CONSTRAINT [FK_QuestionnaireTraited_Traitment] FOREIGN KEY([Idtraitment])
	REFERENCES [dbo].[Treatment] ([IdTraitment])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireTraited_Traitment') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireTraited] CHECK CONSTRAINT [FK_QuestionnaireTraited_Traitment]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnairePlatform_Questionnaire') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireTraitment] WITH CHECK ADD CONSTRAINT [FK_QuestionnairePlatform_Questionnaire] FOREIGN KEY([IdQuestionnaire])
	REFERENCES [dbo].[Questionnaire] ([IdQuestionnaire])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnairePlatform_Questionnaire') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireTraitment] CHECK CONSTRAINT [FK_QuestionnairePlatform_Questionnaire]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireVersion_Questionnaire') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireVersion] WITH CHECK ADD CONSTRAINT [FK_QuestionnaireVersion_Questionnaire] FOREIGN KEY([IdQuestionnaire])
	REFERENCES [dbo].[Questionnaire] ([IdQuestionnaire])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireVersion_Questionnaire') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireVersion] CHECK CONSTRAINT [FK_QuestionnaireVersion_Questionnaire]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_AnswerList') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] WITH CHECK ADD CONSTRAINT [FK_Questions_AnswerList] FOREIGN KEY([IdAnswerList])
	REFERENCES [dbo].[AnswerList] ([IdAnswerList])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_AnswerList') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_AnswerList]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_ParentQuestions') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] WITH CHECK ADD CONSTRAINT [FK_Questions_ParentQuestions] FOREIGN KEY([IdParentQuestion])
	REFERENCES [dbo].[ParentQuestions] ([IdParentQuestion])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_ParentQuestions') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_ParentQuestions]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_QuestionType') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] WITH CHECK ADD CONSTRAINT [FK_Questions_QuestionType] FOREIGN KEY([IdQuestiontype])
	REFERENCES [dbo].[QuestionType] ([IdQuestionType])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_QuestionType') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_QuestionType]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Traitment_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[Treatment] WITH CHECK ADD CONSTRAINT [FK_Traitment_Platform] FOREIGN KEY([IdPlatformDest])
	REFERENCES [dbo].[Platform] ([IdPlatform])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Traitment_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[Treatment] CHECK CONSTRAINT [FK_Traitment_Platform]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Traitment_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[Treatment] WITH CHECK ADD CONSTRAINT [FK_Traitment_QuestionnaireVersion] FOREIGN KEY([IdQuestionnaireVersion])
	REFERENCES [dbo].[QuestionnaireVersion] ([IdQuestionnaireVersion])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_Traitment_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[Treatment] CHECK CONSTRAINT [FK_Traitment_QuestionnaireVersion]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_TraitmentDetail_QuestionnairePlatform') and type = 'F')
begin
	ALTER TABLE [dbo].[TreatmentDetail] WITH CHECK ADD CONSTRAINT [FK_TraitmentDetail_QuestionnairePlatform] FOREIGN KEY([IdTraitment])
	REFERENCES [dbo].[QuestionnaireTraitment] ([IdTraitment])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_TraitmentDetail_QuestionnairePlatform') and type = 'F')
begin
	ALTER TABLE [dbo].[TreatmentDetail] CHECK CONSTRAINT [FK_TraitmentDetail_QuestionnairePlatform]
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_TreatmentDetail_Treatment') and type = 'F')
begin
	ALTER TABLE [dbo].[TreatmentDetail] WITH CHECK ADD CONSTRAINT [FK_TreatmentDetail_Treatment] FOREIGN KEY([IdTraitment])
	REFERENCES [dbo].[Treatment] ([IdTraitment])
end

if not exists(select 1 from sys.objects where upper(name) = upper('FK_TreatmentDetail_Treatment') and type = 'F')
begin
	ALTER TABLE [dbo].[TreatmentDetail] CHECK CONSTRAINT [FK_TreatmentDetail_Treatment]
end
GO
