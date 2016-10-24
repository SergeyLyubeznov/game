//
//  MessageCenter.swift
//  Day
//
//  Created by Alexander Kozin on 02.06.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

class MessageCenter: NSObject {
    static let showRealErrorsToUser = true

    /**
     Shows message view to user

     - parameter message: Message text
     */
    static func showMessage(_ message: String) {
        if (!message.isEmpty) {
            showAlertView(nil, andMessage: message)
        }
    }

    /**
     Shows error message to user if 'error' exist
     Calls +showErrorIfExist:error:otherwisePerform: internally

     - parameter error: Error object for generating a message
     */
    static func showError(_ error: NSError?) {
        showErrorIfExist(error, otherwisePerform: nil)
    }

    /**
     Shows error message to user if 'error' exist, otherwise invoke 'block'
     Calls +showErrorIfExist:error:otherwisePerform: internally

     - parameter error: Error object for generating a message
     - parameter block: Handler if error is nil
     */
    static func showErrorIfExist(_ error: NSError?, otherwisePerform block: (() -> ())?) {
        showErrorIfExist(error, errorBlock: nil, otherwisePerform: block)
    }

    /**
     Shows error message to user if 'error' exist and invoke 'errorBlock', otherwise invoke 'block'

     - parameter error:      Error object for generating a message
     - parameter errorBlock: Handler if error is exist
     - parameter block:      Handler if error is nil
     */
    static func showErrorIfExist(_ error: NSError?, errorBlock:  (() -> ())?, otherwisePerform block: (() -> ())?) {
        if let error = error {
            if showRealErrorsToUser {
                showRealErrorAlertView(error)
            } else {


//                if ([self shouldShowRealErrorToUser:error])
                showRealErrorAlertView(error)
//                else
//                [MessageCenter showHostNotReachableError];
            }

            if let errorBlock = errorBlock {
                errorBlock()
            }
        } else if let block = block {
            block()
        }
    }

    static func showRealErrorAlertView(_ error: NSError?) {
        if let message = messageForError(error) {
            showAlertView(nil, andMessage: message)
        }
    }

    static func messageForError(_ error: NSError?) -> String? {
        let message: String?
        if let error = error {
            let userInfo = error.userInfo;

            message = userInfo["NSLocalizedDescription" as NSObject] as? String
            //    NSData *data = userInfo[@"com.alamofire.serialization.response.error.data"];
            //
            //    NSError *parsingError = nil;
            //    NSDictionary *errorJson = [NSJSONSerialization JSONObjectWithData:data
            //    options:kNilOptions
            //    error:&parsingError];
            //    message = errorJson[@"message"];
        } else {
            message = nil
        }
        
        return message
    }

    static func showAlertView(_ title: String?, andMessage message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: NSLocalizedString("OK"),
                                             style: .cancel,
                                             handler: nil))

        dispatchMainSyncSafe { 
            RootViewController().present(controller, animated: true, completion: nil)
        }
    }

    static func dispatchMainSyncSafe(_ block:  () -> Void) {
        if (Thread.isMainThread) {
            block()
        } else {
            DispatchQueue.main.sync(execute: block)
        }
    }
}
