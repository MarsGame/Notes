//
//  ShareViewController.swift
//  Notes Widget
//
//  Created by YuKunquan on 01/09/2017.
//  Copyright © 2017 YuKunquan. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
        if let item = extensionContext?.inputItems.first as? NSExtensionItem {
            let itemProvider = item.attachments?.first as? NSItemProvider
            //            let propertyList = String(kUTTypePropertyList)
            if (itemProvider?.hasItemConformingToTypeIdentifier("public.plain-text"))! {
                itemProvider?.loadItem(forTypeIdentifier: "public.plain-text", options: nil, completionHandler: { (decoder, error) -> Void in
                    if let text = decoder as? NSString {
                        print(text)
                        let paragraph = NSMutableParagraphStyle.init()
                        paragraph.lineBreakMode = NSLineBreakMode.byWordWrapping
                        
                        
                        let attributes = [
                            NSAttributedStringKey.backgroundColor: UIColor.white,
                            NSAttributedStringKey.foregroundColor: UIColor.black,
                            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 22),
                            NSAttributedStringKey.paragraphStyle: paragraph
                            
                        ]
//                        let textSize = text.size(withAttributes: attributes)
                        let imageRect = text.boundingRect(with: CGSize.init(width: UIScreen.main.bounds.width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
                        let imageSize = CGSize.init(width: UIScreen.main.bounds.width, height: ceil(imageRect.size.height))
                        
                        print("---------------")
                        print(UIScreen.main.bounds.size)
                        
                        print("---------------")
                        print(imageSize)
                        
                        print("---------------")
                        print(UIScreen.main.scale)
                        
                        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
                        
                        let imagePoint = CGPoint(x: 0, y: 0)
                        let imageRange = CGRect.init(origin: imagePoint, size: imageSize)
                        text.draw(in: imageRange, withAttributes: attributes)
                        let image = UIGraphicsGetImageFromCurrentImageContext()
                        UIGraphicsEndImageContext()
                        
                        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
                    }
                })
            }
        }
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
