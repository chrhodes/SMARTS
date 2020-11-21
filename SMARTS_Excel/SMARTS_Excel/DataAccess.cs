using System;
using System.Collections.Generic;
using System.Text;
using PacificLife.Life.Enterprise.Data;
using PacificLife.Life.Enterprise.Log;
using System.Data;


namespace SMARTS_Excel
{
	class DataAccess
	{
		public static PLDbConnection
		ConnectionOpen()
		{
			return PLDbConnection.GetConnection("SMARTS");
        }

        #region Dictionary Support

        public static int GetAbstractionID(string abstractionName)
        {
            try
            {
                return Globals.Abstractions[abstractionName];
            }
            catch (KeyNotFoundException)
            {
                return Globals.ERR_ABSTRACTION_NOT_FOUND;
            }
        }

        public static int GetAttributeID(string attributeName)
        {
            try
            {
                return Globals.Attributes[attributeName];
            }
            catch (KeyNotFoundException)
            {
                return Globals.ERR_ATTRIBUTE_NOT_FOUND;
            }
        }

        public static int GetShapeTypeAttributeID(string shapeTypeAttributeName)
        {
            try
            {
                return Globals.ShapeTypeAttributes[shapeTypeAttributeName];
            }
            catch (KeyNotFoundException)
            {
                return Globals.ERR_SHAPETYPEATTRIBUTE_NOT_FOUND;
            }
        }

        public static int GetShapeTypeID(string shapeTypeName)
        {
            try
            {
                return Globals.ShapeTypes[shapeTypeName];
            }
            catch (KeyNotFoundException)
            {
                return Globals.ERR_SHAPE_NOT_FOUND;
            }
        }

        public static int GetTableID(string tableName)
        {
            try
            {
                return Globals.Tables[tableName];
            }
            catch (KeyNotFoundException)
            {
                return Globals.ERR_TABLE_NOT_FOUND;
            }
        }


        public static Dictionary<string, int> GetAbstractionDictionary()
        {
            Logging.Log(Severity.Verbose, global::System.Reflection.MethodBase.GetCurrentMethod().Name);
            //TODO : Create GetAbstractionList Stored Procedure
            throw new NotImplementedException();

            Dictionary<String, int> abstractions = new Dictionary<string, int>();

            using (PLDbConnection dbConn = DataAccess.ConnectionOpen())
            {
                using (PLDbCommand dbCmd = new PLDbCommand("GetAbstractionList", dbConn))
                {
                    using (PLDbDataReader dbDr = dbCmd.ExecuteReader())
                    {
                        while (dbDr.Read())
                        {
                            // TODO : Someday determine if there is a meaningful speed difference.
                            //Globals.Attributes.Add(dbDr.GetString(1), dbDr.GetInt32(0));
                            abstractions.Add(dbDr["Abstraction_Name"].ToString(), (int)dbDr["Abstraction_ID"]);
                        }
                    }
                }
            }

            return abstractions;
        }

        public static Dictionary<string, int> GetAttributeDictionary()
        {
            Logging.Log(Severity.Verbose, global::System.Reflection.MethodBase.GetCurrentMethod().Name);

            Dictionary<String, int> attributes = new Dictionary<string, int>();

            using (PLDbConnection dbConn = DataAccess.ConnectionOpen())
            {
                using (PLDbCommand dbCmd = new PLDbCommand("GetAttributeList", dbConn))
                {
                    using (PLDbDataReader dbDr = dbCmd.ExecuteReader())
                    {
                        while (dbDr.Read())
                        {
                            // TODO : Someday determine if there is a meaningful speed difference.
                            //Globals.Attributes.Add(dbDr.GetString(1), dbDr.GetInt32(0));
                            attributes.Add(dbDr["Attribute_Name"].ToString(), (int)dbDr["Attribute_ID"]);
                        }
                    }
                }
            }

            return attributes;
        }

        // This maps ShapeType_Name:Attribute_Name to a ShapeTypeAttribute_ID

        public static Dictionary<string, int> GetShapeTypeAttributeDictionary()
        {
            Dictionary<String, int> shapeattributes = new Dictionary<string, int>();
            Logging.Log(Severity.Verbose, global::System.Reflection.MethodBase.GetCurrentMethod().Name);

            using (PLDbConnection dbConn = DataAccess.ConnectionOpen())
            {
                using (PLDbCommand dbCmd = new PLDbCommand("GetShapeTypeAttributeList", dbConn))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;

                    dbCmd.AddParameter("@ST_ID", SqlDbType.Int, 0).Value = 0;
                    dbCmd.AddParameter("@A_ID", SqlDbType.Int, 0).Value = 0;

                    using (PLDbDataReader dbDr = dbCmd.ExecuteReader())
                    {
                        while (dbDr.Read())
                        {
                            // TODO : Someday determine if there is a meaningful speed difference.
                            //Globals.Attributes.Add(dbDr.GetString(1), dbDr.GetInt32(0));
                            shapeattributes.Add(dbDr["ShapeTypeAttribute_Name"].ToString(), (int)dbDr["ShapeTypeAttribute_ID"]);
                        }
                    }
                }
            }

            return shapeattributes;
        }

