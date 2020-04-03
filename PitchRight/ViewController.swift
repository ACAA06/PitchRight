//
//  ViewController.swift
//  PitchRight
//
//  Created by silviya on 03/04/20.
//  Copyright © 2020 CADR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var record: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stop: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        stop.isEnabled=false
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func recordAudio(_ sender: Any) {
        print("ACAA")
        recordingLabel.text="Recording in Progress"
        stop.isEnabled=true
        record.isEnabled=false
        
    }
    @IBAction func stopRecord(_ sender: Any) {
        recordingLabel.text="Tap to record"
        stop.isEnabled=false
        record.isEnabled=true
    }
    
}

