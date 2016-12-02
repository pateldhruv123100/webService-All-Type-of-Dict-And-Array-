//
//  ThirdViewController.swift
//  WebService_swift
//
//  Created by i mac meridian on 12/2/16.
//  Copyright © 2016 i mac meridian. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
        @IBOutlet weak var tblView: UITableView!
        
        var arrData = NSArray()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.tblView.separatorStyle = .none
            self.WebService()
            
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        func WebService() -> Void {
            let url = NSURL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")!
            
            let task = URLSession.shared.dataTask(with: url as URL) { (data, response, error) -> Void in
                if data != nil {
                    do {
                        
                        let JsonData = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments) as! NSDictionary
                        
                        self.arrData = JsonData.value(forKey: "actors")! as! NSArray
                        print(self.arrData[0])
                        self.tblView.reloadData()
                        
                        
                    } catch {
                        print("JSON serialization failed")
                    }
                    
                } else {
                    print("ERROR FOUND HERE")
                }
            }
            task.resume()
        }
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
            
        {
            return arrData.count
        }
        
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
            
            let LblName = cell.viewWithTag(100) as! UILabel
            
            
            let LblDisc = cell.viewWithTag(200) as! UILabel
            let ImageString = (self.arrData[indexPath.row] as! NSDictionary).value(forKey: "image") as? String
            
            let ImageView = cell.viewWithTag(300) as! UIImageView
            let URL = NSURL(string : ImageString!)
            let data = NSData (contentsOf: URL as! URL)
            DispatchQueue.main.async {
                LblName.text = (self.arrData[indexPath.row] as! NSDictionary).value(forKey: "name") as? String
                LblDisc.text = (self.arrData[indexPath.row] as! NSDictionary).value(forKey: "description") as? String
                ImageView.image = UIImage(data: data as! Data)
            }
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let ImagePath = (self.arrData[indexPath.row] as! NSDictionary).value(forKey: "image") as? NSString
            let mapViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
            //let Discription = (self.arrData[indexPath.row] as! NSDictionary).value(forKey: "description") as? NSString
           // mapViewControllerObj?.DiscriptionStr = Discription!
            mapViewControllerObj?.ImageStr = ImagePath!
            self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
            
            
            print(indexPath.row)
        }
}
