import SwiftUI

struct WorkoutDetailView: View {
    let workout: Workout

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            VStack(alignment: .leading, spacing: 8) {
                Text(workout.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(workout.description)
                    .foregroundStyle(.secondary)
                Text("\(workout.difficulty.rawValue) • \(workout.estimatedMinutes) min • +\(workout.rewardPoints) pts")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Text("Exercises")
                .font(.headline)

            List(workout.exercises) { exercise in
                VStack(alignment: .leading) {
                    Text(exercise.name)
                        .fontWeight(.semibold)
                    Text("Exercise: \(exercise.durationSeconds)s • Rest: \(exercise.restSeconds)s")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .listStyle(.plain)

            NavigationLink {
                WorkoutTimerView(workout: workout)
            } label: {
                Text("Start Workout")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.primary)
                    .foregroundStyle(.background)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
