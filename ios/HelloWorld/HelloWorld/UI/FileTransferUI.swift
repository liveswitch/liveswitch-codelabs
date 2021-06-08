
import SwiftUI

struct FileSendUI: View {
    @Binding var showDirectory: FileMode?
    
    var body: some View {
        Button("Send File") {
            // <FileTransfer>
//            showDirectory = .sendFile
            // </FileTransfer>
        }
        .padding()
        .background(Color.gray)
        .foregroundColor(Color.white)
    }
}

struct FileSaveUI: View {
    @ObservedObject var model: ViewModel
    @Binding var showDirectory: FileMode?
    
    var body: some View {
        // <FileTransfer>
//        if (model.onFileReceiveState) {
//            Text("New file detected, download?")
//                .padding()
//            HStack {
//                Button("Yes") {
//                    showDirectory = .saveFile
//                    model.setFileReceiveState(state: false)
//                }
//                .padding()
//                Button("No") {
//                    model.setFileReceiveState(state: false)
//                }
//                .padding()
//            }
//            .padding()
//            .border(Color.orange)
//        }
//        else {
            EmptyView()
//        }
        // </FileTransfer>
    }
}


import UniformTypeIdentifiers
import SwiftUI

let supportedTypes = [UTType.image, UTType.text, UTType.plainText, UTType.utf8PlainText, UTType.utf16ExternalPlainText, UTType.utf16PlainText, UTType.delimitedText, UTType.commaSeparatedText, UTType.tabSeparatedText, UTType.utf8TabSeparatedText, UTType.rtf, UTType.pdf, UTType.webArchive, UTType.image, UTType.jpeg, UTType.tiff, UTType.gif, UTType.png, UTType.bmp, UTType.ico, UTType.rawImage, UTType.svg, UTType.livePhoto, UTType.movie, UTType.video, UTType.audio, UTType.quickTimeMovie, UTType.mpeg, UTType.mpeg2Video, UTType.mpeg2TransportStream, UTType.mp3, UTType.mpeg4Movie, UTType.mpeg4Audio, UTType.avi, UTType.aiff, UTType.wav, UTType.midi, UTType.archive, UTType.gzip, UTType.bz2, UTType.zip, UTType.appleArchive, UTType.spreadsheet, UTType.epub]


struct SaveFilePicker: UIViewControllerRepresentable {
    var initialURL: [URL]
    var fileData: Data
    var fileName: String
    
    init(fileData: Data, fileName: String) {
        self.initialURL = [FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)[0].appendingPathComponent(fileName)]
        self.fileData = fileData
        self.fileName = fileName
    }
    
    
    func makeCoordinator() -> SaveFileCoordinator {
        return SaveFileCoordinator(initialURL: self.initialURL[0])
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SaveFilePicker>) ->
    UIDocumentPickerViewController {
        let controller: UIDocumentPickerViewController
        if (!FileManager.default.fileExists(atPath: initialURL[0].absoluteString)) {
            do {
                try fileData.write(to: initialURL[0])
            }
            catch let error {
                print(error.localizedDescription)
            }
        }
        
        controller = UIDocumentPickerViewController(forExporting: initialURL, asCopy: true)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<SaveFilePicker>) {}
}

class SaveFileCoordinator: NSObject, UIDocumentPickerDelegate, UINavigationControllerDelegate {
    var initialURL: URL
    
    init(initialURL: URL) {
        self.initialURL = initialURL
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        let fileURL = urls[0]
        do {
            if fileURL.startAccessingSecurityScopedResource() {
                try FileManager.default.moveItem(at: initialURL, to: fileURL)
            }
            fileURL.stopAccessingSecurityScopedResource()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {}
}

struct SendFilePicker: UIViewControllerRepresentable {
    
    @Binding var appReference: HelloWorldLogic
    
    func makeCoordinator() -> SendFileCoordinator {
        return SendFileCoordinator(appReference: $appReference)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SendFilePicker>) ->
    UIDocumentPickerViewController {
        let controller: UIDocumentPickerViewController
        controller = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<SendFilePicker>) {}
}

class SendFileCoordinator: NSObject, UIDocumentPickerDelegate, UINavigationControllerDelegate{
    
    @Binding var appInstance: HelloWorldLogic
    
    init(appReference: Binding<HelloWorldLogic>) {
        _appInstance = appReference
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        let fileURL = urls[0]
        let fileName = fileURL.absoluteURL.lastPathComponent
        let fileSize = fileName.count
        var fileBytes: Data?
        do {
            try fileBytes = Data(contentsOf: fileURL)
            // <FileTransfer>
            // appInstance.sendDataBytes(fileName: fileName, fileNameSize: fileSize, fileBytes: fileBytes!)
            // </FileTransfer>
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {}
}








