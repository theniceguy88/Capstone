import Foundation

// TODO: Replace this entire file with the Supabase Swift SDK when ready.
// Steps to activate:
//   1. Add Supabase Swift package: https://github.com/supabase/supabase-swift
//   2. Replace SupabaseAuth below with the real client
//   3. Remove the `disabled(true)` on the Login button in ProfileView
//   4. Wire signIn() and signOut() to your Supabase project URL + anon key

final class SupabaseAuth: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var userId: String? = nil

    func signIn() {
        // TODO: supabase.auth.signInWithOAuth(provider: .google)
    }

    func signOut() {
        // TODO: supabase.auth.signOut()
        isLoggedIn = false
        userId = nil
    }
}
