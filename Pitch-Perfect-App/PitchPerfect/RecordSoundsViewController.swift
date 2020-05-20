//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Hamza Khalid on 17/05/2020.
//  Copyright © 2020 Hamza Khalid. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder:AVAudioRecorder!

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    //Called after the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stopRecordingButton.isEnabled = false
    }

    //Called when the mic button is pressed
    @IBAction func recordAudio(_ sender: Any) {
        //Changing UI elements after the mic button is pressed
        recordingLabel.text="Recording in progress"
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false
        
        //Preparing the path to store audio file
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        //Start recording audio
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self //AVAudioRecorderDelegate
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    //Function to stop audio recording
    @IBAction func stopRecording(_ sender: Any) {
        stopRecordingButton.isEnabled = false
        recordButton.isEnabled = true
        recordingLabel.text = "Tap to record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    //Making sure that the recording is finished
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag:Bool){
        if flag {
            performSegue(withIdentifier: "stopRecording", sender:audioRecorder.url)
        }
        else{
            print("recording was not successfull")
        }
    }
    
    //Sends the audio URL to PlaySoundsViewController after the recording is finished and saved
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordAudioURL
        }
    }
    
}

