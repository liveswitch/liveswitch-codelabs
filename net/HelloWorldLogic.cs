using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Windows.Threading;

namespace HelloWorld
{
    public class HelloWorldLogic
    {
        // Functions from the UI
        public Action1<string> DisplayMessage;
        public Action2<string, byte[]> SaveFile;

        #region Singleton
        private static HelloWorldLogic _Context;

        public static HelloWorldLogic Instance
        {
            get
            {
                if (_Context == null)
                {
                    _Context = new HelloWorldLogic();
                }
                return _Context;
            }
        }
        #endregion

        public string ApplicationId = Config.ApplicationId;
        public string ChannelId = Config.ChannelId;
        public string GatewayURL = Config.GatewayURL;
        public string SharedSecret = Config.SharedSecret;
    }
}
