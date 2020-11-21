using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace VisioSMARTS
{
    public static class Startup
    {
        private static void Main()
        {
            System.Diagnostics.Debugger.Launch();

            MessageBox.Show("Hello From VisioSMARTS");

            int index;
            //string[] commandLine = System.Environment.GetCommandLineArgs();
            //string command = "";
            string function = "/VBCall=";

            string command = Environment.GetCommandLineArgs().Where(p => p.StartsWith("/VBCall=")).First().Substring(function.Length);

            MessageBox.Show(string.Format("command={0}", command));
            
        }
    }
}
