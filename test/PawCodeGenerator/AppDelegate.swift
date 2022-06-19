//
//  AppDelegate.swift
//  PawCodeGenerator
//
//  Created by Žymantas on 2021-07-06.
//

import Alamofire
import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet var window: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.sendMultipartRequest()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func sendJsonRequest() {
        /**
         JSON
         post http://127.0.0.1/anything
         */
        
        // Add Headers
        let headers: HTTPHeaders = [
            "Content-Type": "application/json; charset=utf-8",
        ]
        
        // JSON Body
        
        struct Body: Encodable {
            let barfoo: String
            let foobar: Bool
        }
        
        let body = Body(barfoo: "my string", foobar: true)
        
        // Fetch Request
        AF.request("http://127.0.0.1/anything", method: .post, parameters: body, encoder: JSONParameterEncoder.default, headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let json):
                    debugPrint("HTTP Response Body: \(json)")
                case .failure(let error):
                    print("HTTP Request failed: \(error.localizedDescription)")
                }
            }
    }
    
    func sendFormEncodedRequest() {
        /**
         Form Encoded
         post http://127.0.0.1/anything
         */
        
        // Add Headers
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded; charset=utf-8",
        ]
        
        // Form URL-Encoded Body
        
        struct Body: Encodable {
            let foobar: String
        }
        
        let body = Body(foobar: "barfoo")
        
        // Fetch Request
        AF.request("http://127.0.0.1/anything", method: .post, parameters: body, encoder: URLEncodedFormParameterEncoder.default, headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let json):
                    debugPrint("HTTP Response Body: \(json)")
                case .failure(let error):
                    print("HTTP Request failed: \(error.localizedDescription)")
                }
            }
    }
    
    func sendMultipartRequest() {
        /**
         Multipart
         post http://127.0.0.1/anything
         */
        
        // Add Headers
        let headers: HTTPHeaders = [
            "Content-Type": "multipart/form-data; charset=utf-8; boundary=__X_PAW_BOUNDARY__",
        ]
        
        // Fetch Request
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data("barfoo".utf8), withName: "foobar")
        }, to: "http://127.0.0.1/anything", method: .post, headers: headers)
        .response { response in
            switch response.result {
            case .success(let result):
                debugPrint("HTTP Response Body: \(String(data: result!, encoding: .utf8)!)")
            case .failure(let error):
                print("HTTP Request failed: \(error.localizedDescription)")
            }
        }
    }
}
