//
//  HomeScreen+UIScrolView.swift
//  Square One Task
//
//  Created by Karim Soliman on 26/08/2022.
//

import UIKit

extension HomeScreenViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        loadSpinner()
        let position = scrollView.contentOffset.y
        let viewHeight = citiesTableView.contentSize.height-100-scrollView.frame.size.height
        pageNumber+=1
        let result = viewModel?.calculateViewPosition(postion: position, height: viewHeight, page: pageNumber)
        result ?? false ? addMorePages() : ()
    }
}
