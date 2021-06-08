
import SwiftUI

struct MutingOptionsUI: View {
    @ObservedObject var model : ViewModel
    @State var canToggleLocalVideo = true
    @State var canToggleLocalAudio = true
    @State var canShowOptions = false
    
    var body: some View {
        VStack {
            if (canShowOptions) {
                HStack {
                    VStack {
                        Button("Toggle Local Video Mute") {
                            // <MutingStreams>
//                            canToggleLocalVideo = false
//                            model.appInstance.toggleMuteLocalVideo().then(resolveActionBlock: {(obj : Any?) in
//                                DispatchQueue.main.async {
//                                    canToggleLocalVideo = true
//                                }
//                            })
                            // <MutingStreams>
                        }
                        .disabled(!canToggleLocalVideo)
                        .padding()
                        
                        Button("Toggle Local Audio Mute") {
                            // <MutingStreams>
//                            canToggleLocalAudio = false
//                            model.appInstance.toggleMuteLocalAudio().then(resolveActionBlock: {(obj : Any?) in
//                                DispatchQueue.main.async {
//                                    canToggleLocalAudio = true
//                                }
//                            })
                            // </MutingStreams>
                        }
                        .disabled(!canToggleLocalAudio)
                        .padding()
                    }
                    
                    VStack {
                        Button("Toggle Remote Video Disable") {
                            // <MutingStreams>
//                            model.appInstance.toggleDisableRemoteVideo()
                            // </MutingStreams>
                        }
                        .padding()
                        Button("Toggle Remote Audio Disable") {
                            // <MutingStreams>
//                            model.appInstance.toggleDisableRemoteAudio()
                            // </MutingStreams>
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


