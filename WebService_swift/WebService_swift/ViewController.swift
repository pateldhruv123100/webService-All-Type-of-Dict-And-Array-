//
//  ViewController.swift
//  WebService_swift
//
//  Created by i mac meridian on 11/29/16.
//  Copyright © 2016 i mac meridian. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    @IBOutlet weak var tblView: UITableView!
    
    var arrData = NSDictionary()
    var arrDict = String()
    var ImageData = NSArray()
    var Arrlist = NSArray()
    var dic = NSDictionary()
     var dict = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tblView.separatorStyle = .none
        self.WebService()
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func WebService() -> Void {
        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/forecast/daily?id=524901&appid=381f169915fd722ff084a1a2982bc16b")!
      
        let task = URLSession.shared.dataTask(with: url as URL) { (data, response, error) -> Void in
            if data != nil {
                do {
                    self.arrData = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments) as! NSDictionary
                    
                   self.Arrlist = self.arrData.value(forKey: "list")! as! NSArray
                   self.ImageData = self.Arrlist.value(forKey: "weather") as! NSArray
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
        return ImageData.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
         var LblName = UILabel()
         LblName = cell.viewWithTag(100) as! UILabel
        
            self.dict = self.ImageData[indexPath.row] as! NSArray
            self.dic = dict[0] as! NSDictionary
            LblName.text = self.arrDict.appending(dic.value(forKey: "description") as! String)

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let ImagePath = (self.arrData[indexPath.row] as! NSDictionary).value(forKey: "image") as? NSString
         let mapViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        self.dict = self.ImageData[indexPath.row] as! NSArray
        self.dic = dict[0] as! NSDictionary
        let Discription = self.arrDict.appending(self.dic.value(forKey: "description") as! String)
        mapViewControllerObj?.DiscriptionStr = Discription
       // mapViewControllerObj?.ImageStr = ImagePath!
        self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
        print(indexPath.row)
    }
}
