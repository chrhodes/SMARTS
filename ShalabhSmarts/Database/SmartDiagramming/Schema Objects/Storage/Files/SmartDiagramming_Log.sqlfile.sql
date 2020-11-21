ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [SmartDiagramming_Log], FILENAME = '$(Path1)$(DatabaseName).lDF', FILEGROWTH = 10 %);

