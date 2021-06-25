import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageController.addTarget(self, action: #selector(self.pageChanged), for: .valueChanged)
        scrollView.delegate = self
    }
   
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageController.currentPage = Int(pageNumber)
    }

    @objc func pageChanged() {
        let pageNumber = pageController.currentPage
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(pageNumber)
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
    }
    
}

