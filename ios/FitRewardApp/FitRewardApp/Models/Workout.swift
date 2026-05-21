import Foundation

enum WorkoutDifficulty: String, CaseIterable, Identifiable, Codable {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"

    var id: String { rawValue }
}

struct Exercise: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let durationSeconds: Int
    let restSeconds: Int

    init(id: UUID = UUID(), name: String, durationSeconds: Int, restSeconds: Int) {
        self.id = id
        self.name = name
        self.durationSeconds = durationSeconds
        self.restSeconds = restSeconds
    }
}

struct Workout: Identifiable, Codable, Hashable {
    let id: UUID
    let title: String
    let description: String
    let difficulty: WorkoutDifficulty
    let estimatedMinutes: Int
    let rewardPoints: Int
    let exercises: [Exercise]

    init(
        id: UUID = UUID(),
        title: String,
        description: String,
        difficulty: WorkoutDifficulty,
        estimatedMinutes: Int,
        rewardPoints: Int,
        exercises: [Exercise]
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.difficulty = difficulty
        self.estimatedMinutes = estimatedMinutes
        self.rewardPoints = rewardPoints
        self.exercises = exercises
    }
}
