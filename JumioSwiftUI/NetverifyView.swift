//
//  NetverifyView.swift
//  JumioSwiftUI
//
//  Created by Jordan Cassiano on 02/03/21.
//


import SwiftUI
import Netverify

enum NetverifyStatus {
    case success(_ scanReference: String)
    
    case failure(message: String)
    
    case canceled
}

struct NetverifyView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    @Environment(\.presentationMode) var presentationMode
    
    var onComplete: ((_ status: NetverifyStatus) -> Void)?
    
    let config = JumioManager.createNetverifyConfiguration()
    
    var verifyController = VerifyController()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        config.delegate = context.coordinator
        
        verifyController.setController(config)
        
        if JumioDeviceInfo.isJailbrokenDevice() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let alert = UIAlertController(
                    title: "Error",
                    message: "Jailbreak devices cannot perform this operation!",
                    preferredStyle: .alert
                )
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    onComplete?(.failure(message: "Jailbreak devices cannot perform this operation!"))
                }))
                
                verifyController.controller!.present(alert, animated: true, completion: nil)
            }
        }
        
        return verifyController.controller!
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, NetverifyViewControllerDelegate {
        var parent: NetverifyView
        
        init(_ viewController: NetverifyView) {
            parent = viewController
        }
        
        func netverifyViewController(_ netverifyViewController: NetverifyViewController, didFinishWith documentData: NetverifyDocumentData, scanReference: String) {
            parent.verifyController.destroy()
            
            parent.presentationMode.wrappedValue.dismiss()
            if parent.onComplete != nil {
                parent.onComplete?(.success(scanReference))
            }
        }
        
        func netverifyViewController(_ netverifyViewController: NetverifyViewController, didCancelWithError error: NetverifyError?, scanReference: String?) {
            parent.verifyController.destroy()
            
            parent.presentationMode.wrappedValue.dismiss()
            if parent.onComplete != nil {
                parent.onComplete?(.canceled)
            }
        }
        
        func netverifyViewController(_ netverifyViewController: NetverifyViewController, didFinishInitializingWithError error: NetverifyError?) {
            if error != nil && parent.onComplete != nil {
                parent.onComplete?(.failure(message: error?.message ?? ""))
            }
        }
    }
}

final class VerifyController {
    var controller: NetverifyViewController?
    
    init() {}
    
    func setController(_ config: NetverifyConfiguration) {
        self.controller = NetverifyViewController(configuration: config)
    }
    
    func destroy() {
        controller!.destroy()
    }
}


struct NetverifyView_Previews: PreviewProvider {
    static var previews: some View {
        NetverifyView(onComplete: { _ in })
    }
}
