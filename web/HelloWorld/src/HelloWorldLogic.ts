namespace HelloWorld {

    export class HelloWorldLogic {

        public displayMessage: fm.liveswitch.IAction1<string>;
        public saveFile: fm.liveswitch.IAction2<string, Uint8Array>;

        // <SingletonPattern>
        private static instance: HelloWorldLogic;

        public static getInstance(): HelloWorldLogic {
            if (HelloWorldLogic.instance == null) {
                HelloWorldLogic.instance = new HelloWorldLogic();
            }
            return HelloWorldLogic.instance;
        }
        // </SingletonPattern>

        private applicationId: string = Config.applicationId;
        private userId: string = Config.userId;
        private deviceId: string = Config.deviceId;
        private channelId: string = Config.channelId;
        private gatewayUrl: string = Config.gatewayUrl;
        private sharedSecret: string = Config.sharedSecret;
    }

}