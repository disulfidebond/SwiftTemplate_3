//
//  ViewController.swift
//  pop
//
//  Created by Thor on 6/5/16.
//  Copyright © 2016 Thor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBAction func popoverPressed(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("popoverID") as! PopoverVC
        presentViewController(vc, animated: true, completion: nil)
        vc.popoverPresentationController?.sourceView = view
        vc.popoverPresentationController?.sourceRect = sender.frame
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "popover" {
            let popOverViewController = segue.destinationViewController as! UIViewController
            popOverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popOverViewController.popoverPresentationController!.delegate = self
            
        }
    }
    @IBAction func modalPressed(sender: UIButton) {
        performSegueWithIdentifier("modal", sender: self)
    }
    // do not modify function name
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// Notes:
// This may be changed in the near future by Apple, as Apple is moving toward streamlining everything
// there seem to be 2 methods for a popover on iPhone-iPad is fairly self-explanatory
// and follows a general rule of popover window appeaars when horizantal is big, otherwise modal
// programammatically, Swift (above) and Obj-C (below) can be used.  
// set View in IB and set transition to Popover (or Modal, see above), then 
// use @IBAction performSegueWithIdentifier("popover", sender: self)
// Note that setting a popover on iPhone can *only* be done programammatically

// Obj-C implementation, credit Robotic Cat on Stack Exchange
/* #import "TPOPViewController.h"
 
 @interface TPOPViewController () <UIPopoverPresentationControllerDelegate>//, UIAdaptivePresentationControllerDelegate>
 
 @end
 
 @implementation TPOPViewController
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
 NSString *identifier = segue.identifier;
 if ([identifier isEqualToString:@"popover"]) {
 UIViewController *dvc = segue.destinationViewController;
 UIPopoverPresentationController *ppc = dvc.popoverPresentationController;
 if (ppc) {
 ppc.delegate = self;
 }
 }
 }
 
 - (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
 
 return UIModalPresentationNone;
 }
 
 @end*/
