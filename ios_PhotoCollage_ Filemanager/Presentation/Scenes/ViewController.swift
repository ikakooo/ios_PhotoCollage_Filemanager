//
//  ViewController.swift
//  ios_PhotoCollage_ Filemanager
//
//  Created by MacBook Pro on 14.11.21.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var newPhotoCollageStackView: UIStackView!
    
    var imagePicker = UIImagePickerController()
    
    
    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "logo_haskell")
        theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        return theImageView
    }()
    let someImageView2: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "logo_haskell")
        theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        return theImageView
    }()
    let someImageView3: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "logo_haskell")
        theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        return theImageView
    }()
    let someImageView4: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "logo_python")
        theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        return theImageView
    }()
    let someImageView5: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "logo_javascript")
        theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        return theImageView
    }()
    
    func newImageView(img:UIImage)->UIImageView{
        {
            let theImageView = UIImageView()
            theImageView.image = img
            theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
            return theImageView
        }()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
//         newPhotoCollageStackView.addArrangedSubview(someImageView)
//        newPhotoCollageStackView.addArrangedSubview(someImageView2)
        newPhotoCollageStackView.addArrangedSubview(someImageView3)
        newPhotoCollageStackView.addArrangedSubview(someImageView4)
        newPhotoCollageStackView.addArrangedSubview(someImageView5)
        //        newPhotoCollageStackView.insertArrangedSubview(someImageView, at: 0)
        //        newPhotoCollageStackView.insertArrangedSubview(someImageView, at: 1)
        //        newPhotoCollageStackView.insertArrangedSubview(someImageView, at: 2)
        //        newPhotoCollageStackView.insertArrangedSubview(someImageView, at: 3)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSaveCollage(_ sender: Any) {
        let jsdfdh = newPhotoCollageStackView as UIView
        
        guard let image = jsdfdh.makeSnapshot() else {return}
        
      //  newPhotoCollageStackView.addArrangedSubview(newImageView(img: image))
        
      let PhotoSaved =   saveImage(image: image)
        print("Photo saved: \(PhotoSaved)")
    }
    
    @IBAction func onClearClick(_ sender: Any) {
        newPhotoCollageStackView.removeAllArrangedSubviews()
    }
    @IBAction func onAddPhotoClick(_ sender: Any) {
        
        ImagePickerManager().pickImage(self){ image in
               //here is the image
            self.newPhotoCollageStackView.addArrangedSubview(self.newImageView(img: image))
           }
    }
        }
    
  
    
    func saveImage(image: UIImage) -> Bool{
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) as NSURL else {
            return false
        }
        do{
            
            let randomName = UUID().uuidString
            try data.write(to: directory.appendingPathComponent("\(randomName).png")!)
            print(directory)
            print(data)
            print("si se pudo")
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    } // saveImage
    
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }


