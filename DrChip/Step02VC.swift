//
//  Step02VC.swift
//  DrChip
//
//  Created by Hyuntai on 2017/8/15.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import UIKit

class Step02VC: UIViewController {
    @IBAction func scannerClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "scanner")
        show(vc!, sender: self)
    }
    @IBAction func unwindStep02(for unwindSegue: UIStoryboardSegue) {
        
    }

    @IBAction func swipeBack(_ sender: Any) {
        let step03Storyboard = UIStoryboard.init(name: "Step01", bundle: nil)
        let vc = step03Storyboard.instantiateViewController(withIdentifier: "step01")
        show(vc, sender: self)
    }
    @IBAction func auditionClick(_ sender: UIButton) {
        // 紀錄試片編號
        let app = UIApplication.shared.delegate as! AppDelegate
        app.auditon = sender.tag
        
        let step03Storyboard = UIStoryboard.init(name: "Step03", bundle: nil)
        let vc = step03Storyboard.instantiateViewController(withIdentifier: "step03_1")
        show(vc, sender: self)
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
