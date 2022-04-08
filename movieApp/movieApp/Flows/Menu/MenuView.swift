//
//  TabView.swift
//  movieApp
//
//  Created by Cris Messias on 31/03/22.
//
//framework github https://github.com/onl1ner/TabBar


import SwiftUI
import TabBar

struct MenuView: View {
    
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
    
    @State private var selection: Item = .first
    @State private var visibility: TabBarVisibility = .visible
    
    var body: some View {
        TabBar(selection: $selection, visibility: $visibility) {
            Button {
                withAnimation {
                    visibility.toggle()
                }
            } label: {
                HomeView()
            }
            .tabItem(for: Item.first)
            
//            Button {
//                withAnimation {
//                    visibility.toggle()
//                }
//            } label: {
//                FavoritesView()
//            }
            FavoritesView()
                .tabItem(for: Item.second)
        }
        .tabBar(style: CustomTabBarStyle())
        .tabItem(style: CustomTabItemStyle())
    }
}

struct CustomTabItemStyle: TabItemStyle {
    
    public func tabItem(icon: String, title: String, isSelected: Bool) -> some View {
        ZStack {
            if isSelected {
                Circle()
                    .foregroundColor( Color("LightMode"))
                    .frame(width: 40.0, height: 40.0)
            }
            
            Image(systemName: icon)
                .foregroundColor(isSelected ? Color("DarkMode") : Color("LightMode"))
                .frame(width: 32.0, height: 32.0)
        }
        .padding(.vertical, 10.0)
    }
    
}

struct CustomTabBarStyle: TabBarStyle {
    
    public func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
        itemsContainer()
            .background(Color("DarkMode"))
            .cornerRadius(25.0)
            .frame(height: 40.0)
            .padding(.horizontal, 54.0)
            .padding(.bottom, 24.0 + geometry.safeAreaInsets.bottom)
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .preferredColorScheme(.dark)
        MenuView()
            .preferredColorScheme(.light)
    }
}
//    var body: some View {
//        TabView{
//            HomeView()
//                .tabItem() {
//                    Label("Now Playing", systemImage: "film")
//                }
//            FavoritesView()
//                .tabItem() {
//                    Label("My Favorites", systemImage: "star")
//                }
//        }
//    }

