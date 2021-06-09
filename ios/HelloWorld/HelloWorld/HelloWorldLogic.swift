
import Foundation

class HelloWorldLogic : NSObject {
    static let instance = HelloWorldLogic()

    let _applicationId: String = Config.applicationId
        let _channelId: String = Config.channelId
        let _gatewayUrl: String = Config.gatewayUrl
        let _sharedSecret: String = Config.sharedSecret
        
        func generateToken(claims: NSMutableArray) -> String {
            return FMLiveSwitchToken.generateClientRegister(
                withApplicationId: _applicationId,
                userId: (_client?.userId())!,
                deviceId: (_client?.deviceId())!,
                clientId: _client?.id(),
                clientRoles: nil,
                channelClaims: claims,
                sharedSecret: _sharedSecret)
        }
    
}
