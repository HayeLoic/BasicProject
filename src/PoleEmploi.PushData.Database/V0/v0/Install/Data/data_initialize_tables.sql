USE [QUESTTODB]
GO

truncate table [Answers]
truncate table [PlatformDetail]

if exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_Traitment') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] DROP CONSTRAINT [FK_PlatformTraitment_Traitment]
end
if exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireTraited_Traitment') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireTraited] DROP CONSTRAINT [FK_QuestionnaireTraited_Traitment]
end
if exists(select 1 from sys.objects where upper(name) = upper('FK_TreatmentDetail_Treatment') and type = 'F')
begin
	ALTER TABLE [dbo].[TreatmentDetail] DROP CONSTRAINT [FK_TreatmentDetail_Treatment]
end
truncate table [Treatment]
if not exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_Traitment') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] WITH CHECK ADD CONSTRAINT [FK_PlatformTraitment_Traitment] FOREIGN KEY([IdTraitment])
	REFERENCES [dbo].[Treatment] ([IdTraitment])
end
if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireTraited_Traitment') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireTraited] WITH CHECK ADD CONSTRAINT [FK_QuestionnaireTraited_Traitment] FOREIGN KEY([Idtraitment])
	REFERENCES [dbo].[Treatment] ([IdTraitment])
end
if not exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_Traitment') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] WITH CHECK ADD CONSTRAINT [FK_PlatformTraitment_Traitment] FOREIGN KEY([IdTraitment])
	REFERENCES [dbo].[Treatment] ([IdTraitment])
end

