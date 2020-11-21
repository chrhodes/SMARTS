CREATE TABLE [dbo].[ShapeType] (
    [ShapeType_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [ShapeType_Name] VARCHAR (50)  NOT NULL,
    [ShapeType_Desc] VARCHAR (200) NULL,
    [Abstraction_ID] INT           NOT NULL
);

