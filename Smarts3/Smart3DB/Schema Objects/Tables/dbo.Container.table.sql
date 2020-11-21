CREATE TABLE [dbo].[Container] (
    [Container_ID]         INT IDENTITY (1, 1) NOT NULL,
    [SDTable_ID_Container] INT NOT NULL,
    [SD_ID_Container]      INT NOT NULL,
    [SDTable_ID_Contained] INT NOT NULL,
    [SD_ID_Contained]      INT NOT NULL,
    [Abstraction_ID]       INT NOT NULL
);

