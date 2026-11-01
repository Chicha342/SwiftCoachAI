import SwiftUI

@main
struct SwiftCoachAIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    for family in UIFont.familyNames.sorted() {
                        print("Family: \(family)")

                        for name in UIFont.fontNames(forFamilyName: family) {
                            print("Font: \(name)")
                        }
                    }
                }
        }
    }
}
