# Nativeblocks iOS SDK

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
