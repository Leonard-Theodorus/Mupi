//
//  PopularMoviesView.swift
//  Mupi
//
//  Created by 🕊️🐢🍵 on 11/11/23.
//

import UIKit

class PopularMoviesView : UIScrollView, ViewProtocol{
    func loadingView() {
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


