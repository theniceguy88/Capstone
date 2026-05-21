import SwiftUI

struct WorkoutListView: View {
    @EnvironmentObject private var appState: AppState
    private let durationOptions = [8, 12, 18, 30]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Choose Difficulty")
                            .font(.headline)

                        Picker("Difficulty", selection: $appState.selectedDifficulty) {
                            Text("All").tag(WorkoutDifficulty?.none)
                            ForEach(WorkoutDifficulty.allCases) { difficulty in
                                Text(difficulty.rawValue).tag(WorkoutDifficulty?.some(difficulty))
                            }
                        }
                        .pickerStyle(.segmented)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Max Time")
                            .font(.headline)

                        Picker("Duration", selection: $appState.selectedDurationMinutes) {
                            Text("All").tag(Int?.none)
                            ForEach(durationOptions, id: \.self) { minutes in
                                Text("\(minutes)m").tag(Int?.some(minutes))
                            }
                        }
                        .pickerStyle(.segmented)
                    }

                    ForEach(appState.filteredWorkouts) { workout in
                        NavigationLink(value: workout) {
                            WorkoutCard(workout: workout)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Workouts")
            .navigationDestination(for: Workout.self) { workout in
                WorkoutDetailView(workout: workout)
            }
        }
    }
}
