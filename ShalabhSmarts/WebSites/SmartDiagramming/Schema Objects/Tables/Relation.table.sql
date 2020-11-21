CREATE TABLE [dbo].[Relation] (
    [Relation_ID]      INT            IDENTITY (1, 1) NOT NULL,
    [SDTable_ID_Begin] INT            NOT NULL,
    [SD_ID_Begin]      INT            NOT NULL,
    [SDTable_ID_End]   INT            NOT NULL,
    [SD_ID_End]        INT            NOT NULL,
    [Relation_Name]    VARCHAR (1000) NULL,
    [Relation_Desc]    VARCHAR (1000) NULL,
    [Abstraction_ID]   INT            NOT NULL
);

