import Foundation

struct Reward: Identifiable, Codable {
    let id: UUID
    let title: String
    let description: String
    let requiredPoints: Int
    let isUnlocked: Bool

    init(id: UUID = UUID(), title: String, description: String, requiredPoints: Int, isUnlocked: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.requiredPoints = requiredPoints
        self.isUnlocked = isUnlocked
    }
}
