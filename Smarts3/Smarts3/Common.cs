using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Smarts3
{
    public static class Common
    {
        public const int FUNC_CREATE = 1;
        public const int FUNC_UPDATE = 2;
        public const int FUNC_DELETE = 3;

        public const int FUNC_RETURN = 4;
        public const int LIST_ARTIFACTS = 1;
        public const int LIST_ATTRIBUTES = 2;
        public const int LIST_SYSTEMS = 3;
        public const int LIST_OBJECTS = 4;
        public const int LIST_DEVICES = 5;
        public const int LIST_PIECES = 6;
        public const int LIST_BUSINESSES = 7;
        public const int LIST_STEPS = 8;

        public const int LIST_SHAPETYPES = 9;
        public const int EMPTY_INT = 0;

        public const string EMPTY_STR = "''";
        public const int LOGFUNCTION_SET_ARTIFACT = 1;
        public const int LOGFUNCTION_DELETE_ARTIFACT = 2;
        public const int LOGFUNCTION_SET_ATTRIBUTE = 3;
        public const int LOGFUNCTION_DELETE_ATTRIBUTE = 4;
        public const int LOGFUNCTION_SET_SHAPETYPEATTRIBUTE = 5;
        public const int LOGFUNCTION_DELETE_SHAPETYPEATTRIBUTE = 6;
        public const int LOGFUNCTION_SET_CONSTRAINEDVALUE = 7;
        public const int LOGFUNCTION_DELETE_CONSTRAINEDVALUE = 8;
        public const int LOGFUNCTION_SET_SHAPE = 9;
        public const int LOGFUNCTION_DELETE_SHAPE = 10;
        public const int LOGFUNCTION_SET_CONTAINER = 11;
        public const int LOGFUNCTION_DELETE_CONTAINER = 12;
        public const int LOGFUNCTION_SET_RELATION = 13;
        public const int LOGFUNCTION_DELETE_RELATION = 14;
        public const int LOGFUNCTION_SET_DESCRIPTION = 15;
        public const int LOGFUNCTION_SET_NAME = 16;
        public const int LOGFUNCTION_SET_ATTRIBUTEVALUE = 17;
        public const int LOGFUNCTION_SET_LIFECYCLE = 18;
        public const int LOGFUNCTION_SET_LOCATION = 19;
        public const int LOGFUNCTION_SET_CONTACT = 20;
        public const int LOGFUNCTION_SET_NOTE = 21;

        public const int LOGFUNCTION_DELETE_ATTRIBUTEVALUE = 22;
        public const int TABLE_ABSTRACTION = 1;
        public const int TABLE_ATTRIBUTE = 2;
        public const int TABLE_SHAPETYPE = 3;
        public const int TABLE_SHAPE = 4;
        public const int TABLE_SHAPETYPEATTRIBUTE = 5;
        public const int TABLE_ATTRIBUTEVALUE = 6;
        public const int TABLE_RELATION = 7;
        public const int TABLE_SDTABLE = 8;
        public const int TABLE_LOG = 9;
        public const int TABLE_CONSTRAINEDVALUES = 10;
        public const int TABLE_ARTIFACT = 11;
        public const int TABLE_CONTAINER = 12;
        public const int TABLE_SDLOGFUNCTION = 13;

        public const int TABLE_LIFECYCLE = 14;
        public const int SHAPETYPE_APPLICATION = 1;
        public const int SHAPETYPE_DATA = 2;
        public const int SHAPETYPE_BATCHFILE = 3;
        public const int SHAPETYPE_ACTOR = 4;
        public const int SHAPETYPE_FILEREPORT = 5;
        public const int SHAPETYPE_QUEUE = 6;
        public const int SHAPETYPE_JOB = 7;
        public const int SHAPETYPE_OBJECTRELATION = 8;
        public const int SHAPETYPE_SYSTEM = 9;
        public const int SHAPETYPE_SYSTEMRELATION = 10;
        public const int SHAPETYPE_SERVER = 11;
        public const int SHAPETYPE_IP = 12;
        public const int SHAPETYPE_DEVICERELATION = 13;
        public const int SHAPETYPE_DESKTOP = 14;
        public const int SHAPETYPE_MAINFRAME = 15;
        public const int SHAPETYPE_LAPTOP = 16;
        public const int SHAPETYPE_PDA = 17;
        public const int SHAPETYPE_TABLET = 18;
        public const int SHAPETYPE_PRINTER = 19;
        public const int SHAPETYPE_SAN = 20;
        public const int SHAPETYPE_FIREWALL = 21;
        public const int SHAPETYPE_LOADBALANCER = 22;
        public const int SHAPETYPE_ROUTER = 23;
        public const int SHAPETYPE_PIECE = 24;
        public const int SHAPETYPE_BUSINESS = 25;
        public const int SHAPETYPE_STEP = 26;
        public const int SHAPETYPE_DECISION = 27;
        public const int SHAPETYPE_BUSINESSRELATION = 28;
        public const int SHAPETYPE_STEPRELATION = 29;
        public const int SHAPETYPE_CROSSRELATION = 30;
        public const int SHAPETYPE_TIME = 31;
        public const int SHAPETYPE_START = 32;
        public const int SHAPETYPE_END = 33;
        public const int SHAPETYPE_SUBSTEP = 34;
        public const int SHAPETYPE_BROWSER = 35;
        public const int SHAPETYPE_SQLINSTANCE = 36;

        public const int SHAPETYPE_FOLDER = 37;
        public const int ABSTRACTION_SYSTEM = 1;
        public const int ABSTRACTION_OBJECT = 2;
        public const int ABSTRACTION_DEVICE = 3;
        public const int ABSTRACTION_SYSTEMOBJECT = 4;
        public const int ABSTRACTION_IP = 5;
        public const int ABSTRACTION_DEVICEOBJECT = 6;
        public const int ABSTRACTION_ARTIFACT = 7;
        public const int ABSTRACTION_PIECE = 8;
        public const int ABSTRACTION_OBJECTPIECE = 9;
        public const int ABSTRACTION_BUSINESS = 10;
        public const int ABSTRACTION_STEP = 11;
        public const int ABSTRACTION_BUSINESSSTEP = 12;
        public const int ABSTRACTION_RELATION = 13;
        public const int ABSTRACTION_STEPOBJECT = 14;

        public const int ABSTRACTION_SUBSTEP = 15;
        public const int LIFECYCLE_RESEARCH = 1;
        public const int LIFECYCLE_CURRENT = 2;
        public const int LIFECYCLE_CONTAIN = 3;

        public const int LIFECYCLE_RETIRE = 4;
        public const int SECURITY_ASSOC = 1;
        public const int SECURITY_ATTRIBUTE = 2;
        public const int SECURITY_SHAPE = 3;

        public const int SECURITY_SCHEMA = 4;
        public const int DIVISION_LIFE = 1;
        public const int DIVISION_ANNUITIES = 2;
        public const int DIVISION_CORPORATE = 3;
        public const int DIVISION_REALESTATE = 4;

        public const int DIVISION_SECURITIES = 5;
        public const int DIRECTION_FROM = 0;

        public const int DIRECTION_TO = 1;

        public const int STUB_intDivision = DIVISION_LIFE;
    }
}
