//
//  tbcMain_ViewController.swift
//  MakeupAddiction
//
//  Created by Stephen Shellenberger on 4/10/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation;
import UIKit;

class tbcMain : UITabBarController, UITabBarControllerDelegate
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(animated: Bool)
    {
        let item1 = pvcFeed_Entry(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil);
        let controllers = [item1];  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers;
    }
    
    //Delegate methods
    func tabBarController(tabBarController: UITabBarController
                        , shouldSelectViewController viewController: UIViewController) -> Bool
    {
        println("should select viewController: \(viewController.title) ?");
        return true;
    }
}