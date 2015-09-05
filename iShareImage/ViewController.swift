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
    
    let context = CIContext(options: nil)
    
    //Declaro una variable para la clase UIImagePickerController
    var myControllerImage: UIImagePickerController!
    
    @IBAction func applyfilter(sender: UIBarButtonItem) {
    
        //Creamos el objeto imagen para luego aplicarle el filtro
        
    let inputImage = CIImage(image: imageView.image!)
        
        //Color aleatorio para aplicar como filtro
        
        let randomColor = [kCIInputAngleKey:(Double(arc4random_uniform(314)) / 100)]
        
        // Aplicamos el filtro a la imagen seleccionada
        
        let filterImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        //Renderizamos la imagen 
        
        let renderedImage = context.createCGImage(filterImage, fromRect: filterImage.extent())
        
        // Reflejando los cambios realizados en la aplicación
        
        imageView.image = UIImage(CGImage: renderedImage)
        
        
        
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
        imagePicker.allowsEditing = true
        
        //Aplication of animation change to capture image
        self.presentViewController(imagePicker, animated:true, completion:nil)
        
        //Hide title of button change image
        sender.setTitle("", forState: UIControlState.Normal)
        
        
    }
    
  //Implementamos el metodo para que se encarge de enlazar nuestro boton y realice la foto.
    @IBAction func makePhoto(sender: UIButton) {
        
        
        //Declaro el controlador
        myControllerImage = UIImagePickerController()
        
        //El delegado sera el mismo, ya que hereda de la misma clase
        myControllerImage.delegate = self
        
        //Defino el tipo de controlador, decimos que va a realizar foto, la fuente será la camara.
        myControllerImage.sourceType = .Camera
        
        //Presentamos la vista que hemos seleccionado en nuestro objeto
        presentViewController(myControllerImage, animated: true, completion: nil)
        
        
    }
  
    
    
    //Implementación del método delegado
    
    var saveImage:UIImage?
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
        
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        myControllerImage.dismissViewControllerAnimated(true, completion: nil)
            
        
            //Mostramos la imagen
            
            imageView.image = pickedImage
            
            imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            saveImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            UIImageWriteToSavedPhotosAlbum(saveImage, nil, nil, nil)
        
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

