//
//  MenuViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 08/04/22.
//

import Foundation
import TabBar

class MenuViewModel {
    
    private enum Item: Int, Tabbable {
        case first = 0
        case second
        
        var icon: String {
            switch self {
            case .first: return "film"
            case .second: return "star"
            }
        }
        
        var title: String {
            switch self {
            case .first: return "Now Playing"
            case .second: return "My Favorites"
            }
        }
    }
}
