//
//  SceneDelegate.swift
//  MyProject
//
//  Created by Nagarro on 2024/07/16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        
        window = UIWindow(frame:  windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabber()
        window?.makeKeyAndVisible()
        
        configureNavigationBar()
    }
    
    
    
    // Function to create a UINavigationController with a SearchViewController as its root
    func createSearchNavigationController() -> UINavigationController {
        // Create an instance of SearchViewController
        let searchVC = SearchViewController()
        
        // Set the title of the SearchViewController
        searchVC.title = "Search"
        
        // Set the tab bar item of the SearchViewController
        // - tabBarSystemItem: .search will use the system's search icon
        // - tag: 0 is used to identify the tab (useful for distinguishing tabs programmatically)
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        // Create a UINavigationController with searchVC as its root view controller
        // and return it
        return UINavigationController(rootViewController: searchVC)
    }

    // Function to create a UINavigationController with a FavouritesListViewController as its root
    func createFavouriteNavigationController() -> UINavigationController {
        // Create an instance of FavouritesListViewController
        let favouriteNC = FavouritesListViewController()
        
        // Set the title of the FavouritesListViewController
        favouriteNC.title = "Favourites"
        
        // Set the tab bar item of the FavouritesListViewController
        // - tabBarSystemItem: .favorites will use the system's favorites icon
        // - tag: 1 is used to identify the tab (useful for distinguishing tabs programmatically)
        favouriteNC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        // Create a UINavigationController with favouriteNC as its root view controller
        // and return it
        return UINavigationController(rootViewController: favouriteNC)
    }

    
    // Function to create and return a UITabBarController with custom tabs
    func createTabber() -> UITabBarController {
        // Create an instance of UITabBarController
        let tabbar = UITabBarController()
        
        // Set the tintColor of the tab bar to system green
        // This changes the color of the selected tab icon and text
        UITabBar.appearance().tintColor = .systemGreen
        
        // Set the viewControllers property of the tab bar controller
        // The array includes navigation controllers created by the previously defined functions
        tabbar.viewControllers = [createSearchNavigationController(), createFavouriteNavigationController()]
        
        // Return the configured UITabBarController
        return tabbar
    }

    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

