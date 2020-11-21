CREATE TABLE [dbo].[ConstrainedValue] (
    [ConstrainedValue_ID]     INT            IDENTITY (1, 1) NOT NULL,
    [SDTable_ID]              INT            NOT NULL,
    [SD_ID]                   INT            NOT NULL,
    [ConstrainedValue_Values] VARCHAR (2000) NOT NULL
);

