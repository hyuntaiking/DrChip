//
//  Step03_2_poultry.swift
//  DrChip
//
//  Created by Hyuntai on 2017/8/15.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import UIKit

class Step03_2_poultry: UIViewController {
    @IBAction func swipeBack(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "step03_1")
        show(vc!, sender: self)
    }
    @IBAction func buttonsClick(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "step03_3_poultry") {
            show(vc, sender: self)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
