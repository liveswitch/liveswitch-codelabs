
import SwiftUI

struct MutingOptionsUI: View {
    @ObservedObject var model : ViewModel
    @State var canToggleLocalVideo = true
    @State var canToggleLocalAudio = true
    @State var canShowOptions = false
    
    var body: some View {
        VStack {
            if(canShowOptions) {
                HStack {
                    VStack {
                        Button("Toggle Local Video Mute") {
//                            canToggleLocalVideo = false
//                            model.appInstance.toggleMuteLocalVideo().then(resolveActionBlock: {(obj : Any?) in
//                                DispatchQueue.main.async {
//                                    canToggleLocalVideo = true
//                                }
//                            })
                        }
                        .disabled(!canToggleLocalVideo)
                        .padding()
                        
                        Button("Toggle Local Audio Mute") {
//                            canToggleLocalAudio = false
//                            model.appInstance.toggleMuteLocalAudio().then(resolveActionBlock: {(obj : Any?) in
//                                DispatchQueue.main.async {
//                                    canToggleLocalAudio = true
//                                }
//                            })
                        }
                        .disabled(!canToggleLocalAudio)
                        .padding()
                    }
                    
                    VStack {
                        Button("Toggle Remote Video Disable") {
//                            model.appInstance.toggleDisableRemoteVideo()
                        }
                        .padding()
                        Button("Toggle Remote Audio Disable") {
//                            model.appInstance.toggleDisableRemoteAudio()
                        }
                        .padding()
                    }
                }
                .border(Color.orange)
                .padding()
                
            }
            Button("Muting Options") {
                canShowOptions.toggle()
            }
            .padding()
            .background(Color.gray)
            .foregroundColor(Color.white)
        }
        
    }
}


