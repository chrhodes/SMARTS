ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [SmartDiagramming_Log], FILENAME = '$(DefaultLogPath)$(DatabaseName)_1.lDF', FILEGROWTH = 10 %);

