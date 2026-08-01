-- ============================================================================
-- Create Breeds Table
-- ============================================================================
-- Master list of recognised dog breeds used throughout WagScape.
-- ============================================================================

create table public.breeds (

    id uuid
        constraint pk_breeds
        primary key
        default gen_random_uuid(),

    name varchar(100) not null
    constraint uk_breeds_name
    unique
    constraint chk_breeds_name
    check (length(trim(name)) > 0),

    slug varchar(100) not null
        constraint uk_breeds_slug
        unique
        constraint chk_breeds_slug
        check (length(trim(slug)) > 0),

    is_active boolean not null default true,

    created_at timestamptz not null default now(),

    updated_at timestamptz not null default now()

);

-- ============================================================================
-- Table Comments
-- ============================================================================

comment on table public.breeds is
'Master list of recognised dog breeds used by WagScape.';

comment on column public.breeds.name is
'Display name of the breed shown to users.';

comment on column public.breeds.slug is
'Unique URL-friendly identifier for the breed.';

-- ============================================================================
-- Indexes
-- ============================================================================

create index idx_breeds_name
on public.breeds(name);

create index idx_breeds_active
on public.breeds(is_active);

-- ============================================================================
-- Updated At Trigger
-- ============================================================================

create trigger trg_breeds_set_updated_at
before update on public.breeds
for each row
execute function public.set_updated_at();