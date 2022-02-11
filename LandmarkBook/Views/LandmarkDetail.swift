//
//  LandmarkDetail.swift
//  LandmarkBook
//
//  Created by Caner Ağkaya on 10.02.2022.
//

import UIKit

class LandmarkDetail: UIViewController {

    @IBOutlet weak var landmarkName: UILabel!
    @IBOutlet weak var landmarkImage: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkName.text = selectedLandmarkName
        landmarkImage.image = selectedLandmarkImage
        
    }
   

}
