-- Placeholder schema for future Supabase setup.
-- Do not run as final production SQL yet.

create table if not exists profiles (
  id uuid primary key,
  name text,
  age int,
  weight_kg numeric,
  goal text,
  total_points int default 0,
  current_streak int default 0,
  created_at timestamp with time zone default now()
);

create table if not exists workouts (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  difficulty text not null,
  estimated_minutes int not null,
  reward_points int not null,
  created_at timestamp with time zone default now()
);

create table if not exists completed_workouts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id),
  workout_id uuid references workouts(id),
  points_earned int not null,
  duration_minutes int not null,
  completed_at timestamp with time zone default now()
);

create table if not exists rewards (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  required_points int not null,
  created_at timestamp with time zone default now()
);
