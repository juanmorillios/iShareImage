//
//  ViewController.swift
//  iShareImage
//
//  Created by Juan Morillo on 30/8/15.
//  Copyright (c) 2015 JuanMorillios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    @IBAction func applyfilter(sender: UIBarButtonItem) {
        
        
    }
    
    
    @IBAction func shareToTwitter(sender: UIBarButtonItem) {
        
        
    }
    
    
    @IBAction func shareToFacebook(sender: UIBarButtonItem) {
        
        
    }
    
    
    @IBAction func changeImage(sender: UIButton) {
        
    //Select image to change
        
        let imagePicker = UIImagePickerController()
        
        
        //Delegate
        imagePicker.delegate = self
        
        //Source of image
        
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
       
        //Editing image = false
        imagePicker.allowsEditing = false
        
        //Aplication of animation change to capture image
        self.presentViewController(imagePicker, animated:true, completion:nil)
        
        //Hide title of button change image
        sender.setTitle("", forState: UIControlState.Normal)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

