# AppRouter

A simple example of usage.

**Code example:**

### Create UIViewController class
```swift
import SwiftUI
import AppRouter /// Import package

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openProfileView(_ sender: UIButton) {

    }
}
```


### Create SwiftUI View
```swift

import SwiftUI
import AppRouter /// Import package

struct ProfileView: View {
    let router: AppRouter /// set here
    var body: some View {
        Text("This is Profile view with SwiftUI")
    }
}


```

# How do use or works with AppRouter

### Open your Swiftui View with UIHostingController #1 
```swift
import SwiftUI
import AppRouter

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openProfileView(_ sender: UIButton) {
        let hostView = UIHostingController(rootView: ProfileView(router: AppRouter(rootViewController: self)))
        self.present(hostView, animated: true)
    }
}
```

### Or Create your UIViewcontroller class like this
```swift

import SwiftUI

class ProfileViewVC: UIHostingController<ProfileView> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

```


```swift

import SwiftUI
import AppRouter

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openProfileView(_ sender: UIButton) {
        let vc = ProfileViewVC(rootView: ProfileView(router: AppRouter(rootViewController: self)))
        if let sheet = vc.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 20
        }
        vc.hidesBottomBarWhenPushed = true
        present(vc, animated: true)
    }
}

```

## How do use AppRouter in SwiftUI View
```swift

import SwiftUI
import AppRouter

struct ProfileView: View {
    let router: AppRouter
    var body: some View {
        VStack(spacing: 24) {
            Text("This is Profile view with SwiftUI")
                .onTapGesture {
                    /// router.pushViewController(UIViewController()) set your viewcontroller here
                }
            HStack(spacing: 16) {
                Button("Back to Home") {
                    router.dismissViewController()
                }
                
                Button("Create New rofile here") {
                    let vc = CreateNewProfileFormVC()
                    router.presentViewController(vc)
                }
            }
        }
    }
}

```

--- 
# How do use with Navigator

### Create Navigator class for example 
```swift

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


```

### Add navigate fun for example 
#### UIKit example

```swift


fun yourUIViewcontrollerName() {
let vc = YourViewcontrollerName()
vc.title = "This is UIKit UIViewcontroller"
router.pushViewController(vc)

}

```


#### SwiftUI example

```swift


    func YourViewControllerName() {
        let vc = UIHostingController(rootView: SalonDetailView())
        vc.hidesBottomBarWhenPushed = true
        vc.title = title
        router.pushViewController(vc)
    }

}

```

#### SwiftUI clean setup example

```swift

    class YourViewControllerName: UIHostingController<SomeSwiftUIView> {
        override func viewDidLoad() {
            super.viewDidLoad()
        }
    }


    func YourViewControllerName() {
        let vc = YourViewControllerName(rootView: SomeSwiftUIView())
        vc.hidesBottomBarWhenPushed = true
        vc.title = title
        router.pushViewController(vc)
    }

}

```
