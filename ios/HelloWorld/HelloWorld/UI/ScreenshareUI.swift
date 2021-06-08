
import SwiftUI

struct ScreenshareUI: View {
    @ObservedObject var model: ViewModel
    var body: some View {
        Button("Toggle Screenshare") {
            // <ScreenShare>
            //model.appInstance.toggleScreenShare()
            // </ScreenShare>
        }
        .padding()
        .background(Color.gray)
        .foregroundColor(Color.white)
    }
}

