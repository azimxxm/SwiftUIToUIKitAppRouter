//
//  AppRouter.swift
//  1Sonia
//
//  Created by Azimjon Abdurasulov on 05/03/24.
//

import SwiftUI

/// A view model for managing navigation within the app.
public class AppRouter: ObservableObject {
    /// The root view controller.
    public weak var rootViewController: UIViewController?

    /// Initializes the `AppRouterVM` with an optional root view controller.
    /// - Parameter rootViewController: The root view controller (default is `nil`).
    public init(rootViewController: UIViewController? = nil) {
        self.rootViewController = rootViewController
    }

    /// Shared instance of `AppRouterVM`.
    public static let shared = AppRouter()

    /// Pushes a view controller onto the navigation stack.
    /// - Parameters:
    ///   - viewController: The view controller to push onto the stack.
    ///   - animated: A Boolean indicating whether the transition should be animated (default is `true`).
    public func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        guard let navigationController = rootViewController?.navigationController else {
            return
        }
        navigationController.pushViewController(viewController, animated: animated)
    }

    /// Pops the top view controller from the navigation stack.
    /// - Parameter animated: A Boolean indicating whether the transition should be animated (default is `true`).
    public func popViewController(animated: Bool = true) {
        guard let navigationController = rootViewController?.navigationController else {
            return
        }
        navigationController.popViewController(animated: animated)
    }

    /// Dismisses a view controller from the screen.
    /// - Parameters:
    ///   - viewController: The view controller to dismiss.
    ///   - animated: A Boolean indicating whether the dismissal should be animated (default is `true`).
    public func dismissViewController(animated: Bool = true) {
        rootViewController?.dismiss(animated: animated)
    }

    /// Dismisses or pops a view controller from the screen based on its presentation context.
    ///
    /// This method is used to either dismiss a presented view controller or pop it from the navigation stack, depending on its presentation context. If the view controller is presented modally, it will be dismissed. If it is part of a navigation stack, it will be popped.
    ///
    /// - Note: This method checks if the view controller is embedded in a navigation controller. If it is not, it assumes it is presented modally and dismisses it.
    func dismissOrPopViewController() {
        if rootViewController?.navigationController == nil {
            dismissViewController()
        } else {
            popViewController()
        }
    }

    /// Presents a view controller modally.
    /// - Parameters:
    ///   - viewController: The view controller to present.
    ///   - animated: A Boolean indicating whether the presentation should be animated (default is `true`).
    public func presentViewController(_ viewController: UIViewController, animated: Bool = true) {
        rootViewController?.present(viewController, animated: animated)
    }

    /**
        Pops all view controllers from the navigation stack except the root view controller.

        - Parameters:
          - animated: A Boolean value indicating whether to animate the transition (default is `true`).

        - Note: This function pops all view controllers from the navigation stack except the root view controller. If the root view controller is not set or if it's the only view controller in the navigation stack, this function has no effect.

        - Example:

          ```swift
          // Example usage of the popToRootViewController function
          popToRootViewController(animated: true)
          ```

     */
    public func popToRootViewController(animated: Bool = true) {
        rootViewController?.navigationController?.popToRootViewController(animated: animated)
    }

    /**
        Pops view controllers from the navigation stack until the specified view controller is at the top.

        - Parameters:
          - viewController: The view controller to which the navigation stack should be popped.
          - animated: A Boolean value indicating whether to animate the transition (default is `true`).

        - Note: This function pops view controllers from the navigation stack until the specified view controller is at the top. If the specified view controller is not found in the navigation stack, or if the root view controller is not set, this function has no effect.

        - Example:

          ```swift
          // Example usage of the popToViewController function
          let targetViewController = MyViewController()
          popToViewController(targetViewController, animated: true)
          ```

     */
    public func popToViewController(_ viewController: UIViewController, animated: Bool = true) {
        rootViewController?.navigationController?.popToViewController(viewController, animated: animated)
    }

    /**
        Hides or shows the tab bar of the current tab navigation controller.

        - Parameters:
          - isHidden: A Boolean value indicating whether to hide the tab bar (default is `true`).

        - Note: This function hides or shows the tab bar of the current tab navigation controller. If the root view controller is not set, or if the navigation controller or tab bar controller is not found, this function has no effect.

        - Example:

          ```swift
          // Example usage of the hideTabBar function
          hideTabBar(true)
          ```

     */
    func hideTabBar(_ isHidden: Bool = true) {
        rootViewController?.navigationController?.tabBarController?.tabBar.isHidden = isHidden
    }
}
