//
//  PersonDetailSectionGenerator.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 10/27/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class PersonDetailSectionGenerator {
/*    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        let lGenerator = LabelColumnGeneartor()
        let lView = lGenerator.generate()
        stackView.addArrangedSubview(lView)
        let cGenerator = ValueColumnGenerator()
        let vView = cGenerator.generate()
        stackView.addArrangedSubview(vView)
        lView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        vView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return stackView
    }  */
    func generate() -> UIStackView {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        //
        var vGenerator : FieldValueViewGenerator!
        var sView : UIStackView!
        vGenerator = FieldValueViewGenerator(n:"Claim title")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        vGenerator = FieldValueViewGenerator(n:"Date")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        return stackView
    }
}

class buttonSectionGenerator {
    
    func generate() -> UIStackView {
        //
        let bStackView = UIStackView()
        bStackView.axis = .vertical
        bStackView.distribution = .fill
        bStackView.spacing = 20
        let btn = UIButton()
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 3
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.blue.cgColor
        bStackView.addArrangedSubview(btn)
        return bStackView
    }
}

class PersonDetailScreenGenerator {
    
    var root : UIView!
    var detailSecView : UIStackView!
    var buttonSecView : UIStackView!
    var vals : [UITextField]!
    var lbls : [UILabel]!
    var nextBtn : UIButton!
    
    init(v : UIView) {
        root = v
    }

    func setViewReference() {
        vals = [UITextField]()
        lbls = [UILabel]()
        //
        for sv in detailSecView.arrangedSubviews {  // 2 of them
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews { // 2 of them
                if ve is UITextField {
                    vals.append(ve as! UITextField)
                } else {
                    lbls.append(ve as! UILabel)
                }
            }
        }
        print("UITextField references created.")
        
        // Make UITextField readonly
        for v in vals {
            v.isUserInteractionEnabled = false
        }
        
        //
        for sv in buttonSecView.arrangedSubviews {
            let btn = sv as! UIButton
            if btn.titleLabel?.text == "Next" {
                nextBtn = btn 
            }
        }
    }
    /*
    func setTitleConstraints() {
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
    }*/
    
    func setDetailSecConstraints() {
        for i in 0...lbls.count-1 {
            lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        let constr = lbls[0].widthAnchor.constraint(equalToConstant: root.frame.width * 0.25)
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
        detailSecView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = detailSecView.topAnchor.constraint(equalTo: root.safeAreaLayoutGuide.topAnchor)
        let lCont = detailSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trCont = detailSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
    }
    
    func setButtonSecConstraints() {
        buttonSecView.translatesAutoresizingMaskIntoConstraints = false
        let tpConst = buttonSecView.topAnchor.constraint(equalTo: detailSecView.bottomAnchor)
        let trConst = buttonSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tpConst.isActive = true
        trConst.isActive = true
    }
    
    func generate() {
        //
        detailSecView = PersonDetailSectionGenerator().generate()
        print("Detail section was created. ")
        buttonSecView = buttonSectionGenerator().generate()
        print("Button section was created. ")
        root.addSubview(detailSecView)
        root.addSubview(buttonSecView)

        //
        setViewReference()
        print("setViewReference() called.")
        
        // set constraints for detailSecView
        setDetailSecConstraints()
        print("setDetailSecConstraints() called.")
        
        // set constraints for buttonSecView
        setButtonSecConstraints()
        print("setButtonSecConstraints() called.")
    }
}
