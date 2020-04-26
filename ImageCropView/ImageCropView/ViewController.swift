//
//  ViewController.swift
//  ImageCropView
//
//  Created by iOSFreak57 on 26/04/20.
//  Copyright © 2020 BalgeDesignStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var displayImageView:UIImageView!
    var imageCropView: ImageCropView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.initialiseCropView()
    }
    
    func initialiseCropView() {
        guard let image = UIImage(named: "natureNew") else {return}
        deInitialiseCropView()
        imageCropView = ImageCropView(frame: CGRect(x: 0, y: 0, width:
                                    self.container.frame.size.width,
                                    height: self.container.frame.size.height))
        container.addSubview(imageCropView!)
        imageCropView?.image = image
    }
    
    func deInitialiseCropView() {
        imageCropView?.removeFromSuperview()
        imageCropView = nil
    }

    @IBAction func reset(_ sender: UIButton) {
        self.initialiseCropView()
    }
    
    @IBAction func cropButtonAction(_ sender: UIButton) {
        imageCropView?.crop { (error, image) in
            if (error as NSError?) != nil {
                print("Handle error here")
            }
            self.displayImageView.image = image
        }
    }
}

