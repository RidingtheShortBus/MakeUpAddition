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
        //array of the root view controllers displayed by the tab bar interface
        let controllers = [self.getHome(), self.getDiscover(), self.getAdd(), self.getActivities(), self.getProfile()];
        self.viewControllers = controllers;
    }
    
    //Delegate methods
    func tabBarController(tabBarController: UITabBarController
                        , shouldSelectViewController viewController: UIViewController) -> Bool
    {
        println("should select viewController: \(viewController.title) ?");
        return true;
    }
    
    func getHome() -> UIPageViewController!
    {
        var storyboard:UIStoryboard = UIStoryboard(name: "Home", bundle: nil);
        var pvc:UIPageViewController = storyboard.instantiateViewControllerWithIdentifier("sbidHome_Entry") as! UIPageViewController;
        
        pvc.tabBarItem = UITabBarItem(title: "Home"
            , image:UIImage(named: "homeicon@3x.png")
            , selectedImage: UIImage(named: "homeicon@3x.png"));
        
        return pvc;
    }
    
    func getDiscover() -> UINavigationController!
    {
        var storyboard:UIStoryboard = UIStoryboard(name: "Discover", bundle: nil);
        var nc:UINavigationController = storyboard.instantiateViewControllerWithIdentifier("sbidDiscover_Entry") as! UINavigationController;
        
        nc.tabBarItem = UITabBarItem(title: "Discover"
            , image:UIImage(named: "discovericon@3x.png")
            , selectedImage: UIImage(named: "discovericon@3x.png"));
        
        return nc;
    }
    
    func getAdd() -> UIViewController!
    {
        var storyboard:UIStoryboard = UIStoryboard(name: "Add", bundle: nil);
        var vc:UIViewController = storyboard.instantiateViewControllerWithIdentifier("sbidAdd_Entry") as! UIViewController;
        
        vc.tabBarItem = UITabBarItem(title: "Add"
            , image:UIImage(named: "addicon@3x.png")
            , selectedImage: UIImage(named: "addicon@3x.png"));
        
        return vc;
    }
    
    func getActivities() -> UIViewController!
    {
        var storyboard:UIStoryboard = UIStoryboard(name: "Activities", bundle: nil);
        var vc:UIViewController = storyboard.instantiateViewControllerWithIdentifier("sbidActivities_Entry") as! UIViewController;
        
        vc.tabBarItem = UITabBarItem(title: "Activities"
            , image:UIImage(named: "activityicon@3x.png")
            , selectedImage: UIImage(named: "activityicon@3x.png"));
        
        return vc;
    }
    
    func getProfile() -> UIViewController!
    {
        var storyboard:UIStoryboard = UIStoryboard(name: "Profile", bundle: nil);
        var vc:UIViewController = storyboard.instantiateViewControllerWithIdentifier("sbidProfile_Entry") as! UIViewController;
        
        vc.tabBarItem = UITabBarItem(title: "Profile"
            , image:UIImage(named: "profileicon@3x.png")
            , selectedImage: UIImage(named: "profileicon@3x.png"));
        
        return vc;
    }
}