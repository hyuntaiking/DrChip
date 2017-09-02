//
//  CameraController.swift
//  DrChip
//
//  Created by Hyuntai on 2017/8/31.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import UIKit
import AVFoundation

class CameraController: UIViewController {
    let captureSession = AVCaptureSession()
    var backFacingCamera: AVCaptureDevice?
    var frontFacingCamera: AVCaptureDevice?
    var currentDevice: AVCaptureDevice?
    var stillImageOutput: AVCaptureStillImageOutput?
    var stillImage: UIImage?
    var cameraPreviewLayer:AVCaptureVideoPreviewLayer?
    
    @IBOutlet var cameraButton:UIButton!
    @IBOutlet weak var auditionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // 以全解析度照相來預設 session
        captureSession.sessionPreset = AVCaptureSessionPresetPhoto
        
        let devices = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo) as! [AVCaptureDevice]
        
        // 取得前後鏡頭的拍照功能
        for device in devices {
            if device.position == AVCaptureDevicePosition.back {
                backFacingCamera = device
            } else if device.position == AVCaptureDevicePosition.front {
                frontFacingCamera = device
            }
        }
        currentDevice = backFacingCamera
        
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentDevice)
            
            //設置輸出的 session 為擷取靜態圖片
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
            
            // 輸入與輸出裝置的 session 設置
            captureSession.addInput(captureDeviceInput)
            captureSession.addOutput(stillImageOutput)
            
            // 提供相機預覽
            cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            view.layer.addSublayer(cameraPreviewLayer!)
            cameraPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            cameraPreviewLayer?.frame = view.layer.frame
            
            // 將相機按鈕移到前面
            view.bringSubview(toFront: cameraButton)
            captureSession.startRunning()
            
            auditionView.layer.borderColor = UIColor.green.cgColor
            auditionView.layer.borderWidth = 2
            view.addSubview(auditionView)
            view.bringSubview(toFront: auditionView)
        } catch {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action methods
    
    @IBAction func capture(sender: UIButton) {
        let videoConnection = stillImageOutput?.connection(withMediaType: AVMediaTypeVideo)
        stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: { (imageDataSampleBuffer, error) -> Void in
            
            if let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataSampleBuffer) {
                self.stillImage = UIImage(data: imageData)
                for x in Int(self.auditionView.frame.origin.x)...Int(self.auditionView.frame.origin.x + self.auditionView.frame.width) {
                    for y in Int(self.auditionView.frame.origin.y)...Int(self.auditionView.frame.origin.y + self.auditionView.frame.height) {
                        let pointColor = self.stillImage?.getPixelColor(pos: CGPoint(x: x, y: y))
//                        print("(\(x),\(y)):\(pointColor?.ciColor.red) \(pointColor?.ciColor.green) \(pointColor?.ciColor.blue)")
                        
                    }
                    
                }
            }
        })
    }
    
}
