using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Threading;

namespace HelloWorld
{
    /// <summary>
    /// Hello World application for LiveSwitch Cloud, using minimal UI and code. 
    /// This example primarily uses SFU connections and the WPF C# platform.
    /// </summary>
    public class HelloWorldLogic
    {
        // Functions from the UI
        public Action1<string> DisplayMessage;
        public Action2<string, byte[]> SaveFile;

        #region Singleton
        private static HelloWorldLogic Context;

        public static HelloWorldLogic Instance
        {
            get
            {
                if(Context == null)
                {
                    Context = new HelloWorldLogic();
                }
                return Context;
            }
        }
        #endregion
        
        public string ApplicationId = Config.ApplicationId;
        public string UserId = Config.UserId;
        public string DeviceId = Config.DeviceId;
        public string ChannelId = Config.ChannelId;
        public string GatewayURL = Config.GatewayURL;
        public string SharedSecret = Config.SharedSecret;
    }
}
