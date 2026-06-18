import SwiftUI

@main
struct FitRewardApp: App {
    @StateObject private var appState = AppState()
    @StateObject private var supabaseAuth = SupabaseAuth()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(appState)
                .environmentObject(supabaseAuth)
        }
    }
}
