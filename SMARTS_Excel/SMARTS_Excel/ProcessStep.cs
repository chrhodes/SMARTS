using System;
using System.Collections.Generic;
using System.Text;

namespace SMARTS_Excel
{
    class ProcessStep : IContainable
    {
        #region IContainable Members

        global::System.Collections.IEnumerable IContainable.containableBy()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        #endregion
    }

    class StartStep : ProcessStep
    {
    }

    class EndStep : ProcessStep
    {
    }

    class Decision : ProcessStep
    {
    }
}
