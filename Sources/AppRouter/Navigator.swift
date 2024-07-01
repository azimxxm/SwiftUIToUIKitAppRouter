//
//  Navigator.swift
//  1Sonia
//
//  Created by Azimjon Abdurasulov on 06/03/24.
//

import SwiftUI

/// A class responsible for navigating to different views within the app using the provided router.
public final class Navigator {
    /// The router used for navigation.
    let router: AppRouter

    /// Initializes the `Navigator` with the provided router.
    /// - Parameter router: The router used for navigation.
    init(router: AppRouter) {
        self.router = router
    }
}
