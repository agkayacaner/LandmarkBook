//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Caner Ağkaya on 10.02.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var landmarkImages = [UIImage]()
    var landmkarNames = [String]()
    
    var choosenLandmarkName = ""
    var choosenLandmarkImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
   
        landmkarNames.append("Collesium")
        landmkarNames.append("Tajmahal")
        landmkarNames.append("Great Wall")
        landmkarNames.append("Stonehenge")
     
        landmarkImages.append(UIImage(named: "collesium")!)
        landmarkImages.append(UIImage(named: "tajmahal")!)
        landmarkImages.append(UIImage(named: "greatwall")!)
        landmarkImages.append(UIImage(named: "stonehenge")!)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmkarNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmkarNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmkarNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenLandmarkName = landmkarNames[indexPath.row]
        choosenLandmarkImage = landmarkImages[indexPath.row]
        
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            
            let destinationVC = segue.destination as! LandmarkDetail
            destinationVC.selectedLandmarkImage = choosenLandmarkImage
            destinationVC.selectedLandmarkName = choosenLandmarkName
            
        }
    }
    
}

