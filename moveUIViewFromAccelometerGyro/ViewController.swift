//
//  ViewController.swift
//  moveUIViewFromAccelometerGyro
//
//  Created by shinokiryosei on 2015/04/07.
//  Copyright (c) 2015年 shinokiryosei. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {
    @IBOutlet weak var redRect: UIView!
    let motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("移動前のframe\(redRect.frame)")
        motionManager.accelerometerUpdateInterval = 1.0 / 6.0
//        1.0 / 60.0 は60Hz (1秒間に60回)
        
//        監視を開始する
        motionManager.startAccelerometerUpdatesToQueue(
            NSOperationQueue.mainQueue(),
            withHandler: {
            (accelerometerData: CMAccelerometerData!, error:NSError!) in println("加速度センサが監視されています")
//                加速度データを出力する
                println(accelerometerData.description)
                
//                redRectの中心座標を定数に代入
                let fromX = self.redRect.center.x
                let fromY = self.redRect.center.y
                
//                移動距離を定数に代入する
                let lenX = CGFloat(accelerometerData.acceleration.x) * 10
                let lenY = CGFloat(accelerometerData.acceleration.y) * 12
                
//                移動先の座標を設定する
                let toX = fromX + lenX
                let toY = fromY + lenY
                
//                redRectが動くように座標をredRectに反映する
                self.redRect.center = CGPointMake(toX, toY)
                

            }
        )
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

