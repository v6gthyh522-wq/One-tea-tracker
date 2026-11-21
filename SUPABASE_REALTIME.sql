-- ONETEA Tracker v3 FIXED: Realtime publication migration
-- Run once in Supabase SQL Editor if realtime changes are not being delivered.
do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'orders'
  ) then alter publication supabase_realtime add table public.orders; end if;
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'shifts'
  ) then alter publication supabase_realtime add table public.shifts; end if;
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'finances'
  ) then alter publication supabase_realtime add table public.finances; end if;
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'app_settings'
  ) then alter publication supabase_realtime add table public.app_settings; end if;
end $$;
