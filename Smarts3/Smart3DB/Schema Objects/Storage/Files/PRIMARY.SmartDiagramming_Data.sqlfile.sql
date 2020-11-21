ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [SmartDiagramming_Data], FILENAME = '$(DefaultDataPath)$(DatabaseName).MDF', FILEGROWTH = 10 %) TO FILEGROUP [PRIMARY];

