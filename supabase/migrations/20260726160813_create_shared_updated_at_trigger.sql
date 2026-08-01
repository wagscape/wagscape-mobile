-- =====================================================
-- Shared updated_at trigger function
-- Used by all WagScape tables
-- =====================================================

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
    new.updated_at = now();
    return new;
end;
$$;