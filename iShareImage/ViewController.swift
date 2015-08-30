//
//  ViewController.swift
//  iShareImage
//
//  Created by Juan Morillo on 30/8/15.
//  Copyright (c) 2015 JuanMorillios. All rights reserved.
//

import UIKit
import Social


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    @IBAction func applyfilter(sender: UIBarButtonItem) {
        
        
    }
    
    
    @IBAction func shareToTwitter(sender: UIBarButtonItem) {
        
        //Implementation Share to Twitter
        
        let posCreator = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        if setViewPostCreator(posCreator){
        
            self.presentViewController(posCreator, animated:true, completion:nil)
        
        
        }
        
        
    }
    
    
    @IBAction func shareToFacebook(sender: UIBarButtonItem) {
        
        let posCreator = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
        if setViewPostCreator(posCreator){
        
            self.presentViewController(posCreator, animated:true, completion: nil)
        
        }
        
        
    }
    
    private func setViewPostCreator(ViewController:SLComposeViewController) -> Bool {
        
        if let selectedImage = imageView.image {
            
            ViewController.setInitialText("Publising for iShareImage.")
            
            ViewController.addImage(selectedImage)
            
            return true
                    }
        
        return false
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
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
        
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
            
        
            //Mostramos la imagen
            
            imageView.image = pickedImage
        
        }
        
        dismissViewControllerAnimated(true, completion: nil)
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

