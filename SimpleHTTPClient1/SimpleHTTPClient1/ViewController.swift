//
//  ViewController.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 10/6/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{

    func refreshScreen(pObj: Person) {
        vals[0].delegate = self
        vals[1].delegate = self
    }
    
    var lbls = [UILabel]()
    var vals = [UITextField]()
    var nextBtn : UIButton!
    var pService : PersonService!

    @objc func userAddClaim(sender: UIButton) {
        //
        //Upon the user's button input, the function will create a new claim using the information input by the user, add it to the database, and clear the text found in the textbox
        var claim : Person!

        refreshScreen(pObj: pService.getNext())
        refreshScreen(pObj: Person(claim.title: "First Title", claim.date: "2020-10-24"))
        
    }

    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 1.Prepare the UI Screen
        let vGenerator = PersonDetailSectionGenerator()
        let sView = vGenerator.generate()
        //
        view.addSubview(sView)
        //
        let cViews = sView.arrangedSubviews
        //vals = [UITextField]()
        for sv in cViews {  // 3 of them
            let innerStackView = sv as! UIStackView
            let cnt = innerStackView.arrangedSubviews.count
            if cnt > 1 {
                for ve in innerStackView.arrangedSubviews { // 2 of them
                    if ve is UITextField {
                        vals.append(ve as! UITextField)
                    } else {
                        lbls.append(ve as! UILabel)
                    }
                }
            } else {
                nextBtn = innerStackView.arrangedSubviews[0] as? UIButton
            }
        }
        for i in 0...lbls.count-1 {
            lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        let constr = lbls[0].widthAnchor.constraint(equalToConstant: view.frame.width * 0.25)
        constr.isActive = true
        //
        for i in 0...lbls.count-1 {
            lbls[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = lbls[i].trailingAnchor.constraint(equalTo: lbls[0].trailingAnchor)
            constr.isActive = true
        }
        //
        for i in 0...vals.count-1 {
            //vals[i].setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            vals[i].setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
 
        //
        sView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = sView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let lCont = sView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trCont = sView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
        //
        nextBtn.addTarget(self, action: #selector(goNextPerson), for: .touchUpInside)

        // 2. Retrieve data
        pService = PersonService(vc : self)
        // Testing getAll() method
        pService.getAll()

    }
 */
 
}

