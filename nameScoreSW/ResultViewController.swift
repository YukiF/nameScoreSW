//
//  ResultViewController.swift
//  nameScoreSW
//
//  Created by Yuki.F on 2015/03/10.
//  Copyright (c) 2015年 Yuki Futagami. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var myName : String = " "
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
      override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = "\(self.myName)の点数は..."
        let score = arc4random_uniform(101)
        self.scoreLabel.text = "\(score)点"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