if exists(select * from sys.objects where upper(name) = upper('FK_PlatformDetail_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformDetail] DROP CONSTRAINT [FK_PlatformDetail_Platform]
end
if exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] DROP CONSTRAINT [FK_PlatformTraitment_Platform]
end
if exists(select 1 from sys.objects where upper(name) = upper('FK_Traitment_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[Treatment] DROP CONSTRAINT [FK_Traitment_Platform]
end
truncate table [Platform]
if not exists(select * from sys.objects where upper(name) = upper('FK_PlatformDetail_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformDetail] WITH CHECK ADD CONSTRAINT [FK_PlatformDetail_Platform] FOREIGN KEY([IdPlatform])
	REFERENCES [dbo].[Platform] ([IdPlatform])
end
if not exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] WITH CHECK ADD CONSTRAINT [FK_PlatformTraitment_Platform] FOREIGN KEY([IdPlatformDest])
	REFERENCES [dbo].[Platform] ([IdPlatform])
end
if not exists(select 1 from sys.objects where upper(name) = upper('FK_Traitment_Platform') and type = 'F')
begin
	ALTER TABLE [dbo].[Treatment] WITH CHECK ADD CONSTRAINT [FK_Traitment_Platform] FOREIGN KEY([IdPlatformDest])
	REFERENCES [dbo].[Platform] ([IdPlatform])
end

if exists(select 1 from sys.objects where upper(name) = upper('FK_AnswersData_Questions') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireData] DROP CONSTRAINT [FK_AnswersData_Questions]
end
if exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireQuestion_Questions') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireQuestion] DROP CONSTRAINT [FK_QuestionnaireQuestion_Questions]
end
truncate table [Questions]
if not exists(select 1 from sys.objects where upper(name) = upper('FK_AnswersData_Questions') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireData] WITH CHECK ADD CONSTRAINT [FK_AnswersData_Questions] FOREIGN KEY([IdQuestion])
	REFERENCES [dbo].[Questions] ([IdQuestion])
end
if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireQuestion_Questions') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireQuestion] WITH CHECK ADD CONSTRAINT [FK_QuestionnaireQuestion_Questions] FOREIGN KEY([IdQuestion])
	REFERENCES [dbo].[Questions] ([IdQuestion])
end

if exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_QuestionType') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] DROP CONSTRAINT [FK_Questions_QuestionType]
end
truncate table [QuestionType]
if not exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_QuestionType') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] WITH CHECK ADD CONSTRAINT [FK_Questions_QuestionType] FOREIGN KEY([IdQuestiontype])
	REFERENCES [dbo].[QuestionType] ([IdQuestionType])
end

if exists(select 1 from sys.objects where upper(name) = upper('FK_Answers_AnswerList') and type = 'F')
begin
	ALTER TABLE [dbo].[Answers] DROP CONSTRAINT [FK_Answers_AnswerList]
end
if exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_AnswerList') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] DROP CONSTRAINT [FK_Questions_AnswerList]
end
truncate table [AnswerList]
if not exists(select 1 from sys.objects where upper(name) = upper('FK_Answers_AnswerList') and type = 'F')
begin
	ALTER TABLE [dbo].[Answers] WITH CHECK ADD CONSTRAINT [FK_Answers_AnswerList] FOREIGN KEY([IdAnswersList])
	REFERENCES [dbo].[AnswerList] ([IdAnswerList])
end
if not exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_AnswerList') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] WITH CHECK ADD CONSTRAINT [FK_Questions_AnswerList] FOREIGN KEY([IdAnswerList])
	REFERENCES [dbo].[AnswerList] ([IdAnswerList])
end

if exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_ParentQuestions') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] DROP CONSTRAINT [FK_Questions_ParentQuestions]
end
truncate table [ParentQuestions]
if not exists(select 1 from sys.objects where upper(name) = upper('FK_Questions_ParentQuestions') and type = 'F')
begin
	ALTER TABLE [dbo].[Questions] WITH CHECK ADD CONSTRAINT [FK_Questions_ParentQuestions] FOREIGN KEY([IdParentQuestion])
	REFERENCES [dbo].[ParentQuestions] ([IdParentQuestion])
end

if exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] DROP CONSTRAINT [FK_PlatformTraitment_QuestionnaireVersion]
end
if exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireQuestion_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireQuestion] DROP CONSTRAINT [FK_QuestionnaireQuestion_QuestionnaireVersion]
end
if exists(select 1 from sys.objects where upper(name) = upper('FK_Traitment_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[Treatment] DROP CONSTRAINT [FK_Traitment_QuestionnaireVersion]
end
truncate table [QuestionnaireVersion]
if not exists(select 1 from sys.objects where upper(name) = upper('FK_PlatformTraitment_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[PlatformTreatment] WITH CHECK ADD CONSTRAINT [FK_PlatformTraitment_QuestionnaireVersion] FOREIGN KEY([IdQuestionnaireVersion])
	REFERENCES [dbo].[QuestionnaireVersion] ([IdQuestionnaireVersion])
end
if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireQuestion_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireQuestion] WITH CHECK ADD CONSTRAINT [FK_QuestionnaireQuestion_QuestionnaireVersion] FOREIGN KEY([IdQuestionnaireVersion])
	REFERENCES [dbo].[QuestionnaireVersion] ([IdQuestionnaireVersion])
end
if not exists(select 1 from sys.objects where upper(name) = upper('FK_Traitment_QuestionnaireVersion') and type = 'F')
begin
	ALTER TABLE [dbo].[Treatment] WITH CHECK ADD CONSTRAINT [FK_Traitment_QuestionnaireVersion] FOREIGN KEY([IdQuestionnaireVersion])
	REFERENCES [dbo].[QuestionnaireVersion] ([IdQuestionnaireVersion])
end

if exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnairePlatform_Questionnaire') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireTraitment] DROP CONSTRAINT [FK_QuestionnairePlatform_Questionnaire]
end
if exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireVersion_Questionnaire') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireVersion] DROP CONSTRAINT [FK_QuestionnaireVersion_Questionnaire]
end
truncate table [Questionnaire]
if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnairePlatform_Questionnaire') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireTraitment] WITH CHECK ADD CONSTRAINT [FK_QuestionnairePlatform_Questionnaire] FOREIGN KEY([IdQuestionnaire])
	REFERENCES [dbo].[Questionnaire] ([IdQuestionnaire])
end
if not exists(select 1 from sys.objects where upper(name) = upper('FK_QuestionnaireVersion_Questionnaire') and type = 'F')
begin
	ALTER TABLE [dbo].[QuestionnaireVersion] WITH CHECK ADD CONSTRAINT [FK_QuestionnaireVersion_Questionnaire] FOREIGN KEY([IdQuestionnaire])
	REFERENCES [dbo].[Questionnaire] ([IdQuestionnaire])
end

INSERT [Questionnaire] ([IdQuestionnaire], [QuestionnaireCode], [Description]) VALUES (1, N'1328', N'B2B pôle emploi')

INSERT [QuestionnaireVersion] ([IdQuestionnaireVersion], [IdQuestionnaire], [QuestionnaireVersion]) VALUES (1, 1, N'V1')

INSERT [ParentQuestions] ([IdParentQuestion], [LabelQuestion], [CodeParentQuestion]) VALUES (0, N'NoParent', N'NA')

INSERT [AnswerList] ([IdAnswerList], [Description]) VALUES (0, N'open_num')
INSERT [AnswerList] ([IdAnswerList], [Description]) VALUES (1, N'SAT_PE')
INSERT [AnswerList] ([IdAnswerList], [Description]) VALUES (2, N'YN_PE')
INSERT [AnswerList] ([IdAnswerList], [Description]) VALUES (3, N'YN_4_PE')
INSERT [AnswerList] ([IdAnswerList], [Description]) VALUES (4, N'SAT_DIFF_PE')

INSERT [QuestionType] ([IdQuestionType], [QuestionType]) VALUES (1, N'Scale')
INSERT [QuestionType] ([IdQuestionType], [QuestionType]) VALUES (2, N'Numeric')
INSERT [QuestionType] ([IdQuestionType], [QuestionType]) VALUES (3, N'OpenEnded')

INSERT [Questions] ([IdQuestion], [IdParentQuestion], [CodeQuestionSource], [CodeQuestionDestination], [LabelQuestion], [IdAnswerList], [IdQuestiontype], [IsFromSource], [IsToDestination]) VALUES (1, 0, N'v_1', N'v_1', N'Sat Glo', 1, 1, 1, 1)
INSERT [Questions] ([IdQuestion], [IdParentQuestion], [CodeQuestionSource], [CodeQuestionDestination], [LabelQuestion], [IdAnswerList], [IdQuestiontype], [IsFromSource], [IsToDestination]) VALUES (2, 0, N'v_2', N'v_2', N'Raison de Sat', 0, 3, 1, 1)
INSERT [Questions] ([IdQuestion], [IdParentQuestion], [CodeQuestionSource], [CodeQuestionDestination], [LabelQuestion], [IdAnswerList], [IdQuestiontype], [IsFromSource], [IsToDestination]) VALUES (3, 0, N'v_3', N'v_3', N'Raison de InSat', 0, 3, 1, 1)
INSERT [Questions] ([IdQuestion], [IdParentQuestion], [CodeQuestionSource], [CodeQuestionDestination], [LabelQuestion], [IdAnswerList], [IdQuestiontype], [IsFromSource], [IsToDestination]) VALUES (4, 0, N'v_4', N'v_4', N'besoin conseillé', 2, 1, 1, 1)
INSERT [Questions] ([IdQuestion], [IdParentQuestion], [CodeQuestionSource], [CodeQuestionDestination], [LabelQuestion], [IdAnswerList], [IdQuestiontype], [IsFromSource], [IsToDestination]) VALUES (5, 0, N'v_29', N'v_29', N'Ecoute', 1, 1, 1, 1)
INSERT [Questions] ([IdQuestion], [IdParentQuestion], [CodeQuestionSource], [CodeQuestionDestination], [LabelQuestion], [IdAnswerList], [IdQuestiontype], [IsFromSource], [IsToDestination]) VALUES (6, 0, N'v_31', N'v_31', N'Proba', 1, 1, 1, 1)
INSERT [Questions] ([IdQuestion], [IdParentQuestion], [CodeQuestionSource], [CodeQuestionDestination], [LabelQuestion], [IdAnswerList], [IdQuestiontype], [IsFromSource], [IsToDestination]) VALUES (7, 0, N'v_32', N'v_32', N'Service', 1, 1, 1, 1)
INSERT [Questions] ([IdQuestion], [IdParentQuestion], [CodeQuestionSource], [CodeQuestionDestination], [LabelQuestion], [IdAnswerList], [IdQuestiontype], [IsFromSource], [IsToDestination]) VALUES (8, 0, N'v_13', N'v_13', N'Suivi', 1, 1, 1, 1)
INSERT [Questions] ([IdQuestion], [IdParentQuestion], [CodeQuestionSource], [CodeQuestionDestination], [LabelQuestion], [IdAnswerList], [IdQuestiontype], [IsFromSource], [IsToDestination]) VALUES (9, 0, N'v_14', N'v_14', N'Alertes', 4, 1, 1, 1)

INSERT [Platform] ([IdPlatform], [Desciption], [PlatFormName]) VALUES (1, N'Dune for PE_B2B', N'DUNE')
INSERT [Platform] ([IdPlatform], [Desciption], [PlatFormName]) VALUES (2, N'Questback PE', N'QB')

INSERT [Treatment] ([IdTraitment], [Description], [IsActive], [IdPlatformSource], [IdPlatformDest], [IdQuestionnaireVersion]) VALUES (1, N'Transfert B2B PE Dune', 1, 2, 1, 1)

INSERT [PlatformDetail] ([ParameterType], [ParameterName], [ParameterValue], [IdPlatform]) VALUES (N'TOKEN', N'client_id', N'PAR_ipsostest_14c2dcd0e9e0f6c660b8aa56762cad14b541407eaf106cbd820fbf710c4a2c74', 1)
INSERT [PlatformDetail] ([ParameterType], [ParameterName], [ParameterValue], [IdPlatform]) VALUES (N'TOKEN', N'client_secret', N'802b574c76910cb6372fa14ee5f95cd09d9546b78171f82d37db02c88afe514b', 1)
INSERT [PlatformDetail] ([ParameterType], [ParameterName], [ParameterValue], [IdPlatform]) VALUES (N'TOKEN', N'grant_type', N'client_credentials', 1)
INSERT [PlatformDetail] ([ParameterType], [ParameterName], [ParameterValue], [IdPlatform]) VALUES (N'TOKEN', N'MEDIATYPEHEADERVALUE', N'application/x-www-form-urlencoded', 1)
INSERT [PlatformDetail] ([ParameterType], [ParameterName], [ParameterValue], [IdPlatform]) VALUES (N'TOKEN', N'METHOD', N'POST', 1)
INSERT [PlatformDetail] ([ParameterType], [ParameterName], [ParameterValue], [IdPlatform]) VALUES (N'TOKEN', N'REALM', N'/partenaire', 1)
INSERT [PlatformDetail] ([ParameterType], [ParameterName], [ParameterValue], [IdPlatform]) VALUES (N'TOKEN', N'scope', N'emploistoreusagers application_PAR_ipsostest_14c2dcd0e9e0f6c660b8aa56762cad14b541407eaf106cbd820fbf710c4a2c74', 1)
INSERT [PlatformDetail] ([ParameterType], [ParameterName], [ParameterValue], [IdPlatform]) VALUES (N'CONNECTION', N'TOKEN', N'99ce803523ff7e9c178b6226c70bb7e9', 2)
INSERT [PlatformDetail] ([ParameterType], [ParameterName], [ParameterValue], [IdPlatform]) VALUES (N'TOKEN', N'URL', N'https://entreprise.pole-emploi.fr/connexion/oauth2/access_token', 1)
INSERT [PlatformDetail] ([ParameterType], [ParameterName], [ParameterValue], [IdPlatform]) VALUES (N'CONNECTION', N'URL', N'https://tr0044.customervoice360.com', 2)

INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (1, 1, N'1', N'1', N'Très satisfait(e)')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (1, 2, N'2', N'2', N'Assez satisfait(e)')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (1, 3, N'3', N'3', N'Peu satisfait(e)')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (1, 4, N'4', N'4', N'Pas du tout satisfait(e)')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (2, 1, N'1', N'1', N'Oui')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (2, 2, N'2', N'2', N'Non')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (3, 1, N'1', N'1', N'Oui, tout à fait')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (3, 2, N'2', N'2', N'Oui, plutôt')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (3, 3, N'3', N'3', N'Non, plutôt pas')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (3, 4, N'4', N'4', N'Non, pas du tout')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (4, 1, N'1', N'1', N'Très satisfait(e)')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (4, 2, N'2', N'2', N'Assez satisfait(e)')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (4, 3, N'3', N'3', N'Peu satisfait(e)')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (4, 4, N'4', N'4', N'Pas du tout satisfait(e)')
INSERT [Answers] ([IdAnswersList], [IdAnswer], [CodeAnswerSource], [CodeAnswerDest], [LabelAnswer]) VALUES (4, 5, N'98', N'98', N'Vous n''avez pas rencontré de difficulté de recrutement')
GO
