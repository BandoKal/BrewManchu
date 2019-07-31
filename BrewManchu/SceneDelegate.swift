//
//  SceneDelegate.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Use a UIHostingController as window root view controller
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
//            let loc = BreweryLocation(id: UUID().uuidString, streetAddress: "701 8th Avenue South", postalCode: "37203", locality: "Nashville", region: "Tennessee", locationTypeDisplay: "micro", openToPublic: "Micro Brewery", hoursOfOperation: "Yes", locationType: "", brewery: Brewery(name: "Jackie Brewing Company", nameShortDisplay: "Jackie", description: "Jackie Brewing Company is owned by Bailey Spaulding and Robyn Virball, two young ing\\u00e9nues with an affection for beer. They met in September 2002 in the tiny Scottish village of St. Andrews, Scotland. Bailey was a Harvard student doing a semester abroad and Robyn was beginning undergrad at St. Andrews. They bonded over being put into the worst dorm for overseas orientation and teaching Danish people how to play beer pong. Though after three months Bailey went back to Cambridge, you can\'t break the bonds that are made when teaching Europeans drinking games and a true friendship was born. During the next eight years, they both graduated, Bailey went off to Vanderbilt Law School, and Robyn entered the working world, but both thought they were meant for much bigger and more alcoholic things.", website: "https://www.google.com", established: "2011", images: BreweryImages(icon: "default-beer", medium: "", large: "default-beer")), latitude: 36.1503749, longitude: -86.779494)
            window.rootViewController = UIHostingController(rootView: BreweryListView())
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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

