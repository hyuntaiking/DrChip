//
//  Step03VC.swift
//  DrChip
//
//  Created by Hyuntai on 2017/8/15.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import UIKit

class Step03_1VC: UIViewController {
    let app = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var aquaticButton: UIButton!
    @IBOutlet weak var beeButton: UIButton!
    @IBAction func swipeBack(_ sender: Any) {
        let step03Storyboard = UIStoryboard.init(name: "Step02", bundle: nil)
        let vc = step03Storyboard.instantiateViewController(withIdentifier: "step02")
        show(vc, sender: self)
    }
    @IBAction func humanClick(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "step03_3_human") {
            show(vc, sender: self)
        }
    }
    @IBAction func livestockClick(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "step03_2_livestock") {
            show(vc, sender: self)
        }
    }
    @IBAction func poultryClick(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "step03_2_poultry") {
            show(vc, sender: self)
        }
    }
    @IBAction func aquaticClick(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "step03_2_aquatic") {
            show(vc, sender: self)
        }
    }
    @IBAction func beeproductClick(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "step03_3_beeproduct") {
            show(vc, sender: self)
        }
    }
    @IBAction func step02Click(_ sender: Any) {
        let step03Storyboard = UIStoryboard.init(name: "Step02", bundle: nil)
        let vc = step03Storyboard.instantiateViewController(withIdentifier: "step02")
        show(vc, sender: self)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if app.auditon >= 6 {
            aquaticButton.isHidden = true
            beeButton.isHidden     = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
