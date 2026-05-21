import Foundation

@MainActor
final class AppState: ObservableObject {
    @Published var selectedDifficulty: WorkoutDifficulty? = nil
    @Published var selectedDurationMinutes: Int? = nil
    @Published var completedSessions: [WorkoutSession] = MockDataService.history
    @Published var profile: UserProfile = MockDataService.profile

    var filteredWorkouts: [Workout] {
        MockDataService.workouts.filter { workout in
            let difficultyMatch = selectedDifficulty == nil || workout.difficulty == selectedDifficulty
            let durationMatch = selectedDurationMinutes == nil || workout.estimatedMinutes <= selectedDurationMinutes!
            return difficultyMatch && durationMatch
        }
    }

    func completeWorkout(_ workout: Workout) {
        let session = WorkoutSession(
            workoutTitle: workout.title,
            completedAt: Date(),
            pointsEarned: workout.rewardPoints,
            durationMinutes: workout.estimatedMinutes
        )
        completedSessions.insert(session, at: 0)
        profile.totalPoints += workout.rewardPoints
        profile.currentStreak += 1
    }
}
