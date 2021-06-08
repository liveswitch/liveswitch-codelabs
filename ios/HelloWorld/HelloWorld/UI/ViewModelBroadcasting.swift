

import Foundation

class ViewModelBroadcasting : ObservableObject {
    @Published var view: UIView
//    @Published var appInstance: Participant?
    @Published var message: String
    
    init() {
        view = UIView()
        message = ""
    }
    
    func updateMessage(message: String) {
        DispatchQueue.main.async {
            self.message = message
        }
    }
    
    func start() {
//        appInstance?.start(container: view).then(resolveActionBlock: {[self] (obj: Any?) in
//            appInstance?.joinAsync()?.then(resolveActionBlock: {[self] (obj: Any?) in
//                if (appInstance is Broadcaster) {
//                    updateMessage(message: "Broadcasting has started")
//                } else {
//                    updateMessage(message: "Receiving/subscribing has started")
//                }
//            })?.fail(rejectActionBlock: {[self] (e: NSException?) in
//                updateMessage(message: "Participant instance unable to join")
//            })
//        })?.fail(rejectActionBlock: {[self] (e: NSException?) in
//            updateMessage(message: "Participant instance unable to start")
//        })
    }
    
    func stop() -> FMLiveSwitchFuture {
        let promise = FMLiveSwitchPromise()
//        appInstance?.leaveAsync().then(resolveActionBlock: {[self] (obj: Any?) in
//            appInstance?.stop().then(resolveActionBlock: {[self] (obj: Any?) in
//                if (appInstance is Broadcaster) {
//                    updateMessage(message: "Broadcasting has successfully stopped")
//                } else {
//                    updateMessage(message: "Receiving/subscribing has successfully stopped")
//                }
//                promise?.resolve(withResult: nil)
//            })?.fail(rejectActionBlock: {[self] (e: NSException?) in
//                updateMessage(message: "Participant instance unable to stop")
//                promise?.reject(with: e)
//            })
//        })?.fail(rejectActionBlock: {[self] (e: NSException?) in
//            updateMessage(message: "Participant instance unable to leave")
//            promise?.reject(with: e)
//        })
        return promise!
    }
}
