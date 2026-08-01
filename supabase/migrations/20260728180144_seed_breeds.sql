-- ============================================================================
-- Seed Dog Breeds
-- ============================================================================
-- Populates the breeds reference table with common UK dog breeds.
-- Safe to run multiple times.
-- ============================================================================

insert into public.breeds (name, slug)
values
('Labrador Retriever', 'labrador-retriever'),
('Golden Retriever', 'golden-retriever'),
('Cockapoo', 'cockapoo'),
('Cavapoo', 'cavapoo'),
('Labradoodle', 'labradoodle'),
('Goldendoodle', 'goldendoodle'),
('Cocker Spaniel', 'cocker-spaniel'),
('English Springer Spaniel', 'english-springer-spaniel'),
('Border Collie', 'border-collie'),
('French Bulldog', 'french-bulldog'),
('Dachshund', 'dachshund'),
('Jack Russell Terrier', 'jack-russell-terrier'),
('Staffordshire Bull Terrier', 'staffordshire-bull-terrier'),
('German Shepherd', 'german-shepherd'),
('Boxer', 'boxer'),
('Beagle', 'beagle'),
('Shih Tzu', 'shih-tzu'),
('Cavalier King Charles Spaniel', 'cavalier-king-charles-spaniel'),
('Pug', 'pug'),
('Chihuahua', 'chihuahua'),
('Miniature Schnauzer', 'miniature-schnauzer'),
('West Highland White Terrier', 'west-highland-white-terrier'),
('Yorkshire Terrier', 'yorkshire-terrier'),
('Whippet', 'whippet'),
('Greyhound', 'greyhound'),
('Hungarian Vizsla', 'hungarian-vizsla'),
('Weimaraner', 'weimaraner'),
('Dobermann', 'dobermann'),
('Rottweiler', 'rottweiler'),
('Great Dane', 'great-dane'),
('Bernese Mountain Dog', 'bernese-mountain-dog'),
('Newfoundland', 'newfoundland'),
('Old English Sheepdog', 'old-english-sheepdog'),
('Pembroke Welsh Corgi', 'pembroke-welsh-corgi'),
('Shetland Sheepdog', 'shetland-sheepdog'),
('Bichon Frise', 'bichon-frise'),
('Boston Terrier', 'boston-terrier'),
('Pomeranian', 'pomeranian'),
('Mixed Breed', 'mixed-breed'),
('Unknown', 'unknown')
on conflict (slug) do nothing;