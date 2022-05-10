# ios-ui-stickyheader

<img src="https://user-images.githubusercontent.com/26668309/167575885-64971b2a-cb9c-4e6d-b8c1-66fbf1f820d8.gif" width=30% > 

- 스크롤 시 헤더 고정 
```Swift
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = 200 - self.customTableView.navigationView.frame.height
        
        if scrollView.contentOffset.y > offset {
            scrollView.contentInset = UIEdgeInsets(top: self.customTableView.navigationView.frame.height, left: 0, bottom: 0, right: 0)
            
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
```
