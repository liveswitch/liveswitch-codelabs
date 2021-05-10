
import SwiftUI

struct Content: View {
    
    @ObservedObject var model: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button("Join") {
                    model.start()
                }
                .padding()
                Text(model.message)
                    .padding()
                Button("Leave"){
                    model.stop()
                }
                .padding()
            }
            VideoView(view: $model.view)
                .padding()
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var model = ViewModel()
    @ObservedObject var modelBroadcasting = ViewModelBroadcasting()
    @State var enableTextChat = false
    @State var enableBroadcast = false
    @State var fileMode: FileMode?

    
    var body: some View {
        VStack {
            HStack {
                if(enableBroadcast) {
                    BroadcastingUI(model: modelBroadcasting)
                        .onAppear(perform: {
                            model.stop()
                        })
                        .onDisappear(perform: {
                            modelBroadcasting.stop()
                        })
                }
                else {
                    if(enableTextChat) {
                        TextChannelUI(model: model)
                    }
                    else {
                        Content(model: model)
                    }
                }
            }
            ScrollView(.horizontal) {
                HStack {
                    TextChannelButton(toggleTextChannel: $enableTextChat)
                    BroadcastingButton(toggleBroadcasting: $enableBroadcast)
                    ScreenshareUI(model: model)
                    DeviceSwitchingUI(model: model)
                    MutingOptionsUI(model: model)
                    FileSendUI(showDirectory: $fileMode)
                }
            }
            if(model.onFileReceiveState){
                FileSaveUI(model: model, showDirectory: $fileMode)
            }
            
        }
        // <FileTransfer>
//        .sheet(item: $fileMode) { item in
//            switch item {
//            case .sendFile:
//                SendFilePicker(appReference: $model.appInstance)
//            case .saveFile:
//                SaveFilePicker(fileData: model.currentFileData, fileName: model.currentFileName)
//            }
//        }
        // </FileTransfer>
    }
    
}

enum FileMode: Identifiable {
    case sendFile, saveFile
    
    var id: Int {
        hashValue
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Wrapper for UIView, so that it is compatible
// with SwiftUI
struct VideoView: UIViewRepresentable {
    @Binding var view: UIView
    
    func makeUIView(context: Context) -> some UIView {
        let newView = view
        return newView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
}
