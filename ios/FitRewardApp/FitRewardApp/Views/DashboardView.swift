import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("FitReward")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Small workouts. Real progress. Rewards that keep users moving.")
                            .foregroundStyle(.secondary)
                    }

                    HStack(spacing: 12) {
                        StatCard(title: "Points", value: "\(appState.profile.totalPoints)", subtitle: "total earned")
                        StatCard(title: "Streak", value: "\(appState.profile.currentStreak)", subtitle: "days active")
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Recent Workouts")
                            .font(.headline)

                        if appState.completedSessions.isEmpty {
                            Text("No workouts completed yet.")
                                .foregroundStyle(.secondary)
                        } else {
                            ForEach(appState.completedSessions.prefix(3)) { session in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(session.workoutTitle)
                                            .fontWeight(.semibold)
                                        Text("\(session.durationMinutes) min • +\(session.pointsEarned) pts")
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Dashboard")
        }
    }
}
