-- =====================================================
-- WagScape - Profiles Table
-- Stores registered user accounts
-- =====================================================

create table public.profiles (

    id uuid
    constraint pk_profiles primary key
    default gen_random_uuid(),

    display_name varchar(100) not null
        constraint chk_profiles_display_name
        check (length(trim(display_name)) > 0),

    email citext not null unique
        constraint chk_profiles_email
        check (position('@' in email) > 1),

    country varchar(100) not null,

    region varchar(50) not null
        constraint chk_profiles_region
        check (
            region in (
                'England',
                'Scotland',
                'Wales',
                'Northern Ireland'
            )
        ),

    postcode varchar(20),

    avatar_url text,

    marketing_emails boolean not null default false,

    push_notifications boolean not null default true,

    onboarding_completed boolean not null default false,

    is_active boolean not null default true,

    is_deleted boolean not null default false,

    last_login_at timestamptz,

    deleted_at timestamptz,

    created_at timestamptz not null default now(),

    updated_at timestamptz not null default now()

);

comment on table public.profiles is
'Stores WagScape user profiles.';

comment on column public.profiles.display_name is
'The display name shown throughout the application.';

comment on column public.profiles.email is
'Unique case-insensitive email address.';

comment on column public.profiles.country is
'Full country name, e.g. United Kingdom.';

comment on column public.profiles.region is
'Administrative region within the country.';

create index idx_profiles_active
on public.profiles(is_active);




