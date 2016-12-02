//
//  SecondViewController.swift
//  WebService_swift
//
//  Created by i mac meridian on 12/1/16.
//  Copyright © 2016 i mac meridian. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var ImageStr = NSString()
    var DiscriptionStr = String()
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(DiscriptionStr)
       // let URl = NSURL(string: ImageStr as String)
     //    let data = NSData (contentsOf: URl as! URL)
       // imageView.image = UIImage (data: data as! Data)
       // textView.text = DiscriptionStr as String
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
