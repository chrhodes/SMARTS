﻿ALTER TABLE [dbo].[ConstrainedValue]
    ADD CONSTRAINT [PK_ConstrainedValue] PRIMARY KEY CLUSTERED ([ConstrainedValue_ID] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