        public static Dictionary<string, int> GetShapeTypeDictionary()
        {
            Dictionary<String, int> shapes = new Dictionary<string, int>();
            Logging.Log(Severity.Verbose, global::System.Reflection.MethodBase.GetCurrentMethod().Name);

            using (PLDbConnection dbConn = DataAccess.ConnectionOpen())
            {
                using (PLDbCommand dbCmd = new PLDbCommand("GetShapeTypeList", dbConn))
                {
                    dbCmd.CommandType = CommandType.StoredProcedure;

                    // TODO : Why do I have to pass DBNull.Value?
                    dbCmd.AddParameter("@ABSTRACTION", SqlDbType.Int, 0).Value = DBNull.Value;

                    using (PLDbDataReader dbDr = dbCmd.ExecuteReader())
                    {
                        while (dbDr.Read())
                        {
                            // TODO : Someday determine if there is a meaningful speed difference.
                            //Globals.Attributes.Add(dbDr.GetString(1), dbDr.GetInt32(0));
                            shapes.Add(dbDr["ShapeType_Name"].ToString(), (int)dbDr["ShapeType_ID"]);
                        }
                    }
                }
            }

            return shapes;
        }

        public static Dictionary<string, int> GetTableDictionary()
        {
            Logging.Log(Severity.Verbose, global::System.Reflection.MethodBase.GetCurrentMethod().Name);
            //TODO : Create GetTableList Stored Procedure
            throw new NotImplementedException();

            Dictionary<String, int> tables = new Dictionary<string, int>();

            using (PLDbConnection dbConn = DataAccess.ConnectionOpen())
            {
                using (PLDbCommand dbCmd = new PLDbCommand("GetTableList", dbConn))
                {
                    using (PLDbDataReader dbDr = dbCmd.ExecuteReader())
                    {
                        while (dbDr.Read())
                        {
                            // TODO : Someday determine if there is a meaningful speed difference.
                            //Globals.Attributes.Add(dbDr.GetString(1), dbDr.GetInt32(0));
                            tables.Add(dbDr["SDTable_Name_Name"].ToString(), (int)dbDr["SDTable_ID"]);
                        }
                    }
                }
            }

            return tables;
        }

        #endregion 

        #region Shape Operations

        public static int CreateShape(PLDbConnection dbConn, string shapeType, string shapeName, string shapeDescription, out int shapeID)
        {
            // TODO : Update with using and handle errors.
            // TODO : Can we pass in a dbCmd and have the common stuff already populated?
            PLDbCommand dbCmd;

            // Create the Shape

            dbCmd = new PLDbCommand("SetShape", dbConn);
            dbCmd.CommandType = CommandType.StoredProcedure;

            dbCmd.AddParameter("@Table", SqlDbType.Int, 0).Value = Globals.TABLE_SHAPE;
            dbCmd.AddParameter("@ShapeType", SqlDbType.Int, 0).Value = Globals.ShapeTypes[shapeType];
            dbCmd.AddParameter("@Lifecycle", SqlDbType.Int, 0).Value = Globals.LIFECYCLE_CURRENT;
            dbCmd.AddParameter("@Function", SqlDbType.Int, 0).Value = Globals.LOGFUNCTION_SET_SHAPE;
            dbCmd.AddParameter("@Contact", SqlDbType.VarChar, 100).Value = global::System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            dbCmd.AddParameter("@Value", SqlDbType.VarChar, 100).Value = shapeName;
            dbCmd.AddParameter("@NewID", SqlDbType.Int, 0).Direction = ParameterDirection.Output;

            dbCmd.ExecuteNonQuery();

            shapeID = (int)dbCmd.GetParameter("@NewID").Value;

            dbCmd.Dispose();

            dbCmd = new PLDbCommand("SetItem_Desc", dbConn);
            dbCmd.CommandType = CommandType.StoredProcedure;

            dbCmd.AddParameter("@Table", SqlDbType.Int, 0).Value = Globals.TABLE_SHAPE;
            dbCmd.AddParameter("@ID", SqlDbType.Int, 0).Value = shapeID;
            dbCmd.AddParameter("@Value", SqlDbType.VarChar, 1000).Value = shapeDescription;
            dbCmd.AddParameter("@Function", SqlDbType.Int, 0).Value = Globals.LOGFUNCTION_SET_SHAPE;
            dbCmd.AddParameter("@Contact", SqlDbType.VarChar, 100).Value = global::System.Security.Principal.WindowsIdentity.GetCurrent().Name;

            dbCmd.ExecuteNonQuery();

            dbCmd.Dispose();
            return Globals.SUCCESS;
        }

        public static int UpdateAttribute(PLDbConnection dbConn, int shapeID, string shapeTypeAttributeName, string attributeValue)
        {
            PLDbCommand dbCmd;

            int shapeTypeAttributeID;

            // TODO: Get the attributeID for the passed in attributeName

            if ((shapeTypeAttributeID = DataAccess.GetShapeTypeAttributeID(shapeTypeAttributeName)) > 0)
            {
                dbCmd = new PLDbCommand("SetAttributeValue", dbConn);
                dbCmd.CommandType = CommandType.StoredProcedure;

                dbCmd.AddParameter("@Table", SqlDbType.Int, 0).Value = Globals.TABLE_SHAPE;
                dbCmd.AddParameter("@ID", SqlDbType.Int, 0).Value = shapeID;
                dbCmd.AddParameter("@STA_ID", SqlDbType.Int, 0).Value = shapeTypeAttributeID;
                dbCmd.AddParameter("@Function", SqlDbType.Int, 0).Value = Globals.LOGFUNCTION_SET_ATTRIBUTEVALUE;
                dbCmd.AddParameter("@Contact", SqlDbType.VarChar, 100).Value = global::System.Security.Principal.WindowsIdentity.GetCurrent().Name;
                dbCmd.AddParameter("@Value", SqlDbType.VarChar, 100).Value = attributeValue;

                dbCmd.ExecuteNonQuery();
                return Globals.SUCCESS;
            }
            else
            {
                return Globals.FAILURE;
            }
        }
        #endregion
    }
}
