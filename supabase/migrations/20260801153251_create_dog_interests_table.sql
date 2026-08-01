-- ============================================================================
-- Create Dog Interests Table
-- ============================================================================
-- Links dogs with their favourite interests.
-- Supports optional importance scoring for recommendation ranking.
-- ============================================================================

create table public.dog_interests (

    id uuid
        constraint pk_dog_interests
        primary key
        default gen_random_uuid(),

    dog_id uuid not null,

    interest_id uuid not null,

    importance smallint,

    created_at timestamptz not null default now(),

    constraint fk_dog_interests_dog
        foreign key (dog_id)
        references public.dogs(id)
        on delete cascade,

    constraint fk_dog_interests_interest
        foreign key (interest_id)
        references public.interests(id)
        on delete cascade,

    constraint uk_dog_interests
        unique (dog_id, interest_id),

    constraint chk_dog_interests_importance
        check (
            importance is null
            or importance between 1 and 5
        )

);


-- ============================================================================
-- Table Comments
-- ============================================================================

comment on table public.dog_interests is
'Links dogs to their favourite holiday interests.';

comment on column public.dog_interests.importance is
'Optional importance rating from 1 (nice to have) to 5 (essential) used when ranking recommendations.';

comment on column public.dog_interests.created_at is
'Date and time the interest was added to the dog profile.';


-- ============================================================================
-- Indexes
-- ============================================================================

create index idx_dog_interests_dog
on public.dog_interests(dog_id);

create index idx_dog_interests_interest
on public.dog_interests(interest_id);


