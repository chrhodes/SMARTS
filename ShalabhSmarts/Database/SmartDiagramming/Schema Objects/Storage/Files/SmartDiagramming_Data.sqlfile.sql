﻿ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [SmartDiagramming_Data], FILENAME = '$(Path2)$(DatabaseName).MDF', FILEGROWTH = 10 %) TO FILEGROUP [PRIMARY];

