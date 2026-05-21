# FitReward App Starter

SwiftUI-first starter for a fitness reward app.

## Stack Direction

- **iOS Frontend:** SwiftUI
- **Backend:** Python FastAPI placeholder
- **Database/Auth:** Supabase placeholder
- **Future:** HealthKit, push notifications, reward engine, workout recommendations

## Current Scope

This zip starts with the SwiftUI app only. Backend, Supabase, and deployment folders are placeholders so the full-stack structure is ready.

## Folder Structure

```txt
FitRewardAppStarter/
  ios/FitRewardApp/FitRewardApp/
    App/
    Models/
    Views/
    Components/
    ViewModels/
    Services/
    Utils/
    Resources/
  backend-fastapi/
  supabase/
  deployment/
  docs/
```

## How to Use the SwiftUI Files

1. Open Xcode.
2. Create a new iOS App project named `FitRewardApp`.
3. Choose:
   - Interface: SwiftUI
   - Language: Swift
4. Replace the generated files with the files inside:

```txt
ios/FitRewardApp/FitRewardApp/
```

5. Run on iPhone simulator.

## MVP Features Included in SwiftUI Starter

- Home dashboard
- Workout list
- Workout detail page
- Workout timer
- Rewards page
- Profile page
- Difficulty and duration selection
- Mock data service

## Backend Placeholder

FastAPI files are intentionally minimal. Build this after the SwiftUI flow is stable.

## Supabase Placeholder

SQL schema placeholder is included for future tables:

- users/profile
- workouts
- completed_workouts
- rewards
- goals
- streaks
