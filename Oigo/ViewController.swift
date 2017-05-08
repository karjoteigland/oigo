//
//  ViewController.swift
//  Oigo
//
//  Created by Karl Johan Teigland on 04/05/2017.
//  Copyright © 2017 Karl Johan Teigland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let tourData = [
        [
            "image" : "bats",
            "title" : "Learn By Hearing",
            "subTitle" : "Do as the bats and use your sense of hearing. \nIt'll really safe you some time during your studies!"
        ],
        [
            "image" : "hat",
            "title" : "Increase Your Grades",
            "subTitle" : "As you learn by hearing you'll experience \na greater understanding during classes \nwhich will positively effect your grades"
        ],
        [
            "image" : "chalkboard",
            "title" : "Be Ahead",
            "subTitle" : "When you subscript to Premium \nyou can explore other curricula \nand increase your spand of knowlegde"
        ]
    ]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        setupPageViews()
    }
    
    func createPageView(data: [String: String]) -> PageView {
        let pageView = PageView.loadFromNib()
        pageView.configure(data: data)
        return pageView
    }
    
    func setupPageViews() {
        var totalWidth: CGFloat = 0
        
        for data in tourData {
            let pageView = createPageView(data: data)
            pageView.frame = CGRect(origin: CGPoint(x: totalWidth, y: 0),
                                    size: view.bounds.size)
            
            scrollView.addSubview(pageView)
            totalWidth += pageView.bounds.size.width
        }
        
        scrollView.contentSize = CGSize(width: totalWidth,
                                        height: scrollView.bounds.size.height)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = Int(scrollView.contentSize.width) / tourData.count
        pageControl.currentPage = Int(scrollView.contentOffset.x) / pageWidth
    }
}













