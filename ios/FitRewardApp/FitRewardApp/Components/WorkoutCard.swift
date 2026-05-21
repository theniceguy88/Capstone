import SwiftUI

struct WorkoutCard: View {
    let workout: Workout

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(workout.title)
                    .font(.headline)
                Spacer()
                Text("+\(workout.rewardPoints) pts")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(.thinMaterial)
                    .clipShape(Capsule())
            }

            Text(workout.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            HStack(spacing: 12) {
                Label(workout.difficulty.rawValue, systemImage: "bolt.fill")
                Label("\(workout.estimatedMinutes) min", systemImage: "clock")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 4, y: 2)
    }
}
