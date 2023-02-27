DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS card;
DROP TABLE IF EXISTS collection;
DROP TABLE IF EXISTS badges;
DROP TABLE IF EXISTS badges_user_can_give;
DROP TABLE IF EXISTS badges_user_has;
DROP TABLE IF EXISTS friends;
DROP TABLE IF EXISTS collection_card;
DROP TABLE IF EXISTS profile_pokemons;

DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE profile_pokemons (
    image_id SERIAL PRIMARY KEY,
    pokemon VARCHAR(20)
);

CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) DEFAULT 'ROLE_USER' NOT NULL,
	email varchar(40),
    full_name varchar(40),
    shipping_address varchar(150),
    bio varchar(800),
    profile_pokemon int,
    is_premium boolean DEFAULT false,
    pronouns varchar(30),
    CONSTRAINT FK_users_profile_pokemons FOREIGN KEY(profile_pokemon) REFERENCES profile_pokemons(image_id),
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE badges (
    badge_name varchar(20) PRIMARY KEY
);

CREATE TABLE badges_user_can_give (
    user_id int,
    badge_name varchar(20),
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_badge_name FOREIGN KEY (badge_name) REFERENCES badges(badge_name),
    PRIMARY KEY (user_id, badge_name)
);

CREATE TABLE badges_user_has (
    user_id int,
    badge_name varchar(20),
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_badge_name FOREIGN KEY (badge_name) REFERENCES badges(badge_name),
    PRIMARY KEY (user_id, badge_name)
);

CREATE TABLE friends (
    from_user_id int,
    to_user_id int,
    accepted boolean DEFAULT false,
    CONSTRAINT FK_friends_from FOREIGN KEY (from_user_id) REFERENCES users(user_id),
    CONSTRAINT FK_friends_to FOREIGN KEY (to_user_id) REFERENCES users(user_id),
    CONSTRAINT from_user_id_cannot_be_to_user_id CHECK (from_user_id != to_user_id),
    PRIMARY KEY (from_user_id, to_user_id)
);

CREATE TABLE card (
    card_id varchar(20) PRIMARY KEY,
    name varchar(30) NOT NULL,
    large_image varchar(200) NOT NULL,
    small_image varchar(200) NOT NULL,
    super_type VARCHAR(20),
    hp INT,
    rarity varchar(20)
);

CREATE TABLE collection (
    collection_id SERIAL PRIMARY KEY,
    user_id int,
    name varchar(50) NOT NULL,
    description varchar(250),
    is_private boolean default false,
    CONSTRAINT FK_collection_user FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE collection_card (
    collection_id int ,
    card_id varchar(20),
    quantity int DEFAULT 1,
    CONSTRAINT FK_collection_card_collection FOREIGN KEY(collection_id) REFERENCES collection(collection_id),
    CONSTRAINT FK_collection_card_card FOREIGN KEY(card_id) REFERENCES card(card_id),
    PRIMARY KEY (collection_id, card_id)
);

CREATE TABLE subtype (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE card_subtype (
    card_id VARCHAR(20),
    subtype_id INT,
    CONSTRAINT FK_card_subtype_card_id FOREIGN KEY(card_id) REFERENCES card(card_id),
    CONSTRAINT FK_card_subtype_subtype_id FOREIGN KEY(subtype_id) REFERENCES subtype(id),
    PRIMARY KEY (card_id, subtype_id)
);

CREATE TABLE type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE card_type (
    card_id VARCHAR(20),
    type_id INT,
    CONSTRAINT FK_card_type_card_id FOREIGN KEY(card_id) REFERENCES card(card_id),
    CONSTRAINT FK_card_type_type_id FOREIGN KEY(type_id) REFERENCES type(id),
    PRIMARY KEY (card_id, type_id)
);

CREATE TABLE set (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50),
    series VARCHAR(50),
    printed_total INT,
    symbol_image VARCHAR(200),
    logo_image VARCHAR(200)
);

CREATE TABLE card_set (
    card_id VARCHAR(20),
    set_id VARCHAR(20),
    CONSTRAINT FK_card_set_card_id FOREIGN KEY(card_id) REFERENCES card(card_id),
    CONSTRAINT FK_card_set_set_id FOREIGN KEY(set_id) REFERENCES set(id),
    PRIMARY KEY (card_id, set_id)
);



-- Add seed data in the 03_data.sql script file

-- Add Foreign key constraints in the 04_constraints.sql script file
