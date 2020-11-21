CREATE TABLE [dbo].[Shape] (
    [Shape_ID]     INT            IDENTITY (1, 1) NOT NULL,
    [ShapeType_ID] INT            NOT NULL,
    [Shape_Name]   VARCHAR (150)  NOT NULL,
    [Shape_Desc]   VARCHAR (1000) NULL,
    [Lifecycle_ID] INT            NULL
);

