//
//  InternalPageViewController.swift
//  raspiTestOne
//
//  Created by maci on 10/3/17.
//  Copyright © 2017 maci. All rights reserved.
//

import UIKit

class InternalPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    lazy var viewControllerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "internalAccessVC")
        
        return [vc1]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
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
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else {return nil}
        guard viewControllerList.count > previousIndex else {return nil}
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        let nextIndex = vcIndex + 1
        guard viewControllerList.count != nextIndex else {return nil}
        guard viewControllerList.count > nextIndex else {return nil}
        //guard nextIndex <= viewControllerList.count else {return nil}
        
        return viewControllerList[nextIndex]
    }
    
    
    
}
