-- ============================================================================
-- Create Dogs Table
-- ============================================================================
-- Stores dog profiles belonging to user accounts.
-- One profile can own multiple dogs.
-- ============================================================================

create table public.dogs (
    id uuid
    constraint pk_dogs
    primary key
    default gen_random_uuid(),

    profile_id uuid not null,

    name varchar(100) not null,

    breed_id uuid not null,

    date_of_birth date,

    sex varchar(10),

    weight_kg numeric(5,2),

    size varchar(20),

    activity_level varchar(20),

    max_walk_distance_meters integer,

    photo_url text,

    notes text,

    display_order integer not null default 1,

    is_active boolean not null default true,

    is_deleted boolean not null default false,

    deleted_at timestamptz,

    created_at timestamptz not null default now(),

    updated_at timestamptz not null default now(),

    constraint fk_dogs_profile
        foreign key (profile_id)
        references public.profiles(id)
        on delete cascade,

    constraint fk_dogs_breed
    foreign key (breed_id)
    references public.breeds(id)
    on delete restrict,

    constraint chk_dogs_name
        check (length(trim(name)) > 0),

    constraint chk_dogs_sex
        check (
            sex is null
            or sex in ('Male', 'Female')
        ),

    constraint chk_dogs_size
        check (
            size is null
            or size in (
                'Toy',
                'Small',
                'Medium',
                'Large',
                'Giant'
            )
        ),

    constraint chk_dogs_activity_level
        check (
            activity_level is null
            or activity_level in (
                'Low',
                'Medium',
                'High'
            )
        ),

    constraint chk_dogs_weight
        check (
            weight_kg is null
            or weight_kg > 0
        ),

    constraint chk_dogs_walk_distance
        check (
            max_walk_distance_meters is null
            or max_walk_distance_meters > 0
        )
);

-- ============================================================================
-- Table Comments
-- ============================================================================

comment on table public.dogs is
'Stores dog profiles belonging to user accounts. One profile can own multiple dogs.';

comment on column public.dogs.profile_id is
'References the profile that owns this dog.';

comment on column public.dogs.breed_id is
'References the selected breed from the breeds reference table.';

comment on column public.dogs.activity_level is
'Typical activity level of the dog (Low, Medium, High).';

comment on column public.dogs.max_walk_distance_meters is
'Preferred maximum walking distance stored in metres.';


-- ============================================================================
-- Indexes
-- ============================================================================

create index idx_dogs_profile_id
    on public.dogs (profile_id);

create index idx_dogs_breed_id
    on public.dogs (breed_id);

create index idx_dogs_active
    on public.dogs (is_active);

    -- ============================================================================
-- Updated At Trigger
-- ============================================================================

create trigger trg_dogs_set_updated_at
before update on public.dogs
for each row
execute function public.set_updated_at();