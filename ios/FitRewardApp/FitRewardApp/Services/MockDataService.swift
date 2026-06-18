import Foundation

struct MockDataService {
    static let workouts: [Workout] = [
        Workout(
            title: "Quick Starter Burn",
            description: "A short beginner workout to help users start moving at home.",
            difficulty: .beginner,
            estimatedMinutes: 8,
            rewardPoints: 40,
            exercises: [
                Exercise(name: "Jumping Jacks", durationSeconds: 30, restSeconds: 15),
                Exercise(name: "Bodyweight Squats", durationSeconds: 30, restSeconds: 15),
                Exercise(name: "Wall Push-Ups", durationSeconds: 30, restSeconds: 15),
                Exercise(name: "March in Place", durationSeconds: 45, restSeconds: 20)
            ]
        ),
        Workout(
            title: "Core Builder",
            description: "A simple core routine focused on abs and stability.",
            difficulty: .intermediate,
            estimatedMinutes: 12,
            rewardPoints: 70,
            exercises: [
                Exercise(name: "Plank", durationSeconds: 30, restSeconds: 20),
                Exercise(name: "Mountain Climbers", durationSeconds: 30, restSeconds: 20),
                Exercise(name: "Crunches", durationSeconds: 35, restSeconds: 20),
                Exercise(name: "Leg Raises", durationSeconds: 30, restSeconds: 20)
            ]
        ),
        Workout(
            title: "Full Body Challenge",
            description: "A harder full-body workout for users who want more intensity.",
            difficulty: .advanced,
            estimatedMinutes: 18,
            rewardPoints: 120,
            exercises: [
                Exercise(name: "Burpees", durationSeconds: 35, restSeconds: 20),
                Exercise(name: "Push-Ups", durationSeconds: 35, restSeconds: 20),
                Exercise(name: "Jump Squats", durationSeconds: 35, restSeconds: 20),
                Exercise(name: "High Knees", durationSeconds: 45, restSeconds: 20)
            ]
        )
    ]

    static let profile = UserProfile(
        name: "Student User",
        age: 16,
        weightKg: 60,
        goal: "Exercise 3 times per week",
        totalPoints: 180,
        currentStreak: 4
    )

    static let rewards: [Reward] = [
        Reward(title: "First Workout", description: "Complete your first workout.", requiredPoints: 40, isUnlocked: false),
        Reward(title: "Consistency Starter", description: "Reach 3 workout days.", requiredPoints: 120, isUnlocked: false),
        Reward(title: "Home Athlete", description: "Reach 500 total points.", requiredPoints: 500, isUnlocked: false)
    ]

    static let history: [WorkoutSession] = [
        WorkoutSession(workoutTitle: "Quick Starter Burn", completedAt: Date().addingTimeInterval(-86400), pointsEarned: 40, durationMinutes: 8),
        WorkoutSession(workoutTitle: "Core Builder", completedAt: Date().addingTimeInterval(-172800), pointsEarned: 70, durationMinutes: 12)
    ]
}
