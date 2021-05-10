
import SwiftUI

struct ScreenshareUI: View {
    @ObservedObject var model: ViewModel
    var body: some View {
        Button("Toggle Screenshare") {
            //model.appInstance.toggleScreenShare()
        }
        .padding()
        .background(Color.gray)
        .foregroundColor(Color.white)
    }
}

