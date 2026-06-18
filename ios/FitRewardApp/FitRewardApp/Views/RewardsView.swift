import SwiftUI

struct RewardsView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationStack {
            List(appState.unlockedRewards) { reward in
                HStack(spacing: 14) {
                    Image(systemName: reward.isUnlocked ? "trophy.fill" : "lock.fill")
                        .font(.title2)
                        .foregroundStyle(reward.isUnlocked ? .yellow : .secondary)
                        .frame(width: 36)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(reward.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(reward.isUnlocked ? .primary : .secondary)
                        Text(reward.description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text("Requires \(reward.requiredPoints) points")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.vertical, 6)
                .opacity(reward.isUnlocked ? 1.0 : 0.5)
            }
            .navigationTitle("Rewards")
        }
    }
}
