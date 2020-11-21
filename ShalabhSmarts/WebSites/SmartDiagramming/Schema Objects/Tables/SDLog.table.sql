CREATE TABLE [dbo].[SDLog] (
    [SDLog_ID]         INT            IDENTITY (1, 1) NOT NULL,
    [SDTable_ID]       INT            NOT NULL,
    [SD_ID]            INT            NOT NULL,
    [SDLogFunction_ID] INT            NOT NULL,
    [SDLog_Value]      VARCHAR (1000) NULL,
    [SDLog_Note]       VARCHAR (1000) NULL,
    [SDLog_Contact]    VARCHAR (50)   NOT NULL,
    [SDLog_DateTime]   DATETIME       NOT NULL
);

