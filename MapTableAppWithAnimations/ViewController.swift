//
//  ViewController.swift
//  MapTableAppWithAnimations
//
//  Created by Jeffrey Linwood on 4/14/16.
//  Copyright © 2016 Jeff Linwood. All rights reserved.
//

import UIKit

import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var slidingDetailTitleLabel: UILabel!
    
    @IBOutlet var slidingDetailBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissSlidingDetail(sender: AnyObject) {
        self.view.layoutIfNeeded()
        self.slidingDetailBottomConstraint.constant = -400
        
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseInOut, animations: {
            self.view.layoutIfNeeded()
            }, completion: nil)

    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlaceCell")
        cell?.textLabel?.text = "Row \(indexPath.row)"
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.slidingDetailTitleLabel.text =  "Row \(indexPath.row)"
        self.view.layoutIfNeeded()
        self.slidingDetailBottomConstraint.constant = 0

        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseInOut, animations: {
            self.view.layoutIfNeeded()
            }, completion: nil)
    }

}

