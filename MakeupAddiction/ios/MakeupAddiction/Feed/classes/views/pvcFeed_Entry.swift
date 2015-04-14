//
//  pvcFeed_Entry.swift
//  MakeupAddiction
//
//  Created by Stephen Shellenberger on 4/10/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation;
import UIKit;

class pvcFeed_Entry : UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate
{
    var identifiers: NSArray = ["sbidFeed_LatestActivity", "sbidFeed_Following", "sbidFeed_MostRecent"];
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle
        , navigationOrientation: UIPageViewControllerNavigationOrientation
        , options: [NSObject : AnyObject]?)
    {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options);
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        self.dataSource = self;
        self.delegate = self;
        
        let startingViewController = self.viewControllerAtIndex(0);
        let viewControllers: NSArray = [startingViewController];
        self.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil);
        
        let pageControl = UIPageControl.appearance();
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor();
        pageControl.currentPageIndicatorTintColor = UIColor.blackColor();
        
        self.tabBarItem = UITabBarItem(title: "Feed"
            , image:UIImage(named: "someImage.png")
            , selectedImage: UIImage(named: "otherImage.png"));
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
    
    func pageViewController(pageViewController: UIPageViewController
        , viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        var idx = (self.getIndexofCurrentSBIDViewControl(viewController) - 1);
        NSLog("BEFORE{%@}", String(idx));
        //if the index is 0, return nil since we dont want a view controller before the first one
        if (idx == -1)
        {
            // in case the user is at the begining of the index take the user to the last item
            idx = (self.identifiers.count - 1);
        }
        return self.viewControllerAtIndex(idx);
    }
    
    func pageViewController(pageViewController: UIPageViewController
        , viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        var idx = (self.getIndexofCurrentSBIDViewControl(viewController) + 1);
        NSLog("AFTER{%@}", String(idx));
        //if the index is the end of the array, return nil since we dont want a view controller after the last one
        if (idx == self.identifiers.count)
        {
            // in case the user is at the end of index they will be taken back to the beggining
            idx = 0;
        }
        return self.viewControllerAtIndex(idx);
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.identifiers.count;
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0;
    }
    
    func viewControllerAtIndex(idx: Int) -> UIViewController!
    {
        NSLog("viewControllerAtIndex{%@}", (self.identifiers[idx] as! String));
        //first view controller = firstViewControllers navigation controller
        
        var storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        var vc:UIViewController = storyboard.instantiateViewControllerWithIdentifier(self.identifiers[idx] as! String) as! UIViewController;
        return vc;

    }
    
    func getIndexofCurrentSBIDViewControl(viewController: UIViewController) -> Int
    {
        let identifier = viewController.restorationIdentifier;
        let index = self.identifiers.indexOfObject(identifier!);
        return index;
    }
    /*
    override func viewDidLayoutSubviews()
    {
    NSLog("S:viewDidLayoutSubviews{}");
    for subView in self.view.subviews as [UIView]
    {
    if subView is UIPageControl
    {
    NSLog("viewDidLayoutSubviews");
    subView.frame.offset(dx: 0, dy: -600);
    self.view.bringSubviewToFront(subView)
    }
    }
    NSLog("E:viewDidLayoutSubviews{}");
    super.viewDidLayoutSubviews();
    }
    */
    override func viewDidLayoutSubviews()
    {
        NSLog("S:viewDidLayoutSubviews{}");
        for subView in self.view.subviews as! [UIView]
        {
            if subView is UIPageControl
            {
                var sizeRect = UIScreen.mainScreen().applicationFrame;
                var width = sizeRect.size.width;
                var height = sizeRect.size.height;
                var offsetH = ((height * 0.09) - height)
                NSLog("viewDidLayoutSubviews%@", offsetH);
                subView.frame.offset(dx: 0, dy: offsetH);
                self.view.bringSubviewToFront(subView)
            }
        }
        NSLog("E:viewDidLayoutSubviews{}");
        super.viewDidLayoutSubviews();
    }
    

}
