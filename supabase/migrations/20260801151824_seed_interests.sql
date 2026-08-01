-- ============================================================================
-- Seed Interests
-- ============================================================================
-- Populates the interests reference table with experiences that owners and
-- dogs enjoy together.
-- Safe to run multiple times.
-- ============================================================================

insert into public.interests
(name, slug, category, icon_key, display_order)
values

-- ==========================================================
-- Outdoor
-- ==========================================================

('Beaches', 'beaches', 'Outdoor', 'beach', 1),
('Swimming', 'swimming', 'Outdoor', 'waves', 2),
('Woodland Walks', 'woodland-walks', 'Outdoor', 'forest', 3),
('Hiking', 'hiking', 'Outdoor', 'hiking', 4),
('Open Countryside', 'open-countryside', 'Outdoor', 'landscape', 5),
('National Parks', 'national-parks', 'Outdoor', 'park', 6),
('Lakes', 'lakes', 'Outdoor', 'water', 7),
('Rivers', 'rivers', 'Outdoor', 'river', 8),

-- ==========================================================
-- Social
-- ==========================================================

('Dog-friendly Cafés', 'dog-friendly-cafes', 'Social', 'coffee', 1),
('Dog-friendly Pubs', 'dog-friendly-pubs', 'Social', 'local_bar', 2),
('Meeting Other Dogs', 'meeting-other-dogs', 'Social', 'pets', 3),
('Dog Parks', 'dog-parks', 'Social', 'pets', 4),

-- ==========================================================
-- Adventure
-- ==========================================================

('Boat Trips', 'boat-trips', 'Adventure', 'directions_boat', 1),
('Camping', 'camping', 'Adventure', 'camping', 2),
('Paddle Boarding', 'paddle-boarding', 'Adventure', 'kayaking', 3),
('Canoeing', 'canoeing', 'Adventure', 'kayaking', 4),
('Wildlife Watching', 'wildlife-watching', 'Adventure', 'visibility', 5),

-- ==========================================================
-- Relaxation
-- ==========================================================

('Quiet Walks', 'quiet-walks', 'Relaxation', 'self_improvement', 1),
('Scenic Views', 'scenic-views', 'Relaxation', 'photo', 2),
('Peaceful Locations', 'peaceful-locations', 'Relaxation', 'spa', 3),
('Enclosed Gardens', 'enclosed-gardens', 'Relaxation', 'yard', 4)

on conflict (slug) do nothing;