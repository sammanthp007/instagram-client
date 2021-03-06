//
//  HomeViewController.swift
//  instagram
//
//  Created by samman ios on 3/20/17.
//  Copyright © 2017 samman ios. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class HomeViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
     var posts = [PFObject]()
    func getData(){
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) -> Void in
            if let posts = posts {
                self.posts = posts
                print("Post is : ", posts)
                // do something with the data fetched
            } else {
                print("Error! : ", error?.localizedDescription)
                // handle error
            }
            self.tableView.reloadData()
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        
        
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (self.posts.count)
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! HomeTableViewCell
        let post = posts[indexPath.row]
        let caption = post["caption"] as? String
        let photoPFFile = post["media"] as? PFFile
        print("PhotoPFFFile is : ", photoPFFile)
        print("Till here working")
        cell.workingImageView.file = photoPFFile
        print("Not working after this")
        cell.workingImageView.loadInBackground()
        
        cell.captionLabel.text = caption
        return cell
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
