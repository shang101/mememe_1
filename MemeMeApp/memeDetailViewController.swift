//
//  memeDetailViewController.swift
//  MemeMeApp
//
//  Created by Shirley Hang on 5/20/15.
//  Copyright (c) 2015 att. All rights reserved.
//

import UIKit

class memeDetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailText: UILabel!
    
    var thisMeme: Meme
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
