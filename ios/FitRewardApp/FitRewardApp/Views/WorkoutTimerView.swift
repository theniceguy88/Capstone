import SwiftUI

struct WorkoutTimerView: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) private var dismiss

    let workout: Workout

    @State private var currentExerciseIndex = 0
    @State private var remainingSeconds = 0
    @State private var isResting = false
    @State private var isRunning = false
    @State private var isCompleted = false

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    private var currentExercise: Exercise {
        workout.exercises[currentExerciseIndex]
    }

    var body: some View {
        VStack(spacing: 28) {
            if isCompleted {
                VStack(spacing: 16) {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 72))
                    Text("Workout Complete")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("You earned \(workout.rewardPoints) points.")
                        .foregroundStyle(.secondary)
                    Button("Back to Workouts") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                }
            } else {
                VStack(spacing: 8) {
                    Text(isResting ? "Rest" : "Exercise")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Text(isResting ? "Next: \(nextExerciseName)" : currentExercise.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }

                Text(timeText)
                    .font(.system(size: 72, weight: .bold, design: .rounded))

                Text("Step \(currentExerciseIndex + 1) of \(workout.exercises.count)")
                    .foregroundStyle(.secondary)

                HStack(spacing: 12) {
                    Button(isRunning ? "Pause" : "Start") {
                        if remainingSeconds == 0 {
                            remainingSeconds = currentExercise.durationSeconds
                        }
                        isRunning.toggle()
                    }
                    .buttonStyle(.borderedProminent)

                    Button("Skip") {
                        moveToNextPhase()
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
        .padding()
        .navigationTitle("Timer")
        .navigationBarTitleDisplayMode(.inline)
        .onReceive(timer) { _ in
            guard isRunning, !isCompleted else { return }

            if remainingSeconds > 0 {
                remainingSeconds -= 1
            } else {
                moveToNextPhase()
            }
        }
        .onAppear {
            remainingSeconds = currentExercise.durationSeconds
        }
    }

    private var timeText: String {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    private var nextExerciseName: String {
        let nextIndex = min(currentExerciseIndex + 1, workout.exercises.count - 1)
        return workout.exercises[nextIndex].name
    }

    private func moveToNextPhase() {
        if isResting {
            if currentExerciseIndex < workout.exercises.count - 1 {
                currentExerciseIndex += 1
                isResting = false
                remainingSeconds = currentExercise.durationSeconds
            } else {
                finishWorkout()
            }
        } else {
            isResting = true
            remainingSeconds = currentExercise.restSeconds
        }
    }

    private func finishWorkout() {
        isRunning = false
        isCompleted = true
        appState.completeWorkout(workout)
    }
}
