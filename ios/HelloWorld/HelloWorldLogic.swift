
import Foundation

class HelloWorldLogic : NSObject {
    static let instance = HelloWorldLogic()

    var applicationId: String = Config.applicationId
    var userId: String = Config.userId
    var deviceId: String = Config.deviceId
    var channelId: String = Config.channelId
    var gatewayUrl: String = Config.gatewayUrl
    var sharedSecret: String = Config.sharedSecret
    
}
