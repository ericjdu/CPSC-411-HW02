//
//  FieldValueViewGenerator.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 10/27/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit


class FieldValueViewGenerator : ViewController {
    
    override func refreshScreen(pObj : Person) {
        //
        
    }
    
    var lblName : String!
    
    init(n : String) {
        lblName = n
    }
    
    func generate() -> UIStackView {
       
        /*
        let headView = UIStackView()
        headView.axis = .vertical
        headView.distribution = .fill
        headView.spacing = 5
        
        let lblHead = UILabel()
        lblHead.text = "Please Enter Claim Information"
        lblHead.textAlignment = .center
        lblHead.font = UIFont(name: "Arial-BoldItalicMT", size: 24)
        lblHead.sizeToFit()
        headView.addArrangedSubview(lblHead)
        */
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        //
        let lbl = UILabel()
        lbl.text = lblName
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        let val = UITextField()
        val.delegate = self
        stackView.addArrangedSubview(val)

        return stackView
    }
}
