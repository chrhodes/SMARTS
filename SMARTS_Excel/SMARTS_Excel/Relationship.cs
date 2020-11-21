using System;
using System.Collections.Generic;
using System.Text;

namespace SMARTS_Excel
{
    class Relationship : IItem
    {
        #region IItem Members

        int IItem.id
        {
            get
            {
                throw new Exception("The method or operation is not implemented.");
            }
            set
            {
                throw new Exception("The method or operation is not implemented.");
            }
        }

        int IItem.typeId
        {
            get
            {
                throw new Exception("The method or operation is not implemented.");
            }
            set
            {
                throw new Exception("The method or operation is not implemented.");
            }
        }

        string IItem.name
        {
            get
            {
                throw new Exception("The method or operation is not implemented.");
            }
            set
            {
                throw new Exception("The method or operation is not implemented.");
            }
        }

        string IItem.description
        {
            get
            {
                throw new Exception("The method or operation is not implemented.");
            }
            set
            {
                throw new Exception("The method or operation is not implemented.");
            }
        }

        int IItem.lifecycleId
        {
            get
            {
                throw new Exception("The method or operation is not implemented.");
            }
            set
            {
                throw new Exception("The method or operation is not implemented.");
            }
        }

        global::System.Collections.IEnumerable IItem.attributes()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        int IItem.create()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        void IItem.delete()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        #endregion

        #region IItemType Members

        string IItemType.name
        {
            get
            {
                throw new Exception("The method or operation is not implemented.");
            }
            set
            {
                throw new Exception("The method or operation is not implemented.");
            }
        }

        string IItemType.description
        {
            get
            {
                throw new Exception("The method or operation is not implemented.");
            }
            set
            {
                throw new Exception("The method or operation is not implemented.");
            }
        }

        global::System.Collections.IEnumerable IItemType.attributes()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        int IItemType.addAttribute()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        void IItemType.removeAttribute()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        #endregion
    }
}
