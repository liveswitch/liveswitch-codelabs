
import SwiftUI

struct BroadcastingUI: View {
    @ObservedObject var model: ViewModelBroadcasting
    @State var broadcastDisabled = false
    @State var receiverDisabled = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Broadcast") {
                    // <Broadcasting>
//                    if (model.appInstance is Receiver) {
//                        model.stop()
//                    }
//
//                    model.appInstance = Broadcaster.instance
//                    model.start()
//                    broadcastDisabled = true
//                    receiverDisabled = !broadcastDisabled
                    // </Broadcasting>
                    
                }
                .padding()
                .disabled(broadcastDisabled)
                Text(model.message)
                    .padding()
                Button("Subscribe") {
                    // <Broadcasting>
//                    if (model.appInstance is Broadcaster) {
//                        model.stop()
//                    }
//
//                    model.appInstance = Receiver.instance
//                    model.start()
//                    receiverDisabled = true
//                    broadcastDisabled = !receiverDisabled
                    // </Broadcasting>
                
                }
                .padding()
                .disabled(receiverDisabled)
            }
            VideoView(view: $model.view)
                .padding()
        }.onDisappear(perform: {
//            model.stop()
        })
    }
    
}

struct BroadcastingButton: View {
    @Binding var toggleBroadcasting: Bool
    
    var body: some View {
        Button("Broadcasting") {
            toggleBroadcasting.toggle()
        }
        .padding()
        .background(Color.gray)
        .foregroundColor(Color.white)
    }
}
