# Product Concept One Pager: FitReward

## Product Vision
FitReward is a mobile fitness app that helps users exercise at home through simple workouts, progress tracking, and a reward system. The goal is to make exercise feel easier to start, more enjoyable, and more consistent.

## Problem Statement
Many people want to stay fit but struggle with motivation, consistency, or the effort of going to a gym. Existing fitness routines can feel boring, intimidating, or too difficult to maintain. FitReward solves this by offering short guided workouts, clear progress tracking, and rewards that encourage users to keep going.

## Target Users
- People who want to exercise at home
- Beginners who feel uncomfortable going to the gym
- Users who need motivation through goals, streaks, and rewards

## User Needs
- Easy workouts they can do without gym equipment
- A fun reason to continue exercising
- Simple progress tracking for consistency and improvement

## Solution Overview
FitReward is a SwiftUI fitness app where users can choose workouts based on difficulty and available time. Users complete guided workouts with timers, earn points and badges, track their history, and view their progress from a simple dashboard.

## MVP Features
1. Reward system with points and badges
2. Exercise page with prebuilt workouts
3. Profile page for basic user information and progress tracking
4. Workout timer for exercise and rest periods
5. Daily or weekly goals
6. Dashboard showing rewards, workout history, and progress
7. Difficulty and duration selector
8. Workout completion screen

## Technology Stack

### iOS Frontend
SwiftUI for building the native iOS app.

### Backend
Python FastAPI for future API endpoints, workout data, user progress, and reward logic.

### Database/Auth
Supabase for authentication, PostgreSQL database, and user data storage.

### Additional Technologies
Supabase Auth, Swift Charts, UserNotifications, and optional future HealthKit integration.

### Deployment
Apple App Store for the iOS app, Supabase Cloud for backend database/auth, and a cloud host such as Render/Fly.io/Railway for FastAPI.

## Technical Feasibility

### Required Skills
- SwiftUI layout and navigation
- State management in SwiftUI
- Basic API integration
- FastAPI backend development
- Supabase Auth and PostgreSQL

### Current Experience
The first version can be built as a frontend-only prototype using mock data. This makes the project realistic because the user experience can be tested before connecting the backend.

### Learning Needs
- SwiftUI app architecture
- Connecting SwiftUI to REST APIs
- Supabase authentication flow
- Database schema design

### Technical Challenges
- Making the reward system motivating without being too complicated
- Keeping the app simple for beginners
- Syncing workout progress between the iOS app and backend
- Handling login, streaks, and reminders correctly
