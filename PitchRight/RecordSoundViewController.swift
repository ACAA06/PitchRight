//
//  RecordSoundViewController.swift
//  PitchRight
//
//  Created by Clement on 03/04/20.
//  Copyright © 2020 CADR. All rights reserved.
//

import UIKit
import AVFoundation
class RecordSoundViewController: UIViewController,AVAudioRecorderDelegate{
    var audioRecorder: AVAudioRecorder!
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
        recordingLabel.text="Recording in Progress"
        stop.isEnabled=true
        record.isEnabled=false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate=self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
    }
    @IBAction func stopRecord(_ sender: Any) {
        recordingLabel.text="Tap to record"
        stop.isEnabled=false
        record.isEnabled=true
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder,successfully flag:Bool)
    {
        if flag{
            performSegue(withIdentifier:"stopRecording",sender: audioRecorder.url)
        }
        else{
            print("recording was not successful")
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue,sender: Any?)
    {
        if segue.identifier=="stopRecording"{
            let playSoundsVC=segue.destination as! PlaySoundViewController
            let recordedAudioURL=sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
}

