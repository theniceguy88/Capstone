import SwiftUI

struct RewardsView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationStack {
            List(MockDataService.rewards) { reward in
                HStack(spacing: 14) {
                    Image(systemName: reward.isUnlocked ? "trophy.fill" : "lock.fill")
                        .font(.title2)
                        .frame(width: 36)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(reward.title)
                            .fontWeight(.semibold)
                        Text(reward.description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text("Requires \(reward.requiredPoints) points")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.vertical, 6)
            }
            .navigationTitle("Rewards")
        }
    }
}
