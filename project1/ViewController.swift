//
//  ViewController.swift
//  project1
//
//  Created by Abdalla Elsaman on 2/17/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Do any additional setup after loading the view, typically from a nib.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        var items = try! fm.contentsOfDirectory(atPath: path)
        items.sort()
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.pictureNumOfSize = PictureNumOfSize(Index: indexPath.row+1, size: pictures.count)
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

