import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationStack {
            Form {
                Section("User Info") {
                    TextField("Name", text: $appState.profile.name)
                    Stepper("Age: \(appState.profile.age)", value: $appState.profile.age, in: 10...90)
                    Stepper("Weight: \(String(format: "%.1f", appState.profile.weightKg)) kg", value: $appState.profile.weightKg, in: 30...200, step: 0.5)
                    TextField("Goal", text: $appState.profile.goal)
                }

                Section("Progress") {
                    LabeledContent("Total Points", value: "\(appState.profile.totalPoints)")
                    LabeledContent("Current Streak", value: "\(appState.profile.currentStreak) days")
                    LabeledContent("Completed Workouts", value: "\(appState.completedSessions.count)")
                }

                Section("Future Account Features") {
                    Text("Login, Supabase sync, and cloud backup will be added after the SwiftUI MVP is stable.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Profile")
        }
    }
}
