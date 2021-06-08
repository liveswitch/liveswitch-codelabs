
import SwiftUI

struct TextChannelUI: View {
    @ObservedObject var model: ViewModel
    @State var userMessage = ""
    
    var body: some View {
        VStack {
            ScrollView {
                Text(model.chatMessages)
                    .padding()
            }
            TextField("Enter message",
                      text: $userMessage,
                      onCommit: {
                        // <TextChannel>
//                        model.appInstance.sendMessage(message: userMessage)
//                        userMessage = ""
                        // </TextChannel>
                      })
                .padding()
        }
    }
}

struct TextChannelButton : View {
    @Binding var toggleTextChannel: Bool
    
    var body: some View {
        Button("Text Channel") {
            toggleTextChannel.toggle()
        }
        .padding()
        .background(Color.gray)
        .foregroundColor(Color.white)
    }
}

