# NativeblocksWandKit iOS SDK

Please check [Nativeblocks livekit](https://nativeblocks.io/docs/live-kit/swift/) for full implementation,

## Getting Started

To integrate **NativeblocksWandKit** into your project, add it via Swift Package Manager (SPM):

1. Add the library to your `Package.swift` file:

    ```swift
    dependencies: [
        .package(
            url: "https://github.com/nativeblocks/nativeblocks-wandkit-ios-sdk.git",
            .upToNextMajor(from: "1.0.0")
        ),
    ],
    ```

2. Import the library in your Swift file:

    ```swift
    import NativeblocksWandKit
    ```

3. Initialize nativeblocks wandkit : 

    ```swift
    let bundleId = Bundle.main.bundleIdentifier ?? ""
    _ = NativeblocksManager.getInstance().wandKit(
        LiveKit(
            screenSharing: true,
            screenShareExtention: "\(bundleId).LiveKitExtention",
            keepScreenOn: true,
            autoConnect: false
        )
    )
    ```

### Sample App Example

```swift
import Nativeblocks
import NativeblocksWandKit
import SwiftUI

@main
struct SampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let NATIVEBLOCKS_API_ENDPOINT = "https://api.nativeblocks.io/graphql"
    let NATIVEBLOCKS_API_KEY = ""

    init() {
        NativeblocksManager.initialize(
            edition: .cloud(
                endpoint: NATIVEBLOCKS_API_ENDPOINT,
                apiKey: NATIVEBLOCKS_API_KEY,
                developmentMode: true
            )
        )

        #if DEBUG
            let bundleId = Bundle.main.bundleIdentifier ?? ""
            _ = NativeblocksManager.getInstance().wandKit(
                LiveKit(
                    screenSharing: true,
                    screenShareExtention: "\(bundleId).LiveKitExtention",
                    keepScreenOn: true,
                    autoConnect: false
                )
            )
        #endif
    }

    var body: some Scene {
        WindowGroup {
            NativeblocksFrame(
                route: "/",
                routeArguments: [:],
                loading: { AnyView(NativeblocksLoading()) },
                error: { message in AnyView(NativeblocksError(message: message)) }
            )
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationWillTerminate(_ application: UIApplication) {
        NativeblocksManager.getInstance().destroy()
    }
}
```
---

## Additional Resources

- [Nativeblocks Documentation](https://nativeblocks.io/docs/get-started/introduction/)
- [Nativeblocks livekit](https://nativeblocks.io/docs/live-kit/swift/)
- [Getting Started with Server-Driven UI](https://nativeblocks.io/blog/server-driven-ui-introduction/)

For any questions or issues, feel free to open an issue in the repository. Happy coding!