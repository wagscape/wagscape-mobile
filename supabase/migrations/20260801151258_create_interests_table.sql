-- ============================================================================
-- Create Interests Table
-- ============================================================================
-- Master list of activities and experiences that owners and dogs can enjoy.
-- ============================================================================

create table public.interests (

    id uuid
        constraint pk_interests
        primary key
        default gen_random_uuid(),

    name varchar(100) not null
        constraint uk_interests_name
        unique
        constraint chk_interests_name
        check (length(trim(name)) > 0),

    slug varchar(100) not null
        constraint uk_interests_slug
        unique
        constraint chk_interests_slug
        check (length(trim(slug)) > 0),

    category varchar(50) not null
        constraint chk_interests_category
        check (
            category in (
                'Outdoor',
                'Social',
                'Adventure',
                'Relaxation'
            )
        ),

    icon_key varchar(50) not null,

    display_order integer not null default 1,

    is_active boolean not null default true,

    created_at timestamptz not null default now(),

    updated_at timestamptz not null default now()

);

-- ============================================================================
-- Table Comments
-- ============================================================================

comment on table public.interests is
'Master list of activities and experiences available throughout WagScape.';

comment on column public.interests.name is
'Display name shown to users.';

comment on column public.interests.slug is
'Unique URL-friendly identifier.';

comment on column public.interests.category is
'Grouping used during onboarding and filtering.';

comment on column public.interests.icon_key is
'Frontend icon identifier.';

comment on column public.interests.display_order is
'Controls display order within the app.';

-- ============================================================================
-- Indexes
-- ============================================================================

create index idx_interests_category
on public.interests(category);

create index idx_interests_active
on public.interests(is_active);

create index idx_interests_display_order
on public.interests(display_order);


-- ============================================================================
-- Updated At Trigger
-- ============================================================================

create trigger trg_interests_set_updated_at
before update on public.interests
for each row
execute function public.set_updated_at();