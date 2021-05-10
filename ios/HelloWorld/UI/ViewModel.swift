
import Foundation

class ViewModel : ObservableObject {
    
    @Published var view: UIView
    @Published var message: String
    @Published var appInstance: HelloWorldLogic
    @Published var chatMessages: String
    
    // <FileTransfer>
    @Published var onFileReceiveState: Bool
//    var currentFileData: Data
//    var currentFileName: String
    // </FileTransfer>
    
    init() {
        view = UIView()
        message = ""
        chatMessages = ""
        appInstance = HelloWorldLogic.instance
        onFileReceiveState = false
        
        // <FileTransfer>
//        currentFileData = HelloWorldLogic.instance.getDataBytes()
//        currentFileName = HelloWorldLogic.instance.getFileName()
//        appInstance.setOnFileReceiveAction(action: onFileReceive)
        // </FileTransfer>
    }
    
    func updateMessage(message: String) -> Void {
        DispatchQueue.main.async {
            self.message = message
        }
    }
    
    func start() -> Void {
        // <LocalMedia>
//        appInstance.startLocalMedia(container: view).then(resolveActionBlock: { [self] (obj: Any?) in
//            updateMessage(message: "Started Local Media")
        appInstance.joinAsync()?.then(resolveActionBlock: { [self] (obj: Any?) in
                updateMessage(message: "Joined successfully")
                
                setUpMessaging()
                
            })?.fail(rejectActionBlock: {[self] (e: NSException?) in
                updateMessage(message: "Unable to join")
            })
//        })?.fail(rejectActionBlock: {[self] (e: NSException?) in
//            updateMessage(message: "Unable to start Local Media")
//        })
        // </LocalMedia>
        
        
    }
    
    func stop() -> Void {
        // <Unregister>
//        appInstance.leaveAsync().then(resolveActionBlock: {[self] (obj: Any?) in
//            updateMessage(message: "Left successfully")
        // </Unregister>
            // <LocalMedia>
//            appInstance.stopLocalMedia().then(resolveActionBlock: {(obj: Any?) in
//                updateMessage(message: "Stopped Local Media")
//            })
            // </LocalMedia>
        // <Unregister>
//        }, rejectActionBlock: { [self] (e: NSException?) in
//            updateMessage(message: "Unable to leave channel")
//        })
        // </Unregister>
    }
    
    // <DeviceSwitching>
    func getCurrentVideoInputs() -> [SourceOption]{
        var currentVideoInputs: [SourceOption] = []
        
//        appInstance.localMedia?.getVideoSourceInputs().then(resolveActionBlock: {(result: Any?) in
//            currentVideoInputs = (result as! [FMLiveSwitchSourceInput]).map{ input in
//                SourceOption(id: input.id(), name: input.description())
//            }
//        })
//        FMLiveSwitchLog.debug(withMessage: "Video Inputs = " + String(describing: currentVideoInputs))
        return currentVideoInputs
    }
    
    func getCurrentAudioInputs() -> [SourceOption]{
        var currentAudioInputs: [SourceOption] = []
        
//        appInstance.localMedia?.getAudioSourceInputs()?.then(resolveActionBlock: {(result: Any?) in
//            currentAudioInputs = (result as! [FMLiveSwitchSourceInput]).map{input in
//                SourceOption(id: input.id(), name: input.description())
//            }
//        })
//        FMLiveSwitchLog.debug(withMessage: "Audio Inputs = " + String(describing: currentAudioInputs))
        return currentAudioInputs
    }
    // </DeviceSwitching>
    
    // <TextChannel>
    func updateChatMessages(message: String) -> Void {
//        DispatchQueue.main.async {
//            self.chatMessages = self.chatMessages + message + "\n"
//        }
    }
    
    func setUpMessaging() -> Void {
//        appInstance.setDisplayMessage(action: updateChatMessages(message:))
    }
    // </TextChannel>
 
    // <FileTransfer>
    
    func onFileReceive() -> Void {
//        let newData = appInstance.getDataBytes()
//        let newFileName = appInstance.getFileName()
//
//        if(newData != currentFileData && newFileName != currentFileName){
//            currentFileData = newData
//            currentFileName = newFileName
//            setFileReceiveState(state: true)
//        }
//        else {
//            setFileReceiveState(state: false)
//        }
    }
    
    func setFileReceiveState(state: Bool) {
//        DispatchQueue.main.async {
//            self.onFileReceiveState = state
//        }
    }
    
    // </FileTransfer>
}

struct SourceOption: Identifiable {
    var id: String
    var name: String
}
