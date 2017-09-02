//
//  Step03_3_aquatic.swift
//  DrChip
//
//  Created by Hyuntai on 2017/8/18.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import UIKit

class Step03_3_aquatic: UIViewController {
    let app = UIApplication.shared.delegate as! AppDelegate
    @IBAction func sampleClick(_ sender: UIButton) {
        app.sample = sender.tag
        let step04Storyboard = UIStoryboard.init(name: "Step04", bundle: nil)
        let vc = step04Storyboard.instantiateViewController(withIdentifier: "step04")
        show(vc, sender: self)
    }
    @IBAction func swipeBack(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "step03_2_aquatic")
        show(vc!, sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        app.lastStoryboardID = "step03_3_aquatic"
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
