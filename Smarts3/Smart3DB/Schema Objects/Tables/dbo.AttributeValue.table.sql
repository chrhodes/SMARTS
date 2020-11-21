CREATE TABLE [dbo].[AttributeValue] (
    [AttributeValue_ID]     INT            IDENTITY (1, 1) NOT NULL,
    [SDTable_ID]            INT            NOT NULL,
    [SD_ID]                 INT            NOT NULL,
    [ShapeTypeAttribute_ID] INT            NOT NULL,
    [AttributeValue_Value]  VARCHAR (1000) NOT NULL
);

