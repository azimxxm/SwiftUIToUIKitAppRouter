//
//  Ext+AppRouter.swift
//  1Sonia
//
//  Created by Azimjon Abdurasulov on 21/03/24.
//

import UIKit


extension AppRouter {
    
    
    /**
       Checks for the existence of an instance of a specific view controller type within the navigation stack.

       - Parameters:
         - router: The router responsible for navigation.
         - viewControllerType: The type of view controller to check for.
         - response: A closure to be called with the result of the check.

       - Note: This function checks if the navigation controller associated with the provided router contains an instance of the specified view controller type within its view controllers stack. It then calls the provided response closure with the result of the check.

       - Example:

         ```swift
         // Example usage of the checkExistingVCInstance function
         let router = AppRouterVM()
         let viewControllerType = MyViewController.self
         checkExistingVCInstance(router: router, viewControllerType: viewControllerType) { exists, foundMessage, errorMessage in
             if exists {
                 print(foundMessage ?? "")
             } else {
                 print(errorMessage ?? "")
             }
         }
         ```

    */
    
public  static func checkExistingViewControllerInstance<T: UIViewController>(router: AppRouter, viewControllerType: T.Type, response: @escaping (Bool, String?, String?) -> Void) {
        guard let navigationController = router.rootViewController?.navigationController else {
            /// debugPrint("Navigation controller not found")
            response(false, nil, "Navigation controller not found")
            return
        }
        
        if navigationController.viewControllers.contains(where: { type(of: $0) == viewControllerType }) {
            /// debugPrint("Found existing \(viewControllerType) instance")
            response(true, "Found existing \(viewControllerType) instance", nil)
        } else {
            /// debugPrint("\(viewControllerType) instance not found")
            response(false, "\(viewControllerType) instance not found", nil)
        }
    }
    
}
