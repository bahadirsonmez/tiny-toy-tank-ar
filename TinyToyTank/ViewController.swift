//
//  ViewController.swift
//  TinyToyTank
//
//  Created by Bahadır Sönmez on 10.11.2021.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
        
    @IBOutlet weak var arView: ARView!
    var tankAnchor: TinyToyTank._TinyToyTank?
    
    var isActionPlaying: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        
        tankAnchor!.cannon?.setParent(tankAnchor!.tank, preservingWorldTransform: true)
        
        tankAnchor?.actions.actionComplete.onAction = { _ in
          self.isActionPlaying = false
        }
        
        arView.scene.anchors.append(tankAnchor!)
    }
    
    @IBAction func turretRightButtonPressed(_ sender: UIButton) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.turretRight.post()
    }
    
    @IBAction func turretLeftButtonPressed(_ sender: UIButton) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.turretLeft.post()
    }
    
    @IBAction func fireButtonPressed(_ sender: UIButton) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.cannonFire.post()
    }
    
    @IBAction func moveRightButton(_ sender: UIButton) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.tankRight.post()
    }
    
    @IBAction func moveLeftButton(_ sender: UIButton) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.tankLeft.post()
    }
    
    @IBAction func moveForwardButton(_ sender: UIButton) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.tankForward.post()
    }
}
