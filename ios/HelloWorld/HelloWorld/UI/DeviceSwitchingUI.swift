
import SwiftUI

struct DeviceSwitchingUI: View {
    @ObservedObject var model : ViewModel
    @State var toggleVideoInputs: Bool = false
    @State var toggleAudioInputs: Bool = false
    @State var showDeviceSwitchingUI: Bool = false
    
    var body: some View {
        VStack {
            if (showDeviceSwitchingUI) {
                HStack {
                    VStack {
                        Button("Audio source inputs") {
                            toggleAudioInputs.toggle()
                        }
                        .aspectRatio(1.5, contentMode: .fill)
                        .padding()
                        if toggleAudioInputs {
                            // <DeviceSwitching>
//                            List(model.getCurrentAudioInputs(), id: \.id){ audioInput in
//                                Button(String(describing: audioInput.name)) {
//                                    model.appInstance.setAudioSourceInput(sourceInputId: audioInput.id)
//                                }
//                            }
//                            .padding()
                            // </DeviceSwitching>
                        }
                    }
                    .aspectRatio(1.25, contentMode: .fill)
                    .border(Color.orange)
                    VStack {
                        Button("Video source inputs") {
                            toggleVideoInputs.toggle()
                        }
                        .aspectRatio(1.5, contentMode: .fill)
                        .padding()
                        if toggleVideoInputs {
                            // <DeviceSwitching>
//                            List(model.getCurrentVideoInputs(), id: \.id){ videoInput in
//                                Button(String(describing: videoInput.name)) {
//                                    model.appInstance.setVideoSourceInput(sourceInputId: videoInput.id)
//                                }
//                            }
//                            .padding()
                            // </DeviceSwitching>
                        }
                    }
                    .aspectRatio(1.25, contentMode: .fill)
                    .border(Color.orange)
                    
                    VStack {
                        Text("Audio source outputs")
                            .padding()
                            .foregroundColor(Color.blue)
//                        Button("Bluetooth/Earpiece/Wired") {
//                            model.appInstance.setAudioToExternal()
//                        }
//                        .foregroundColor(Color.black)
//                        .padding()
//                        .scaledToFill()
                        
                        Divider().background(Color.black)
                        
//                        Button("Speaker") {
//                            model.appInstance.setAudioToSpeaker()
//                        }
//                        .foregroundColor(Color.black)
//                        .padding()
//                        .scaledToFill()
                    }
                    .aspectRatio(1.25, contentMode: .fill)
                    .border(Color.orange)
                    .padding()
                }
            }
            
            Button("Device Switching") {
                showDeviceSwitchingUI.toggle()
                toggleVideoInputs = true
                toggleAudioInputs = true
            }
            .padding()
            .background(Color.gray)
            .foregroundColor(Color.white)
        }
    }
}

