import Foundation

struct UserProfile: Codable {
    var name: String
    var age: Int
    var weightKg: Double
    var goal: String
    var totalPoints: Int
    var currentStreak: Int

    var initials: String {
        let parts = name.split(separator: " ")
        let letters = parts.prefix(2).compactMap { $0.first }
        return letters.map(String.init).joined().uppercased()
    }
}
