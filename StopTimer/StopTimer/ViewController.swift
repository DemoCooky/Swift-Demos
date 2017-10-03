//
//  ViewController.swift
//  StopTimer
//
//  Created by 雷文雅 on 2017/10/4.
//  Copyright © 2017年 雷文雅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var playButton: UIButton!
    var pauseButton: UIButton!
    var resetButton: UIButton!
    var timeLabel: UILabel!
    
    var count = 0.0
    var timer = Timer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        timeLabel = UILabel()
        timeLabel.text = String(count)
        timeLabel.backgroundColor = UIColor.yellow
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.frame = CGRect(x:0,y:100,width:self.view.bounds.size.width,height:100)
        self.view.addSubview(timeLabel)
        //
        playButton = UIButton()
        let playImageForNormal:UIImage? = UIImage(named:"")
        let playImageForHighlighted:UIImage? = UIImage(named:"")
        playButton.setImage(playImageForNormal, for: .normal)
        playButton.setImage(playImageForHighlighted, for: .highlighted)
        playButton.setTitle("开始计时", for: .normal)
        playButton.backgroundColor = UIColor.red
        playButton.frame = CGRect(x:0,y:200,width:self.view.bounds.size.width/2,height:100)
        playButton.addTarget(self, action: #selector(ViewController.playButtonDidTouch(sender:)), for: .touchUpInside)
        self.view.addSubview(playButton)
        //
        pauseButton = UIButton()
        let pauseImageForNormal:UIImage? = UIImage(named:"")
        let pauseImageForHighlighted:UIImage? = UIImage(named:"")
        pauseButton.setImage(pauseImageForNormal, for: .normal)
        pauseButton.setImage(pauseImageForHighlighted, for: .highlighted)
        pauseButton.setTitle("停止计时", for: .normal)
        pauseButton.backgroundColor = UIColor.blue
        pauseButton.frame = CGRect(x:self.view.bounds.size.width/2,y:200,width:self.view.bounds.size.width/2,height:100)
        pauseButton.addTarget(self, action: #selector(ViewController.pauseButtonDidTouch(sender:)), for: .touchUpInside)
        self.view.addSubview(pauseButton)
        //
        resetButton = UIButton()
        resetButton.setTitle("重置", for: .normal)
        resetButton.backgroundColor = UIColor.brown
        resetButton.frame = CGRect(x:0,y:300,width:self.view.bounds.size.width,height:100)
        resetButton.addTarget(self, action: #selector(ViewController.resetButtonDidTouch(sender:)), for: .touchUpInside)
        self.view.addSubview(resetButton);
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func resetButtonDidTouch(sender: AnyObject) {
        playButton.isEnabled = true
        pauseButton.isEnabled = true
        timer.invalidate()
        isPlaying = false
        count = 0
        timeLabel.text = String(count)
    }
    
    @objc func playButtonDidTouch(sender: AnyObject) {
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    @objc func pauseButtonDidTouch(sender: AnyObject) {
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    @objc func updateTimer() {
        count = count + 0.1
        timeLabel.text = String(format: "%.1f", count)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

