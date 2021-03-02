//
//  JumioManager.swift
//  JumioSwiftUI
//
//  Created by Jordan Cassiano on 02/03/21.
//

import Foundation
import Netverify


struct JumioManager {
    
    static func applyStyle() {
        
        // NavigationBar tintColor
        UINavigationBar.jumioAppearance().tintColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        
        // NavigationBar barTintColor
        UINavigationBar.jumioAppearance().barTintColor = UIColor(red: 11/255.0, green: 11/255.0, blue: 30/255.0, alpha: 1)
        
        // NavigationBar titleColor
        UINavigationBar.jumioAppearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)]
        
        // General appearance - deactivate blur
        NetverifyBaseView.jumioAppearance().disableBlur = true
        
        // Document Selection Button (State: Normal) - Background Color
        NetverifyDocumentSelectionButton.jumioAppearance().setBackgroundColor(UIColor(red: 61/255.0, green: 63/255.0, blue: 112/255.0, alpha: 1), for: .normal)
        
        // Document Selection Button (State: Normal) - Icon Color
        NetverifyDocumentSelectionButton.jumioAppearance().setIconColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1), for: .normal)
        
        // Document Selection Button (State: Normal) - Title Color
        NetverifyDocumentSelectionButton.jumioAppearance().setTitleColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1), for: .normal)
        
        // Document Selection Header (State: Normal) - Background Color
        NetverifyDocumentSelectionHeaderView.jumioAppearance().backgroundColor = UIColor(red: 61/255.0, green: 63/255.0, blue: 112/255.0, alpha: 1)
        
        // Document Selection Header (State: Normal) - Icon Color
        NetverifyDocumentSelectionHeaderView.jumioAppearance().iconColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        
        // Document Selection Header (State: Normal) - Title Color
        NetverifyDocumentSelectionHeaderView.jumioAppearance().titleColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        
        // Overlay Background Color
        NetverifyScanOverlayView.jumioAppearance().scanBackgroundColor = UIColor(red: 11/255.0, green: 11/255.0, blue: 30/255.0, alpha: 0.07)
        
        // General appearance - deactivate blur
        JumioBaseView.jumioAppearance().disableBlur = true
        
        // General appearance - background color
        JumioBaseView.jumioAppearance().backgroundColor = UIColor(red: 11/255.0, green: 11/255.0, blue: 30/255.0, alpha: 1)
        
        // General appearance - foreground color
        JumioBaseView.jumioAppearance().foregroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        
        // Positive Button - Background Color
        JumioPositiveButton.jumioAppearance().setBackgroundColor(UIColor(red: 61/255.0, green: 63/255.0, blue: 112/255.0, alpha: 1), for: .normal)
        
        // Negative Button - Background Color
        JumioNegativeButton.jumioAppearance().setBackgroundColor(UIColor(red: 245/255.0, green: 92/255.0, blue: 92/255.0, alpha: 1), for: .normal)
        
        // Negative Button - Border Color
        JumioNegativeButton.jumioAppearance().borderColor = UIColor(red: 245/255.0, green: 92/255.0, blue: 92/255.0, alpha: 1)
        
        // Negative Button - Title Color
        JumioNegativeButton.jumioAppearance().setTitleColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1), for: .normal)
        
        // Face Feedback Background Color
        JumioScanOverlayView.jumioAppearance().faceFeedbackBackgroundColor = UIColor(red: 61/255.0, green: 63/255.0, blue: 112/255.0, alpha: 1)
        
        // Face Oval Color
        JumioScanOverlayView.jumioAppearance().faceOvalColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        
        // Face Progress Color
        JumioScanOverlayView.jumioAppearance().faceProgressColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.51)
        
    }
    
    static func createNetverifyConfiguration() -> NetverifyConfiguration {
        let config = NetverifyConfiguration()
        
        config.apiToken = "API_TOKENN"
        config.apiSecret = "JUMIO_SECRETS"
        config.statusBarStyle = .lightContent
        //        config.enableIdentityVerification = false
        
        
        config.userReference = "USER_TOKEN"
        
        
        JumioManager.applyStyle()
        
        return config
    }
}
