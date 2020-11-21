CREATE TABLE [dbo].[Artifact] (
    [Artifact_ID]      INT            IDENTITY (1, 1) NOT NULL,
    [Artifact_Name]    VARCHAR (100)  NOT NULL,
    [Artifact_Desc]    VARCHAR (1000) NULL,
    [Artifact_Loc]     VARCHAR (500)  NULL,
    [Artifact_Contact] VARCHAR (500)  NULL,
    [Artifact_Note]    VARCHAR (1000) NULL
);

