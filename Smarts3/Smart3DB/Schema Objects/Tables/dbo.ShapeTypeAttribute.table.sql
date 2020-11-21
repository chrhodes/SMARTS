CREATE TABLE [dbo].[ShapeTypeAttribute] (
    [ShapeTypeAttribute_ID]   INT            IDENTITY (1, 1) NOT NULL,
    [ShapeType_ID]            INT            NOT NULL,
    [Attribute_ID]            INT            NOT NULL,
    [ShapeTypeAttribute_Desc] VARCHAR (1000) NULL
);

