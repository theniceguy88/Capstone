import Foundation

struct UserProfile: Codable {
    var name: String
    var age: Int
    var weightKg: Double
    var goal: String
    var totalPoints: Int
    var currentStreak: Int
}
