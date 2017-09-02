//
//  Step04_blood.swift
//  DrChip
//
//  Created by Hyuntai on 2017/8/19.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import UIKit
import AudioToolbox

class Step04: UIViewController {
    let app = UIApplication.shared.delegate as! AppDelegate
    var countDownSecond = 5 //倒數總秒數(五分鐘)
    var currentCount = 0
    var timer: Timer? //定時執行變數
    // 單一流程第n步驟
    var index = 0
    // 紀錄單一流程
    var auditon             = [String]()
    // 所有流程資料結構
    let blood_auditon2      = ["APP-step4-02-blood-01",
                               "APP-step4-02-blood-02",
                               "APP-step4-02-blood-03",
                               "APP-step4-blood-timing"]
    let egg_auditon2        = ["APP-step4-02-egg-01",
                               "APP-step4-02-egg-02",
                               "APP-step4-02-egg-03",
                               "APP-step4-egg-timing"]
    let feed_auditon2       = ["APP-step4-02-feed-01",
                               "APP-step4-02-feed-02",
                               "APP-step4-02-feed-03",
                               "APP-step4-02-feed-04",
                               "APP-step4-feed-timing"]
    let honey_auditon2      = ["APP-step4-02-honey-01",
                               "APP-step4-02-honey-02",
                               "APP-step4-honey-timing"]
    let milk_auditon2       = ["APP-step4-02-milk-01",
                               "APP-step4-02-milk-02",
                               "APP-step4-milk-timing"]
    let royalJelly_auditon2 = ["APP-step4-02-royal-jelly-01",
                               "APP-step4-02-royal-jelly-02",
                               "APP-step4-02-royal-jelly-03",
                               "APP-step4-02-royal-jelly-04",
                               "APP-step4-royal-jelly-timing"]
    let tissue_auditon2     = ["APP-step4-02-tissue-01",
                               "APP-step4-02-tissue-02",
                               "APP-step4-02-tissue-03",
                               "APP-step4-02-tissue-04",
                               "APP-step4-tissue-timing"]
    let urine_auditon2      = ["APP-step4-02-urine-01",
                               "APP-step4-02-urine-02",
                               "APP-step4-urine-timing"]
    
    let blood_auditon35      = ["APP-step4-03-blood-01",
                                "APP-step4-03-blood-02",
                                "APP-step4-blood-timing",
                                "APP-step4-03-blood-03",
                                "APP-step4-blood-timing"]
    let egg_auditon35        = ["APP-step4-03-egg-01",
                                "APP-step4-03-egg-02",
                                "APP-step4-egg-timing",
                                "APP-step4-03-egg-03",
                                "APP-step4-egg-timing"]
    let feed_auditon35       = ["APP-step4-03-feed-01",
                                "APP-step4-03-feed-02",
                                "APP-step4-03-feed-03",
                                "APP-step4-feed-timing",
                                "APP-step4-03-feed-04",
                                "APP-step4-feed-timing"]
    let honey_auditon35      = ["APP-step4-03-honey-01",
                                "APP-step4-03-honey-02",
                                "APP-step4-honey-timing",
                                "APP-step4-03-honey-03",
                                "APP-step4-honey-timing"]
    let milk_auditon35       = ["APP-step4-03-milk-01",
                                "APP-step4-honey-timing",
                                "APP-step4-03-milk-02",
                                "APP-step4-honey-timing"]
    let royalJelly_auditon35 = ["APP-step4-03-royal-jelly-01",
                                "APP-step4-03-royal-jelly-02",
                                "APP-step4-03-royal-jelly-03",
                                "APP-step4-royal-jelly-timing",
                                "APP-step4-03-royal-jelly-04",
                                "APP-step4-royal-jelly-timing"]
    let tissue_auditon35     = ["APP-step4-03-tissue-01",
                                "APP-step4-03-tissue-02",
                                "APP-step4-03-tissue-03",
                                "APP-step4-tissue-timing",
                                "APP-step4-03-tissue-04",
                                "APP-step4-tissue-timing"]
    let urine_auditon35      = ["APP-step4-03-urine-01",
                                "APP-step4-03-urine-02",
                                "APP-step4-urine-timing"]
    
