//
//  TeacherAddTopicViewController.swift
//  UClass
//
//  Created by laurens bryan on 19/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit
import AVFoundation

class TeacherAddTopicViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, AVAudioRecorderDelegate{
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionUIView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBOutlet weak var boldButtonOutlet: UIButton!
    @IBOutlet weak var italicButtonOutlet: UIButton!
    @IBOutlet weak var underlineButtonOutlet: UIButton!
    
    
    var boldDetector: Bool = false
    var italicDetector: Bool = false
    var underlineDetector: Bool = false
    
    @IBOutlet weak var recordButton: UIButton!
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    
    
    
    @IBAction func boldButton(_ sender: Any) {
        if boldDetector == true {
            boldButtonOutlet.layer.backgroundColor = UIColor.clear.cgColor
            boldDetector = false
        } else {
            boldButtonOutlet.layer.backgroundColor = UIColor.lightGray.cgColor
            boldDetector = true
        }
    }
    @IBAction func italicButton(_ sender: Any) {
        if italicDetector == true {
            italicButtonOutlet.layer.backgroundColor = UIColor.clear.cgColor
            italicDetector = false
        } else {
            italicButtonOutlet.layer.backgroundColor = UIColor.lightGray.cgColor
            italicDetector = true
        }
    }
    @IBAction func underlineButton(_ sender: Any) {
        if underlineDetector == true {
            underlineButtonOutlet.layer.backgroundColor = UIColor.clear.cgColor
            underlineDetector = false
        } else {
            underlineButtonOutlet.layer.backgroundColor = UIColor.lightGray.cgColor
            underlineDetector = true
        }
    }
    
    @IBAction func attatchFileButton(_ sender: Any) {
        
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image,animated: true){
            //image loaded
        }
    }
    
    @IBAction func recordingButton(_ sender: Any) {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialConfiguration()
        
        //
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            //ImageOutlet.image = image
        } else {
            print("ERROR")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func initialConfiguration() {
//        descriptionTextView.layer.borderWidth = 1
//        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        descriptionUIView.layer.borderWidth = 1
        descriptionUIView.layer.cornerRadius = 10
        descriptionUIView.layer.borderColor = UIColor.lightGray.cgColor
        
        doneButton.layer.cornerRadius = 15
    }
    
    func audioRecordingPermission() {
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        // failed to record!
                    }
                }
            }
        } catch {
            // failed to record!
        }
    }
    
    func loadRecordingUI() {
        recordButton = UIButton(frame: CGRect(x: 64, y: 64, width: 128, height: 64))
        recordButton.setTitle("Tap to Record", for: .normal)
        recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
//        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        view.addSubview(recordButton)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()

            recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil

        if success {
            recordButton.setTitle("Tap to Re-record", for: .normal)
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
            // recording failed :(
        }
    }
    
    
}
