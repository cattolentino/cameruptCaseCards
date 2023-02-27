INSERT INTO profile_pokemons (pokemon) VALUES ('Camerupt');
INSERT INTO profile_pokemons (pokemon) VALUES ('Bulbasaur');
INSERT INTO profile_pokemons (pokemon) VALUES ('Squirtle');
INSERT INTO profile_pokemons (pokemon) VALUES ('Charmander');
INSERT INTO profile_pokemons (pokemon) VALUES ('Pikachu');
INSERT INTO profile_pokemons (pokemon) VALUES ('Chikorita');
INSERT INTO profile_pokemons (pokemon) VALUES ('Totodile');
INSERT INTO profile_pokemons (pokemon) VALUES ('Cyndaquil');
INSERT INTO profile_pokemons (pokemon) VALUES ('Treecko');
INSERT INTO profile_pokemons (pokemon) VALUES ('Mudkip');
INSERT INTO profile_pokemons (pokemon) VALUES ('Torchic');

INSERT INTO badges (badge_name) VALUES ('earthBadge');
INSERT INTO badges (badge_name) VALUES ('volcanoBadge');
INSERT INTO badges (badge_name) VALUES ('marshBadge');
INSERT INTO badges (badge_name) VALUES ('soulBadge');
INSERT INTO badges (badge_name) VALUES ('rainbowBadge');
INSERT INTO badges (badge_name) VALUES ('thunderBadge');
INSERT INTO badges (badge_name) VALUES ('cascadeBadge');
INSERT INTO badges (badge_name) VALUES ('boulderBadge');

INSERT INTO type (name) VALUES ('Fire');
INSERT INTO type (name) VALUES ('Water');
INSERT INTO type (name) VALUES ('Grass');
INSERT INTO type (name) VALUES ('Lightning');
INSERT INTO type (name) VALUES ('Fighting');
INSERT INTO type (name) VALUES ('Psychic');
INSERT INTO type (name) VALUES ('Colorless');
INSERT INTO type (name) VALUES ('Darkness');
INSERT INTO type (name) VALUES ('Metal');
INSERT INTO type (name) VALUES ('Dragon');
INSERT INTO type (name) VALUES ('Fairy');

--INSERT INTO badges_user_has (user_id, badge_name) VALUES (1, 'earthBadge');
--INSERT INTO badges_user_has (user_id, badge_name) VALUES (1, 'volcanoBadge');
--INSERT INTO badges_user_has (user_id, badge_name) VALUES (2, 'thunderBadge');
--INSERT INTO badges_user_has (user_id, badge_name) VALUES (1, 'marshBadge');
--
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (1, 'earthBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (1, 'volcanoBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (1, 'marshBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (1, 'soulBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (1, 'rainbowBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (1, 'thunderBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (1, 'cascadeBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (1, 'boulderBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (2, 'earthBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (2, 'volcanoBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (2, 'marshBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (2, 'soulBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (2, 'rainbowBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (2, 'thunderBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (2, 'cascadeBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (2, 'boulderBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (3, 'earthBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (3, 'volcanoBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (3, 'marshBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (3, 'soulBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (3, 'rainbowBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (3, 'thunderBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (3, 'cascadeBadge');
--INSERT INTO badges_user_can_give (user_id, badge_name) VALUES (3, 'boulderBadge');

-- insert users table data
--INSERT INTO users (user_id, username, password_hash, role, email, profile_pokemon) VALUES (1, 'user',
--    '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'fake@fake.com', 1);
--INSERT INTO users (user_id, username, password_hash, role, email, profile_pokemon) VALUES (3, 'admin',
--    '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN','fake@fake.com', 2);
--INSERT INTO users (user_id, username, password_hash, role, email, full_name, shipping_address, bio, profile_pokemon)
--    VALUES (2, 'testuser', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','fake@fake.com',
--    'User User', '1000 User Ave NE WA', 'Hello! Im a friendly user.', 4);

--ALTER SEQUENCE seq_user_id RESTART WITH 4;

-- insert ??? table data
--INSERT INTO card (card_id, name, large_image, small_image) VALUES ('dp3-3', 'Charizard', 'https://images.pokemontcg.io/dp3/3_hires.png',
--    'https://images.pokemontcg.io/dp3/3.png');
--INSERT INTO card (card_id, name, large_image, small_image) VALUES ('pl1-1', 'Ampharos', 'https://images.pokemontcg.io/pl1/1_hires.png',
--    'https://images.pokemontcg.io/pl1/1.png');
--INSERT INTO card (card_id, name, large_image, small_image) VALUES ('det1-1', 'Bulbasaur', 'https://images.pokemontcg.io/det1/1_hires.png',
--    'https://images.pokemontcg.io/det1/1.png');
--
--INSERT INTO collection (user_id, name, description) VALUES (1, 'Three Starters', 'A test of our database');
--INSERT INTO collection (user_id, name, description) VALUES (3, 'Just Bulbasaur',
--    'This collection should only have Bulbasaur');
--INSERT INTO collection (user_id, name, description, is_private) VALUES (3, 'Set To Private',
--    'This collection should be set to private', true);
--
--INSERT INTO collection_card (collection_id, card_id, quantity) VALUES (1, 'dp3-3', 5);
--INSERT INTO collection_card (collection_id, card_id, quantity) VALUES (1, 'pl1-1', 5);
--INSERT INTO collection_card (collection_id, card_id, quantity) VALUES (1, 'det1-1', 5);
--INSERT INTO collection_card (collection_id, card_id) VALUES (2, 'det1-1');
--INSERT INTO collection_card (collection_id, card_id) VALUES (3, 'dp3-3');
--INSERT INTO collection_card (collection_id, card_id) VALUES (3, 'det1-1');