    let blood_auditon4678       = ["APP-step4-04-blood-01",
                                   "APP-step4-04-blood-02",
                                   "APP-step4-blood-timing"]
    let egg_auditon4678         = ["APP-step4-04-egg-01",
                                   "APP-step4-04-egg-02",
                                   "APP-step4-egg-timing"]
    let feed_auditon4678        = ["APP-step4-04-feed-01",
                                   "APP-step4-04-feed-02",
                                   "APP-step4-04-feed-03",
                                   "APP-step4-feed-timing"]
    let honey_auditon4678       = ["APP-step4-04-honey-01",
                                   "APP-step4-04-honey-02",
                                   "APP-step4-04-honey-03",
                                   "APP-step4-04-honey-04",
                                   "APP-step4-honey-timing"]
    let milk_auditon4678        = ["APP-step4-04-milk-01",
                                   "APP-step4-04-milk-02",
                                   "APP-step4-milk-timing"]
    let royalJelly_auditon4678  = ["APP-step4-04-royal-jelly-01",
                                   "APP-step4-04-royal-jelly-02",
                                   "APP-step4-04-royal-jelly-03",
                                   "APP-step4-royal-jelly-timing"]
    let tissue_auditon4678      = ["APP-step4-04-tissue-01",
                                   "APP-step4-04-tissue-02",
                                   "APP-step4-04-tissue-03",
                                   "APP-step4-tissue-timing"]
    let urine_auditon4678       = ["APP-step4-04-urine-01",
                                   "APP-step4-urine-timing"]
    
    @IBOutlet weak var tensOfMinute: UILabel!
    @IBOutlet weak var onesOfMinute: UILabel!
    @IBOutlet weak var tensOfSecond: UILabel!
    @IBOutlet weak var onesOfSecond: UILabel!
    @IBOutlet weak var countStack: UIStackView!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    // 切換下一流程
    @IBAction func nextClick(_ sender: Any) {
        if index < auditon.count - 1 {
            index += 1
            displaySense()
        } else {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "step04_camera") {
               show(vc, sender: self)
            }
        }
    }
    // 切換上一流程
    @IBAction func swipeBack(_ sender: Any) {
        if index == 0 {
            let step03Storyboard = UIStoryboard.init(name: "Step03", bundle: nil)
            let vc = step03Storyboard.instantiateViewController(withIdentifier: app.lastStoryboardID)
            show(vc, sender: self)
            return
        }
        index -= 1
        displaySense()
    }
    
    @IBAction func countClick(_ sender: UIButton) {
        if sender.title(for: .normal)! == "▶︎" {
            currentCount = countDownSecond
            sender.setTitle("■", for: .normal)
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                if self.currentCount == 0 {
                    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                    return
                }
                self.currentCount -= 1
                self.dispayTime(second: self.currentCount)
            })
        } else {
            timer!.invalidate() //停止定時執行
            timer = nil
            dispayTime(second: countDownSecond)
            sender.setTitle("▶︎", for: .normal)
            if currentCount == 0 {
                nextClick(sender)
            }
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 紀錄試片編號
        switch app.auditon {
        case 2:
            switch app.sample {
            case 1:
                auditon = blood_auditon2
            case 2:
                auditon = egg_auditon2
            case 3:
                auditon = feed_auditon2
            case 4:
                auditon = honey_auditon2
            case 5:
                auditon = milk_auditon2
            case 6:
                auditon = royalJelly_auditon2
            case 7:
                auditon = tissue_auditon2
            default:
                auditon = urine_auditon2
            }
        case 3, 5:
            switch app.sample {
            case 1:
                auditon = blood_auditon35
            case 2:
                auditon = egg_auditon35
            case 3:
                auditon = feed_auditon35
            case 4:
                auditon = honey_auditon35
            case 5:
                auditon = milk_auditon35
            case 6:
                auditon = royalJelly_auditon35
            case 7:
                auditon = tissue_auditon35
            default:
                auditon = urine_auditon35
            }
        default:
            switch app.sample {
            case 1:
                auditon = blood_auditon4678
            case 2:
                auditon = egg_auditon4678
            case 3:
                auditon = feed_auditon4678
            case 4:
                auditon = honey_auditon4678
            case 5:
                auditon = milk_auditon4678
            case 6:
                auditon = royalJelly_auditon4678
            case 7:
                auditon = tissue_auditon4678
            default:
                auditon = urine_auditon4678
            }
        }
        imageView.image = UIImage(named: auditon[index])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displaySense() {
        imageView.image = UIImage(named: auditon[index])
        if auditon[index].hasSuffix("timing") {
            dispayTime(second: countDownSecond)
            countStack.isHidden = false
            nextButton.isEnabled = false
        } else {
            countStack.isHidden = true
            nextButton.isEnabled = true
        }
    }
    
    func dispayTime(second: Int) {
        let minute = second / 60
        let second = second % 60
        
        tensOfMinute.text = String(minute / 10)
        onesOfMinute.text = String(minute % 10)
        tensOfSecond.text = String(second / 10)
        onesOfSecond.text = String(second % 10)
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
