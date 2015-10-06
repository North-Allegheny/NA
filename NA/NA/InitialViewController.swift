//
//  InitialViewController.swift
//  NA
//
//  Created by NA App on 10/5/15.
//  Copyright © 2015 NA App. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var instructionText: UITextView!
    @IBOutlet var googleLoginButtonView: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //connect google button
        GIDSignIn.sharedInstance().uiDelegate = self
        
        //auto Google sign in if possible
        GIDSignIn.sharedInstance().signInSilently()
        
        instructionText.alpha = 0.0
        googleLoginButtonView.alpha = 0.0
        let instructions:NSMutableAttributedString = NSMutableAttributedString(string: "Welcome\n\nTo begin, please sign in to your Google Apps, Tyler SIS, and Blackboard accounts.")
        instructions.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(23), range: NSRange(location: 0,length: 7))
        instructions.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(20), range: NSRange(location: 8,length: instructions.length - 1 - 7))
        instructionText.attributedText = instructions
        instructionText.textAlignment = NSTextAlignment.Center

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() 
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //insert into variables
        let logoWidth = logoImage.frame.size.width
        let logoHeight = logoImage.frame.size.height
        let viewWidth = self.view.frame.size.width
        let viewHeight = self.view.frame.size.height
        let newX = self.logoImage.frame.minX
        //status bar+navigation bar
        let newY = UIApplication.sharedApplication().statusBarFrame.size.height - 20
        
        //animate the logo
        UIView.animateWithDuration(1.0, delay:0.02, options: .CurveEaseIn, animations: {
            self.logoImage.frame = CGRectMake(newX, newY, logoWidth, logoHeight)
            }, completion: nil)
        //animate the text and button with a slight delay, but same overall time
        UIView.animateWithDuration(0.48, delay: 0.5, options: .CurveEaseIn, animations: {
            self.instructionText.alpha = 1.0
            self.googleLoginButtonView.alpha = 1.0
            }, completion: nil)
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
