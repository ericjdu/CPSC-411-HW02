//
//  DetailViewController.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 11/4/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class DetailViewController : ViewController {

    override func refreshScreen(pObj : Person) {
        //
        detailScreenGenerator.vals[0].delegate = self
        detailScreenGenerator.vals[1].delegate = self
        
    }

    var detailScreenGenerator : PersonDetailScreenGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        //1. Create screen
        detailScreenGenerator = PersonDetailScreenGenerator(v: view)
        print("Screen generator initialized. ")
        detailScreenGenerator.generate()
        
        // 2. Prepare data
        pService = PersonService(vc : self)
//        pService.getAll()
        
        // 3. Set the event handling
        let nBtn = detailScreenGenerator.nextBtn
        nBtn?.addTarget(self, action: #selector(goNextPerson(sender:)), for: .touchUpInside)
    }
}
