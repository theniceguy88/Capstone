import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var appState: AppState
    @State private var isEditing = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {

                    // Avatar + name header
                    VStack(spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.15))
                                .frame(width: 80, height: 80)
                            Text(appState.profile.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.blue)
                        }
                        Text(appState.profile.name)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(appState.profile.goal)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 8)

                    // Stats row
                    HStack(spacing: 12) {
                        StatCard(title: "Points", value: "\(appState.profile.totalPoints)", subtitle: "total earned")
                        StatCard(title: "Streak", value: "\(appState.profile.currentStreak)", subtitle: "days active")
                        StatCard(title: "Workouts", value: "\(appState.completedSessions.count)", subtitle: "completed")
                    }
                    .padding(.horizontal)

                    // User info section
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Personal Info")
                            .font(.headline)
                            .padding(.horizontal)
                            .padding(.bottom, 10)

                        VStack(spacing: 0) {
                            ProfileRow(label: "Name", value: appState.profile.name)
                            Divider().padding(.leading)
                            ProfileRow(label: "Age", value: "\(appState.profile.age) years old")
                            Divider().padding(.leading)
                            ProfileRow(label: "Weight", value: String(format: "%.1f kg", appState.profile.weightKg))
                            Divider().padding(.leading)
                            ProfileRow(label: "Goal", value: appState.profile.goal)
                        }
                        .background(Color(.systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color(.systemGray5), lineWidth: 0.5)
                        )
                        .padding(.horizontal)
                    }

                    // Supabase auth placeholder — swap this section out when Supabase is set up
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Account")
                            .font(.headline)
                            .padding(.horizontal)
                            .padding(.bottom, 10)

                        VStack(spacing: 0) {
                            HStack {
                                Image(systemName: "person.crop.circle.badge.xmark")
                                    .foregroundStyle(.secondary)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Not logged in")
                                        .fontWeight(.medium)
                                    Text("Login with Supabase coming soon")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                // TODO: Replace with Supabase login trigger
                                Button("Login") {
                                    // supabaseAuth.signIn()
                                }
                                .buttonStyle(.bordered)
                                .controlSize(.small)
                                .disabled(true)
                            }
                            .padding()

                            Divider().padding(.leading)

                            HStack {
                                Image(systemName: "icloud.slash")
                                    .foregroundStyle(.secondary)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Cloud sync disabled")
                                        .fontWeight(.medium)
                                    Text("Your progress is saved locally only")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                            }
                            .padding()
                        }
                        .background(Color(.systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color(.systemGray5), lineWidth: 0.5)
                        )
                        .padding(.horizontal)
                    }

                }
                .padding(.bottom, 32)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isEditing ? "Done" : "Edit") {
                        isEditing.toggle()
                    }
                }
            }
            .sheet(isPresented: $isEditing) {
                EditProfileSheet()
                    .environmentObject(appState)
            }
        }
    }
}

// MARK: - Edit sheet
struct EditProfileSheet: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Info") {
                    TextField("Name", text: $appState.profile.name)
                    Stepper("Age: \(appState.profile.age)", value: $appState.profile.age, in: 10...90)
                    Stepper("Weight: \(String(format: "%.1f", appState.profile.weightKg)) kg", value: $appState.profile.weightKg, in: 30...200, step: 0.5)
                    TextField("Goal", text: $appState.profile.goal)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

// MARK: - Helper row
struct ProfileRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
        .padding(.horizontal)
        .padding(.vertical, 14)
    }
}
