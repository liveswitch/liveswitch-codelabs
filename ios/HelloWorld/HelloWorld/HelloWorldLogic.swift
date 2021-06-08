
import Foundation

class HelloWorldLogic : NSObject {
    static let instance = HelloWorldLogic()

    var applicationId: String = Config.applicationId
    var channelId: String = Config.channelId
    var gatewayUrl: String = Config.gatewayUrl
    var sharedSecret: String = Config.sharedSecret
    
}
