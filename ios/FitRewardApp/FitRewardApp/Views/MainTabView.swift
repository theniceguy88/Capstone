import SwiftUI

struct MainTabView: View {
    @StateObject private var appState = AppState()

    var body: some View {
        TabView {
            DashboardView()
                .tabItem { Label("Home", systemImage: "house.fill") }

            WorkoutListView()
                .tabItem { Label("Workouts", systemImage: "figure.run") }

            RewardsView()
                .tabItem { Label("Rewards", systemImage: "trophy.fill") }

            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.fill") }
        }
        .environmentObject(appState)
    }
}
