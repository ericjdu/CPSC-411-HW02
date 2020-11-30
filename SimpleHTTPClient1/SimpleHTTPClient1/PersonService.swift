//
//  PersonService.swift
//  SimpleHttpClient
//
//  Created by ITLoaner on 10/1/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import Foundation

struct Person : Codable {
    var id : UUID?
    var title : String
    var date : String
    var isSolved : Bool?
    
    init(this_title:String,this_date:String){
        title=this_title
        date=this_date
    }
}

class PersonService {
    init(vc : ViewController) {
        viewController = vc
    }
    
    var viewController : ViewController
    var personList : [Person] = [Person]()
    var currentIndx : Int = 0

    func getNext() -> Person {
        currentIndx = currentIndx + 1
        return personList[currentIndx]
    }

    func isLastEntry() -> Bool {
        if currentIndx == personList.count - 1 {
            return true
        } else {
            return false
        }
        
    }
    
    func addClaim(pObj : Person) {
        // Implement logic using Async HTTP client API (POST method)
        let requestUrl = "http://localhost:8020/ClaimService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(pObj)
        //
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                // type of resp is Data
                let respStr = String(bytes: resp, encoding: .utf8)
                print("The response data sent from the server is \(respStr!)")
            } else if let respError = error {
                print("Server Error : \(respError)")
            }
        }
        task.resume()
    }
}
