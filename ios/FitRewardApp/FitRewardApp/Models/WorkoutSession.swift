import Foundation

struct WorkoutSession: Identifiable, Codable {
    let id: UUID
    let workoutTitle: String
    let completedAt: Date
    let pointsEarned: Int
    let durationMinutes: Int

    init(id: UUID = UUID(), workoutTitle: String, completedAt: Date, pointsEarned: Int, durationMinutes: Int) {
        self.id = id
        self.workoutTitle = workoutTitle
        self.completedAt = completedAt
        self.pointsEarned = pointsEarned
        self.durationMinutes = durationMinutes
    }
}
