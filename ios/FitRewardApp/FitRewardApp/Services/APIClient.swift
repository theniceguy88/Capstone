import Foundation

final class APIClient {
    static let shared = APIClient()

    private init() {}

    // Placeholder for future FastAPI base URL.
    private let baseURL = "http://localhost:8000"

    // Future example:
    // func fetchWorkouts() async throws -> [Workout] {
    //     let url = URL(string: "\(baseURL)/workouts")!
    //     let (data, _) = try await URLSession.shared.data(from: url)
    //     return try JSONDecoder().decode([Workout].self, from: data)
    // }
}
