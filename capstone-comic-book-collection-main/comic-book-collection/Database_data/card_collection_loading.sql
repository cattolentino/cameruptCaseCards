--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8
-- Dumped by pg_dump version 12.8

-- Started on 2023-02-09 14:35:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 51919)
-- Name: badges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.badges (
    badge_name character varying(20) NOT NULL
);


ALTER TABLE public.badges OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 51924)
-- Name: badges_user_can_give; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.badges_user_can_give (
    user_id integer NOT NULL,
    badge_name character varying(20) NOT NULL
);


ALTER TABLE public.badges_user_can_give OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 51939)
-- Name: badges_user_has; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.badges_user_has (
    user_id integer NOT NULL,
    badge_name character varying(20) NOT NULL
);


ALTER TABLE public.badges_user_has OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 51971)
-- Name: card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card (
    card_id character varying(20) NOT NULL,
    name character varying(30) NOT NULL,
    large_image character varying(200) NOT NULL,
    small_image character varying(200) NOT NULL,
    super_type character varying(20),
    hp integer,
    rarity character varying(20)
);


ALTER TABLE public.card OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 52064)
-- Name: card_set; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_set (
    card_id character varying(20) NOT NULL,
    set_id character varying(20) NOT NULL
);


ALTER TABLE public.card_set OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 52016)
-- Name: card_subtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_subtype (
    card_id character varying(20) NOT NULL,
    subtype_id integer NOT NULL
);


ALTER TABLE public.card_subtype OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 52041)
-- Name: card_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_type (
    card_id character varying(20) NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.card_type OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 51978)
-- Name: collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection (
    collection_id integer NOT NULL,
    user_id integer,
    name character varying(50) NOT NULL,
    description character varying(250),
    is_private boolean DEFAULT false
);


ALTER TABLE public.collection OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 51990)
-- Name: collection_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_card (
    collection_id integer NOT NULL,
    card_id character varying(20) NOT NULL,
    quantity integer DEFAULT 1
);


ALTER TABLE public.collection_card OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 51976)
-- Name: collection_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_collection_id_seq OWNER TO postgres;

--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 211
-- Name: collection_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_collection_id_seq OWNED BY public.collection.collection_id;


--
-- TOC entry 209 (class 1259 OID 51954)
-- Name: friends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friends (
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    accepted boolean DEFAULT false,
    CONSTRAINT from_user_id_cannot_be_to_user_id CHECK ((from_user_id <> to_user_id))
);


ALTER TABLE public.friends OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 51897)
-- Name: profile_pokemons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_pokemons (
    image_id integer NOT NULL,
    pokemon character varying(20)
);


ALTER TABLE public.profile_pokemons OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 51895)
-- Name: profile_pokemons_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profile_pokemons_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_pokemons_image_id_seq OWNER TO postgres;

--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 203
-- Name: profile_pokemons_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profile_pokemons_image_id_seq OWNED BY public.profile_pokemons.image_id;


--
-- TOC entry 202 (class 1259 OID 51893)
-- Name: seq_user_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_user_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_user_id OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 52056)
-- Name: set; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.set (
    id character varying(20) NOT NULL,
    name character varying(50),
    series character varying(50),
    printed_total integer,
    symbol_image character varying(200),
    logo_image character varying(200)
);


ALTER TABLE public.set OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 52008)
-- Name: subtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subtype (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.subtype OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 52006)
-- Name: subtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subtype_id_seq OWNER TO postgres;

--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 214
-- Name: subtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subtype_id_seq OWNED BY public.subtype.id;


--
-- TOC entry 218 (class 1259 OID 52033)
-- Name: type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.type OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 52031)
-- Name: type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_id_seq OWNER TO postgres;

--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 217
-- Name: type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_id_seq OWNED BY public.type.id;


--
-- TOC entry 205 (class 1259 OID 51903)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer DEFAULT nextval('public.seq_user_id'::regclass) NOT NULL,
    username character varying(50) NOT NULL,
    password_hash character varying(200) NOT NULL,
    role character varying(50) DEFAULT 'ROLE_USER'::character varying NOT NULL,
    email character varying(40),
    full_name character varying(40),
    shipping_address character varying(150),
    bio character varying(800),
    profile_pokemon integer,
    is_premium boolean DEFAULT false,
    pronouns character varying(30)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2759 (class 2604 OID 51981)
-- Name: collection collection_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection ALTER COLUMN collection_id SET DEFAULT nextval('public.collection_collection_id_seq'::regclass);


--
-- TOC entry 2753 (class 2604 OID 51900)
-- Name: profile_pokemons image_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_pokemons ALTER COLUMN image_id SET DEFAULT nextval('public.profile_pokemons_image_id_seq'::regclass);


--
-- TOC entry 2762 (class 2604 OID 52011)
-- Name: subtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtype ALTER COLUMN id SET DEFAULT nextval('public.subtype_id_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 52036)
-- Name: type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type ALTER COLUMN id SET DEFAULT nextval('public.type_id_seq'::regclass);


--
-- TOC entry 2944 (class 0 OID 51919)
-- Dependencies: 206
-- Data for Name: badges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.badges (badge_name) FROM stdin;
earthBadge
volcanoBadge
marshBadge
soulBadge
rainbowBadge
thunderBadge
cascadeBadge
boulderBadge
\.


--
-- TOC entry 2945 (class 0 OID 51924)
-- Dependencies: 207
-- Data for Name: badges_user_can_give; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.badges_user_can_give (user_id, badge_name) FROM stdin;
1	volcanoBadge
1	soulBadge
1	rainbowBadge
2	marshBadge
2	soulBadge
2	rainbowBadge
2	thunderBadge
2	boulderBadge
3	earthBadge
3	volcanoBadge
3	marshBadge
3	soulBadge
3	rainbowBadge
3	thunderBadge
3	cascadeBadge
3	boulderBadge
4	earthBadge
4	volcanoBadge
4	marshBadge
4	soulBadge
4	rainbowBadge
4	thunderBadge
4	cascadeBadge
4	boulderBadge
5	earthBadge
5	volcanoBadge
5	marshBadge
5	thunderBadge
6	earthBadge
6	volcanoBadge
6	marshBadge
6	soulBadge
6	rainbowBadge
6	thunderBadge
6	cascadeBadge
6	boulderBadge
7	earthBadge
7	volcanoBadge
7	marshBadge
7	soulBadge
7	rainbowBadge
7	thunderBadge
7	cascadeBadge
7	boulderBadge
9	earthBadge
9	volcanoBadge
9	marshBadge
9	soulBadge
9	rainbowBadge
9	thunderBadge
9	cascadeBadge
9	boulderBadge
10	volcanoBadge
10	marshBadge
10	soulBadge
10	rainbowBadge
10	thunderBadge
10	cascadeBadge
10	boulderBadge
11	earthBadge
11	volcanoBadge
11	soulBadge
11	rainbowBadge
11	thunderBadge
11	boulderBadge
12	marshBadge
12	soulBadge
12	boulderBadge
13	earthBadge
13	volcanoBadge
13	marshBadge
13	soulBadge
13	rainbowBadge
13	cascadeBadge
13	boulderBadge
14	earthBadge
14	volcanoBadge
14	marshBadge
14	soulBadge
14	rainbowBadge
14	thunderBadge
14	cascadeBadge
14	boulderBadge
1	cascadeBadge
\.


--
-- TOC entry 2946 (class 0 OID 51939)
-- Dependencies: 208
-- Data for Name: badges_user_has; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.badges_user_has (user_id, badge_name) FROM stdin;
2	boulderBadge
1	cascadeBadge
1	volcanoBadge
1	earthBadge
3	earthBadge
3	marshBadge
3	thunderBadge
4	rainbowBadge
4	cascadeBadge
4	soulBadge
3	boulderBadge
6	rainbowBadge
6	volcanoBadge
1	boulderBadge
1	marshBadge
2	soulBadge
6	thunderBadge
7	cascadeBadge
7	earthBadge
9	earthBadge
10	cascadeBadge
9	marshBadge
10	rainbowBadge
9	thunderBadge
11	cascadeBadge
11	earthBadge
2	volcanoBadge
1	thunderBadge
13	cascadeBadge
\.


--
-- TOC entry 2948 (class 0 OID 51971)
-- Dependencies: 210
-- Data for Name: card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card (card_id, name, large_image, small_image, super_type, hp, rarity) FROM stdin;
ex5-78	Togepi	https://images.pokemontcg.io/ex5/78_hires.png	https://images.pokemontcg.io/ex5/78.png	Pokémon	50	Common
basep-30	Togepi	https://images.pokemontcg.io/basep/30_hires.png	https://images.pokemontcg.io/basep/30.png	Pokémon	30	Promo
si1-4	Togepi	https://images.pokemontcg.io/si1/4_hires.png	https://images.pokemontcg.io/si1/4.png	Pokémon	40	\N
xy6-43	Togepi	https://images.pokemontcg.io/xy6/43_hires.png	https://images.pokemontcg.io/xy6/43.png	Pokémon	40	Common
ex11-15	Starmie δ	https://images.pokemontcg.io/ex11/15_hires.png	https://images.pokemontcg.io/ex11/15.png	Pokémon	60	Rare Holo
sm4-16	Starmie	https://images.pokemontcg.io/sm4/16_hires.png	https://images.pokemontcg.io/sm4/16.png	Pokémon	90	Rare
neo3-25	Starmie	https://images.pokemontcg.io/neo3/25_hires.png	https://images.pokemontcg.io/neo3/25.png	Pokémon	70	Rare
xy12-31	Starmie	https://images.pokemontcg.io/xy12/31_hires.png	https://images.pokemontcg.io/xy12/31.png	Pokémon	90	Rare
xy1-34	Starmie	https://images.pokemontcg.io/xy1/34_hires.png	https://images.pokemontcg.io/xy1/34.png	Pokémon	90	Rare
xy8-27	Goldeen	https://images.pokemontcg.io/xy8/27_hires.png	https://images.pokemontcg.io/xy8/27.png	Pokémon	60	Common
ex1-55	Goldeen	https://images.pokemontcg.io/ex1/55_hires.png	https://images.pokemontcg.io/ex1/55.png	Pokémon	50	Common
base2-53	Goldeen	https://images.pokemontcg.io/base2/53_hires.png	https://images.pokemontcg.io/base2/53.png	Pokémon	40	Common
dp1-84	Goldeen	https://images.pokemontcg.io/dp1/84_hires.png	https://images.pokemontcg.io/dp1/84.png	Pokémon	60	Common
base4-76	Goldeen	https://images.pokemontcg.io/base4/76_hires.png	https://images.pokemontcg.io/base4/76.png	Pokémon	40	Common
xy9-25	Staryu	https://images.pokemontcg.io/xy9/25_hires.png	https://images.pokemontcg.io/xy9/25.png	Pokémon	40	Common
base1-65	Staryu	https://images.pokemontcg.io/base1/65_hires.png	https://images.pokemontcg.io/base1/65.png	Pokémon	40	Common
xy5-32	Staryu	https://images.pokemontcg.io/xy5/32_hires.png	https://images.pokemontcg.io/xy5/32.png	Pokémon	60	Common
neo3-56	Staryu	https://images.pokemontcg.io/neo3/56_hires.png	https://images.pokemontcg.io/neo3/56.png	Pokémon	40	Common
ex8-77	Staryu	https://images.pokemontcg.io/ex8/77_hires.png	https://images.pokemontcg.io/ex8/77.png	Pokémon	50	Common
sm75-15	Horsea	https://images.pokemontcg.io/sm75/15_hires.png	https://images.pokemontcg.io/sm75/15.png	Pokémon	40	Common
ex3-33	Horsea	https://images.pokemontcg.io/ex3/33_hires.png	https://images.pokemontcg.io/ex3/33.png	Pokémon	40	Uncommon
xy5-30	Horsea	https://images.pokemontcg.io/xy5/30_hires.png	https://images.pokemontcg.io/xy5/30.png	Pokémon	60	Common
ex7-58	Horsea	https://images.pokemontcg.io/ex7/58_hires.png	https://images.pokemontcg.io/ex7/58.png	Pokémon	50	Common
neo1-62	Horsea	https://images.pokemontcg.io/neo1/62_hires.png	https://images.pokemontcg.io/neo1/62.png	Pokémon	50	Common
ecard2-84	Horsea	https://images.pokemontcg.io/ecard2/84_hires.png	https://images.pokemontcg.io/ecard2/84.png	Pokémon	40	Common
det1-7	Psyduck	https://images.pokemontcg.io/det1/7_hires.png	https://images.pokemontcg.io/det1/7.png	Pokémon	80	Common
basep-20	Psyduck	https://images.pokemontcg.io/basep/20_hires.png	https://images.pokemontcg.io/basep/20.png	Pokémon	50	Promo
sm11-35	Slowpoke & Psyduck-GX	https://images.pokemontcg.io/sm11/35_hires.png	https://images.pokemontcg.io/sm11/35.png	Pokémon	250	Rare Holo GX
base3-53	Psyduck	https://images.pokemontcg.io/base3/53_hires.png	https://images.pokemontcg.io/base3/53.png	Pokémon	50	Common
base5-65	Psyduck	https://images.pokemontcg.io/base5/65_hires.png	https://images.pokemontcg.io/base5/65.png	Pokémon	50	Common
neo4-79	Psyduck	https://images.pokemontcg.io/neo4/79_hires.png	https://images.pokemontcg.io/neo4/79.png	Pokémon	50	Common
ecard2-104	Psyduck	https://images.pokemontcg.io/ecard2/104_hires.png	https://images.pokemontcg.io/ecard2/104.png	Pokémon	50	Common
swsh10-28	Psyduck	https://images.pokemontcg.io/swsh10/28_hires.png	https://images.pokemontcg.io/swsh10/28.png	Pokémon	60	Common
basep-4	Pikachu	https://images.pokemontcg.io/basep/4_hires.png	https://images.pokemontcg.io/basep/4.png	Pokémon	50	Promo
hgss3-35	Sableye	https://images.pokemontcg.io/hgss3/35_hires.png	https://images.pokemontcg.io/hgss3/35.png	Pokémon	60	Uncommon
ex16-22	Sableye	https://images.pokemontcg.io/ex16/22_hires.png	https://images.pokemontcg.io/ex16/22.png	Pokémon	60	Rare
base3-48	Grimer	https://images.pokemontcg.io/base3/48_hires.png	https://images.pokemontcg.io/base3/48.png	Pokémon	50	Common
hgss3-50	Grimer	https://images.pokemontcg.io/hgss3/50_hires.png	https://images.pokemontcg.io/hgss3/50.png	Pokémon	60	Common
sm12-23	Ponyta	https://images.pokemontcg.io/sm12/23_hires.png	https://images.pokemontcg.io/sm12/23.png	Pokémon	70	Common
gym2-64	Blaine's Ponyta	https://images.pokemontcg.io/gym2/64_hires.png	https://images.pokemontcg.io/gym2/64.png	Pokémon	50	Common
ex11-78	Ponyta	https://images.pokemontcg.io/ex11/78_hires.png	https://images.pokemontcg.io/ex11/78.png	Pokémon	50	Common
swsh10-21	Ponyta	https://images.pokemontcg.io/swsh10/21_hires.png	https://images.pokemontcg.io/swsh10/21.png	Pokémon	60	Common
dp1-92	Onix	https://images.pokemontcg.io/dp1/92_hires.png	https://images.pokemontcg.io/dp1/92.png	Pokémon	90	Common
base6-84	Onix	https://images.pokemontcg.io/base6/84_hires.png	https://images.pokemontcg.io/base6/84.png	Pokémon	90	Common
sm8-109	Onix	https://images.pokemontcg.io/sm8/109_hires.png	https://images.pokemontcg.io/sm8/109.png	Pokémon	120	Common
pgo-36	Onix	https://images.pokemontcg.io/pgo/36_hires.png	https://images.pokemontcg.io/pgo/36.png	Pokémon	120	Common
sm115-33	Geodude	https://images.pokemontcg.io/sm115/33_hires.png	https://images.pokemontcg.io/sm115/33.png	Pokémon	70	Common
sm9-34	Alolan Geodude	https://images.pokemontcg.io/sm9/34_hires.png	https://images.pokemontcg.io/sm9/34.png	Pokémon	60	Common
xy2-45	Geodude	https://images.pokemontcg.io/xy2/45_hires.png	https://images.pokemontcg.io/xy2/45.png	Pokémon	60	Common
sm9-35	Alolan Geodude	https://images.pokemontcg.io/sm9/35_hires.png	https://images.pokemontcg.io/sm9/35.png	Pokémon	70	Common
ecard1-110	Geodude	https://images.pokemontcg.io/ecard1/110_hires.png	https://images.pokemontcg.io/ecard1/110.png	Pokémon	50	Common
neo3-4	Crobat	https://images.pokemontcg.io/neo3/4_hires.png	https://images.pokemontcg.io/neo3/4.png	Pokémon	90	Rare Holo
ecard3-H5	Crobat	https://images.pokemontcg.io/ecard3/H5_hires.png	https://images.pokemontcg.io/ecard3/H5.png	Pokémon	90	Rare Holo
dp2-23	Crobat	https://images.pokemontcg.io/dp2/23_hires.png	https://images.pokemontcg.io/dp2/23.png	Pokémon	100	Rare
bw8-55	Crobat	https://images.pokemontcg.io/bw8/55_hires.png	https://images.pokemontcg.io/bw8/55.png	Pokémon	130	Rare Holo
ex5-3	Crobat	https://images.pokemontcg.io/ex5/3_hires.png	https://images.pokemontcg.io/ex5/3.png	Pokémon	90	Rare Holo
bw11-20	Vulpix	https://images.pokemontcg.io/bw11/20_hires.png	https://images.pokemontcg.io/bw11/20.png	Pokémon	60	Common
mcd16-1	Vulpix	https://images.pokemontcg.io/mcd16/1_hires.png	https://images.pokemontcg.io/mcd16/1.png	Pokémon	60	\N
sm9-15	Vulpix	https://images.pokemontcg.io/sm9/15_hires.png	https://images.pokemontcg.io/sm9/15.png	Pokémon	60	Common
swsh2-24	Vulpix	https://images.pokemontcg.io/swsh2/24_hires.png	https://images.pokemontcg.io/swsh2/24.png	Pokémon	60	Common
xy3-10	Magmar	https://images.pokemontcg.io/xy3/10_hires.png	https://images.pokemontcg.io/xy3/10.png	Pokémon	80	Common
xy12-20	Magmar	https://images.pokemontcg.io/xy12/20_hires.png	https://images.pokemontcg.io/xy12/20.png	Pokémon	80	Uncommon
base1-36	Magmar	https://images.pokemontcg.io/base1/36_hires.png	https://images.pokemontcg.io/base1/36.png	Pokémon	50	Uncommon
sm11-21	Magmar	https://images.pokemontcg.io/sm11/21_hires.png	https://images.pokemontcg.io/sm11/21.png	Pokémon	80	Common
gym1-37	Blaine's Magmar	https://images.pokemontcg.io/gym1/37_hires.png	https://images.pokemontcg.io/gym1/37.png	Pokémon	60	Uncommon
bw7-29	Squirtle	https://images.pokemontcg.io/bw7/29_hires.png	https://images.pokemontcg.io/bw7/29.png	Pokémon	60	Common
sm10-33	Squirtle	https://images.pokemontcg.io/sm10/33_hires.png	https://images.pokemontcg.io/sm10/33.png	Pokémon	60	Common
base1-63	Squirtle	https://images.pokemontcg.io/base1/63_hires.png	https://images.pokemontcg.io/base1/63.png	Pokémon	40	Common
hgss2-63	Squirtle	https://images.pokemontcg.io/hgss2/63_hires.png	https://images.pokemontcg.io/hgss2/63.png	Pokémon	60	Common
ecard2-H2	Arcanine	https://images.pokemontcg.io/ecard2/H2_hires.png	https://images.pokemontcg.io/ecard2/H2.png	Pokémon	90	Rare Holo
pl2-1	Arcanine	https://images.pokemontcg.io/pl2/1_hires.png	https://images.pokemontcg.io/pl2/1.png	Pokémon	100	Rare Holo
basep-6	Arcanine	https://images.pokemontcg.io/basep/6_hires.png	https://images.pokemontcg.io/basep/6.png	Pokémon	70	Promo
neo4-12	Light Arcanine	https://images.pokemontcg.io/neo4/12_hires.png	https://images.pokemontcg.io/neo4/12.png	Pokémon	100	Rare Holo
ecard3-H2	Arcanine	https://images.pokemontcg.io/ecard3/H2_hires.png	https://images.pokemontcg.io/ecard3/H2.png	Pokémon	80	Rare Holo
bw4-12	Arcanine	https://images.pokemontcg.io/bw4/12_hires.png	https://images.pokemontcg.io/bw4/12.png	Pokémon	130	Rare
pl3-15	Arcanine G	https://images.pokemontcg.io/pl3/15_hires.png	https://images.pokemontcg.io/pl3/15.png	Pokémon	90	Rare
dp3-22	Arcanine	https://images.pokemontcg.io/dp3/22_hires.png	https://images.pokemontcg.io/dp3/22.png	Pokémon	100	Rare
dp5-32	Umbreon	https://images.pokemontcg.io/dp5/32_hires.png	https://images.pokemontcg.io/dp5/32.png	Pokémon	80	Rare
ex2-24	Umbreon	https://images.pokemontcg.io/ex2/24_hires.png	https://images.pokemontcg.io/ex2/24.png	Pokémon	80	Rare
neo2-32	Umbreon	https://images.pokemontcg.io/neo2/32_hires.png	https://images.pokemontcg.io/neo2/32.png	Pokémon	70	Rare
xy10-55	Umbreon-EX	https://images.pokemontcg.io/xy10/55_hires.png	https://images.pokemontcg.io/xy10/55.png	Pokémon	170	Rare Holo EX
bw9-64	Umbreon	https://images.pokemontcg.io/bw9/64_hires.png	https://images.pokemontcg.io/bw9/64.png	Pokémon	100	Rare Holo
col1-22	Umbreon	https://images.pokemontcg.io/col1/22_hires.png	https://images.pokemontcg.io/col1/22.png	Pokémon	90	Rare Holo
bw5-60	Umbreon	https://images.pokemontcg.io/bw5/60_hires.png	https://images.pokemontcg.io/bw5/60.png	Pokémon	100	Uncommon
ecard2-41	Umbreon	https://images.pokemontcg.io/ecard2/41_hires.png	https://images.pokemontcg.io/ecard2/41.png	Pokémon	80	Rare
sma-SV69	Umbreon-GX	https://images.pokemontcg.io/sma/SV69_hires.png	https://images.pokemontcg.io/sma/SV69.png	Pokémon	200	Rare Shiny GX
hgss3-86	Umbreon	https://images.pokemontcg.io/hgss3/86_hires.png	https://images.pokemontcg.io/hgss3/86.png	Pokémon	100	Rare Prime
smp-SM36	Umbreon-GX	https://images.pokemontcg.io/smp/SM36_hires.png	https://images.pokemontcg.io/smp/SM36.png	Pokémon	200	Promo
dp1-3	Electivire	https://images.pokemontcg.io/dp1/3_hires.png	https://images.pokemontcg.io/dp1/3.png	Pokémon	100	Rare Holo
pl3-4	Electivire FB	https://images.pokemontcg.io/pl3/4_hires.png	https://images.pokemontcg.io/pl3/4.png	Pokémon	90	Rare Holo
xy3-30	Electivire	https://images.pokemontcg.io/xy3/30_hires.png	https://images.pokemontcg.io/xy3/30.png	Pokémon	120	Rare
xy9-43	Electivire	https://images.pokemontcg.io/xy9/43_hires.png	https://images.pokemontcg.io/xy9/43.png	Pokémon	110	Uncommon
sm5-44	Electivire	https://images.pokemontcg.io/sm5/44_hires.png	https://images.pokemontcg.io/sm5/44.png	Pokémon	140	Rare
sm8-72	Electivire	https://images.pokemontcg.io/sm8/72_hires.png	https://images.pokemontcg.io/sm8/72.png	Pokémon	140	Rare
neo4-11	Dark Tyranitar	https://images.pokemontcg.io/neo4/11_hires.png	https://images.pokemontcg.io/neo4/11.png	Pokémon	90	Rare Holo
ex11-16	Tyranitar δ	https://images.pokemontcg.io/ex11/16_hires.png	https://images.pokemontcg.io/ex11/16.png	Pokémon	120	Rare Holo
pop1-17	Tyranitar ex	https://images.pokemontcg.io/pop1/17_hires.png	https://images.pokemontcg.io/pop1/17.png	Pokémon	150	Rare
ex7-20	Dark Tyranitar	https://images.pokemontcg.io/ex7/20_hires.png	https://images.pokemontcg.io/ex7/20.png	Pokémon	120	Rare
ecard2-H28	Tyranitar	https://images.pokemontcg.io/ecard2/H28_hires.png	https://images.pokemontcg.io/ecard2/H28.png	Pokémon	120	Rare Holo
hgss2-26	Tyranitar	https://images.pokemontcg.io/hgss2/26_hires.png	https://images.pokemontcg.io/hgss2/26.png	Pokémon	140	Rare
dp7-30	Tyranitar	https://images.pokemontcg.io/dp7/30_hires.png	https://images.pokemontcg.io/dp7/30.png	Pokémon	140	Rare
dp2-17	Tyranitar	https://images.pokemontcg.io/dp2/17_hires.png	https://images.pokemontcg.io/dp2/17.png	Pokémon	140	Rare Holo
neo2-31	Tyranitar	https://images.pokemontcg.io/neo2/31_hires.png	https://images.pokemontcg.io/neo2/31.png	Pokémon	100	Rare
ecard1-66	Tyranitar	https://images.pokemontcg.io/ecard1/66_hires.png	https://images.pokemontcg.io/ecard1/66.png	Pokémon	120	Rare
xy7-42	Tyranitar-EX	https://images.pokemontcg.io/xy7/42_hires.png	https://images.pokemontcg.io/xy7/42.png	Pokémon	180	Rare Holo EX
swsh45sv-SV055	Hattrem	https://images.pokemontcg.io/swsh45sv/SV055_hires.png	https://images.pokemontcg.io/swsh45sv/SV055.png	Pokémon	80	Rare Shiny
swsh2-84	Hattrem	https://images.pokemontcg.io/swsh2/84_hires.png	https://images.pokemontcg.io/swsh2/84.png	Pokémon	80	Uncommon
swsh6-72	Hattrem	https://images.pokemontcg.io/swsh6/72_hires.png	https://images.pokemontcg.io/swsh6/72.png	Pokémon	80	Uncommon
swsh35-19	Hattrem	https://images.pokemontcg.io/swsh35/19_hires.png	https://images.pokemontcg.io/swsh35/19.png	Pokémon	90	Uncommon
swsh7-124	Regidrago	https://images.pokemontcg.io/swsh7/124_hires.png	https://images.pokemontcg.io/swsh7/124.png	Pokémon	130	Rare Holo
swsh10-118	Regidrago	https://images.pokemontcg.io/swsh10/118_hires.png	https://images.pokemontcg.io/swsh10/118.png	Pokémon	130	Rare
swsh12-136	Regidrago VSTAR	https://images.pokemontcg.io/swsh12/136_hires.png	https://images.pokemontcg.io/swsh12/136.png	Pokémon	280	Rare Holo VSTAR
swsh12-183	Regidrago V	https://images.pokemontcg.io/swsh12/183_hires.png	https://images.pokemontcg.io/swsh12/183.png	Pokémon	220	Rare Ultra
swsh12-201	Regidrago VSTAR	https://images.pokemontcg.io/swsh12/201_hires.png	https://images.pokemontcg.io/swsh12/201.png	Pokémon	280	Rare Rainbow
swshp-SWSH281	Regidrago V	https://images.pokemontcg.io/swshp/SWSH281_hires.png	https://images.pokemontcg.io/swshp/SWSH281.png	Pokémon	220	Promo
ex14-45	Bulbasaur	https://images.pokemontcg.io/ex14/45_hires.png	https://images.pokemontcg.io/ex14/45.png	Pokémon	50	Common
ex14-46	Bulbasaur	https://images.pokemontcg.io/ex14/46_hires.png	https://images.pokemontcg.io/ex14/46.png	Pokémon	50	Common
ex4-39	Bulbasaur	https://images.pokemontcg.io/ex4/39_hires.png	https://images.pokemontcg.io/ex4/39.png	Pokémon	50	Common
ex6-55	Bulbasaur	https://images.pokemontcg.io/ex6/55_hires.png	https://images.pokemontcg.io/ex6/55.png	Pokémon	50	Common
ex6-54	Bulbasaur	https://images.pokemontcg.io/ex6/54_hires.png	https://images.pokemontcg.io/ex6/54.png	Pokémon	50	Common
base6-68	Bulbasaur	https://images.pokemontcg.io/base6/68_hires.png	https://images.pokemontcg.io/base6/68.png	Pokémon	40	Common
ecard1-94	Bulbasaur	https://images.pokemontcg.io/ecard1/94_hires.png	https://images.pokemontcg.io/ecard1/94.png	Pokémon	50	Common
base1-44	Bulbasaur	https://images.pokemontcg.io/base1/44_hires.png	https://images.pokemontcg.io/base1/44.png	Pokémon	40	Common
base4-67	Bulbasaur	https://images.pokemontcg.io/base4/67_hires.png	https://images.pokemontcg.io/base4/67.png	Pokémon	40	Common
sm7-8	Treecko	https://images.pokemontcg.io/sm7/8_hires.png	https://images.pokemontcg.io/sm7/8.png	Pokémon	70	Common
xy5-6	Treecko	https://images.pokemontcg.io/xy5/6_hires.png	https://images.pokemontcg.io/xy5/6.png	Pokémon	60	Common
np-3	Treecko	https://images.pokemontcg.io/np/3_hires.png	https://images.pokemontcg.io/np/3.png	Pokémon	40	Promo
np-16	Treecko	https://images.pokemontcg.io/np/16_hires.png	https://images.pokemontcg.io/np/16.png	Pokémon	40	Promo
ex9-70	Treecko	https://images.pokemontcg.io/ex9/70_hires.png	https://images.pokemontcg.io/ex9/70.png	Pokémon	50	Common
pop4-15	Treecko δ	https://images.pokemontcg.io/pop4/15_hires.png	https://images.pokemontcg.io/pop4/15.png	Pokémon	40	Common
bw10-14	Squirtle	https://images.pokemontcg.io/bw10/14_hires.png	https://images.pokemontcg.io/bw10/14.png	Pokémon	50	Common
pop4-14	Squirtle	https://images.pokemontcg.io/pop4/14_hires.png	https://images.pokemontcg.io/pop4/14.png	Pokémon	50	Common
sm9-23	Squirtle	https://images.pokemontcg.io/sm9/23_hires.png	https://images.pokemontcg.io/sm9/23.png	Pokémon	70	Common
ex14-63	Squirtle	https://images.pokemontcg.io/ex14/63_hires.png	https://images.pokemontcg.io/ex14/63.png	Pokémon	50	Common
bw8-24	Squirtle	https://images.pokemontcg.io/bw8/24_hires.png	https://images.pokemontcg.io/bw8/24.png	Pokémon	60	Common
ex14-64	Squirtle	https://images.pokemontcg.io/ex14/64_hires.png	https://images.pokemontcg.io/ex14/64.png	Pokémon	40	Common
pl1-96	Squirtle	https://images.pokemontcg.io/pl1/96_hires.png	https://images.pokemontcg.io/pl1/96.png	Pokémon	60	Common
bw9-11	Leafeon	https://images.pokemontcg.io/bw9/11_hires.png	https://images.pokemontcg.io/bw9/11.png	Pokémon	100	Rare
col1-13	Leafeon	https://images.pokemontcg.io/col1/13_hires.png	https://images.pokemontcg.io/col1/13.png	Pokémon	90	Rare Holo
xy3-7	Leafeon	https://images.pokemontcg.io/xy3/7_hires.png	https://images.pokemontcg.io/xy3/7.png	Pokémon	90	Rare
dp5-7	Leafeon	https://images.pokemontcg.io/dp5/7_hires.png	https://images.pokemontcg.io/dp5/7.png	Pokémon	90	Rare Holo
dp5-24	Leafeon	https://images.pokemontcg.io/dp5/24_hires.png	https://images.pokemontcg.io/dp5/24.png	Pokémon	90	Rare
hgss3-17	Leafeon	https://images.pokemontcg.io/hgss3/17_hires.png	https://images.pokemontcg.io/hgss3/17.png	Pokémon	90	Rare
bwp-BW87	Leafeon	https://images.pokemontcg.io/bwp/BW87_hires.png	https://images.pokemontcg.io/bwp/BW87.png	Pokémon	90	Promo
swsh7-8	Leafeon VMAX	https://images.pokemontcg.io/swsh7/8_hires.png	https://images.pokemontcg.io/swsh7/8.png	Pokémon	310	Rare Holo VMAX
sm5-157	Leafeon-GX	https://images.pokemontcg.io/sm5/157_hires.png	https://images.pokemontcg.io/sm5/157.png	Pokémon	200	Rare Rainbow
smp-SM237	Leafeon	https://images.pokemontcg.io/smp/SM237_hires.png	https://images.pokemontcg.io/smp/SM237.png	Pokémon	110	Promo
swsh10-13	Leafeon	https://images.pokemontcg.io/swsh10/13_hires.png	https://images.pokemontcg.io/swsh10/13.png	Pokémon	110	Rare
ecard1-42	Cloyster	https://images.pokemontcg.io/ecard1/42_hires.png	https://images.pokemontcg.io/ecard1/42.png	Pokémon	80	Rare
swsh1-41	Cloyster	https://images.pokemontcg.io/swsh1/41_hires.png	https://images.pokemontcg.io/swsh1/41.png	Pokémon	130	Rare
g1-20	Cloyster	https://images.pokemontcg.io/g1/20_hires.png	https://images.pokemontcg.io/g1/20.png	Pokémon	100	Uncommon
ecard1-8	Cloyster	https://images.pokemontcg.io/ecard1/8_hires.png	https://images.pokemontcg.io/ecard1/8.png	Pokémon	80	Rare Holo
ex15-14	Cloyster δ	https://images.pokemontcg.io/ex15/14_hires.png	https://images.pokemontcg.io/ex15/14.png	Pokémon	70	Rare
swsh8-218	Greedent VMAX	https://images.pokemontcg.io/swsh8/218_hires.png	https://images.pokemontcg.io/swsh8/218.png	Pokémon	320	Rare Holo VMAX
swsh8-256	Greedent V	https://images.pokemontcg.io/swsh8/256_hires.png	https://images.pokemontcg.io/swsh8/256.png	Pokémon	210	Rare Ultra
swsh8-217	Greedent V	https://images.pokemontcg.io/swsh8/217_hires.png	https://images.pokemontcg.io/swsh8/217.png	Pokémon	210	Rare Holo V
swsh8-257	Greedent V	https://images.pokemontcg.io/swsh8/257_hires.png	https://images.pokemontcg.io/swsh8/257.png	Pokémon	210	Rare Ultra
swsh11-151	Greedent	https://images.pokemontcg.io/swsh11/151_hires.png	https://images.pokemontcg.io/swsh11/151.png	Pokémon	130	Rare
swsh3-153	Greedent	https://images.pokemontcg.io/swsh3/153_hires.png	https://images.pokemontcg.io/swsh3/153.png	Pokémon	120	Rare
sm2-24	Tentacruel	https://images.pokemontcg.io/sm2/24_hires.png	https://images.pokemontcg.io/sm2/24.png	Pokémon	110	Uncommon
hgss4-50	Tentacruel	https://images.pokemontcg.io/hgss4/50_hires.png	https://images.pokemontcg.io/hgss4/50.png	Pokémon	90	Uncommon
ex5-51	Tentacruel	https://images.pokemontcg.io/ex5/51_hires.png	https://images.pokemontcg.io/ex5/51.png	Pokémon	70	Uncommon
sm10-41	Tentacruel	https://images.pokemontcg.io/sm10/41_hires.png	https://images.pokemontcg.io/sm10/41.png	Pokémon	100	Uncommon
ecard2-38	Tentacruel	https://images.pokemontcg.io/ecard2/38_hires.png	https://images.pokemontcg.io/ecard2/38.png	Pokémon	70	Rare
dp6-75	Tentacruel	https://images.pokemontcg.io/dp6/75_hires.png	https://images.pokemontcg.io/dp6/75.png	Pokémon	90	Uncommon
xy5-71	Tentacool	https://images.pokemontcg.io/xy5/71_hires.png	https://images.pokemontcg.io/xy5/71.png	Pokémon	60	Uncommon
hgss4-80	Tentacool	https://images.pokemontcg.io/hgss4/80_hires.png	https://images.pokemontcg.io/hgss4/80.png	Pokémon	60	Common
base6-96	Tentacool	https://images.pokemontcg.io/base6/96_hires.png	https://images.pokemontcg.io/base6/96.png	Pokémon	30	Common
bw6-12	Roselia	https://images.pokemontcg.io/bw6/12_hires.png	https://images.pokemontcg.io/bw6/12.png	Pokémon	70	Uncommon
bw6-13	Roselia	https://images.pokemontcg.io/bw6/13_hires.png	https://images.pokemontcg.io/bw6/13.png	Pokémon	70	Common
xy2-8	Roselia	https://images.pokemontcg.io/xy2/8_hires.png	https://images.pokemontcg.io/xy2/8.png	Pokémon	60	Common
swsh11-14	Roselia	https://images.pokemontcg.io/swsh11/14_hires.png	https://images.pokemontcg.io/swsh11/14.png	Pokémon	70	Common
dp7-72	Roselia	https://images.pokemontcg.io/dp7/72_hires.png	https://images.pokemontcg.io/dp7/72.png	Pokémon	70	Common
ex8-1	Altaria	https://images.pokemontcg.io/ex8/1_hires.png	https://images.pokemontcg.io/ex8/1.png	Pokémon	70	Rare Holo
dp4-12	Altaria	https://images.pokemontcg.io/dp4/12_hires.png	https://images.pokemontcg.io/dp4/12.png	Pokémon	80	Rare
swsh35-49	Altaria	https://images.pokemontcg.io/swsh35/49_hires.png	https://images.pokemontcg.io/swsh35/49.png	Pokémon	110	Rare Holo
sm75-40	Altaria	https://images.pokemontcg.io/sm75/40_hires.png	https://images.pokemontcg.io/sm75/40.png	Pokémon	80	Rare Holo
sm75-41	Altaria-GX	https://images.pokemontcg.io/sm75/41_hires.png	https://images.pokemontcg.io/sm75/41.png	Pokémon	200	Rare Holo GX
xyp-XY46	Altaria	https://images.pokemontcg.io/xyp/XY46_hires.png	https://images.pokemontcg.io/xyp/XY46.png	Pokémon	90	Promo
xy10-69	M Altaria-EX	https://images.pokemontcg.io/xy10/69_hires.png	https://images.pokemontcg.io/xy10/69.png	Pokémon	220	Rare Holo EX
sm75-72	Altaria-GX	https://images.pokemontcg.io/sm75/72_hires.png	https://images.pokemontcg.io/sm75/72.png	Pokémon	200	Rare Rainbow
sma-SV77	Altaria-GX	https://images.pokemontcg.io/sma/SV77_hires.png	https://images.pokemontcg.io/sma/SV77.png	Pokémon	200	Rare Shiny GX
bw11-92	Altaria	https://images.pokemontcg.io/bw11/92_hires.png	https://images.pokemontcg.io/bw11/92.png	Pokémon	80	Uncommon
swshp-SWSH007	Frosmoth	https://images.pokemontcg.io/swshp/SWSH007_hires.png	https://images.pokemontcg.io/swshp/SWSH007.png	Pokémon	90	Promo
swsh1-64	Frosmoth	https://images.pokemontcg.io/swsh1/64_hires.png	https://images.pokemontcg.io/swsh1/64.png	Pokémon	90	Rare Holo
swsh45-30	Frosmoth	https://images.pokemontcg.io/swsh45/30_hires.png	https://images.pokemontcg.io/swsh45/30.png	Pokémon	90	Rare Holo
swsh8-85	Frosmoth	https://images.pokemontcg.io/swsh8/85_hires.png	https://images.pokemontcg.io/swsh8/85.png	Pokémon	90	Uncommon
swsh10tg-TG04	Frosmoth	https://images.pokemontcg.io/swsh10tg/TG04_hires.png	https://images.pokemontcg.io/swsh10tg/TG04.png	Pokémon	90	Rare Holo
swsh2-204	Frosmoth	https://images.pokemontcg.io/swsh2/204_hires.png	https://images.pokemontcg.io/swsh2/204.png	Pokémon	90	Rare Secret
bw2-31	Beartic	https://images.pokemontcg.io/bw2/31_hires.png	https://images.pokemontcg.io/bw2/31.png	Pokémon	130	Rare
bw8-41	Beartic	https://images.pokemontcg.io/bw8/41_hires.png	https://images.pokemontcg.io/bw8/41.png	Pokémon	130	Rare
xy3-22	Beartic	https://images.pokemontcg.io/xy3/22_hires.png	https://images.pokemontcg.io/xy3/22.png	Pokémon	130	Rare
sm8-62	Beartic	https://images.pokemontcg.io/sm8/62_hires.png	https://images.pokemontcg.io/sm8/62.png	Pokémon	140	Rare
swsh9-43	Beartic	https://images.pokemontcg.io/swsh9/43_hires.png	https://images.pokemontcg.io/swsh9/43.png	Pokémon	140	Uncommon
base3-17	Articuno	https://images.pokemontcg.io/base3/17_hires.png	https://images.pokemontcg.io/base3/17.png	Pokémon	70	Rare
pl3-16	Articuno	https://images.pokemontcg.io/pl3/16_hires.png	https://images.pokemontcg.io/pl3/16.png	Pokémon	100	Rare
xy6-17	Articuno	https://images.pokemontcg.io/xy6/17_hires.png	https://images.pokemontcg.io/xy6/17.png	Pokémon	120	Rare
bw11-32	Articuno	https://images.pokemontcg.io/bw11/32_hires.png	https://images.pokemontcg.io/bw11/32.png	Pokémon	120	Rare Holo
dp5-1	Articuno	https://images.pokemontcg.io/dp5/1_hires.png	https://images.pokemontcg.io/dp5/1.png	Pokémon	100	Rare Holo
basep-22	Articuno	https://images.pokemontcg.io/basep/22_hires.png	https://images.pokemontcg.io/basep/22.png	Pokémon	70	Promo
xy7-61	Meowth	https://images.pokemontcg.io/xy7/61_hires.png	https://images.pokemontcg.io/xy7/61.png	Pokémon	60	Common
base2-56	Meowth	https://images.pokemontcg.io/base2/56_hires.png	https://images.pokemontcg.io/base2/56.png	Pokémon	50	Common
g1-53	Meowth	https://images.pokemontcg.io/g1/53_hires.png	https://images.pokemontcg.io/g1/53.png	Pokémon	60	Common
gym2-74	Giovanni's Meowth	https://images.pokemontcg.io/gym2/74_hires.png	https://images.pokemontcg.io/gym2/74.png	Pokémon	50	Common
ex6-69	Meowth	https://images.pokemontcg.io/ex6/69_hires.png	https://images.pokemontcg.io/ex6/69.png	Pokémon	50	Common
xy6-67	Meowth	https://images.pokemontcg.io/xy6/67_hires.png	https://images.pokemontcg.io/xy6/67.png	Pokémon	60	Common
ex12-28	Wobbuffet	https://images.pokemontcg.io/ex12/28_hires.png	https://images.pokemontcg.io/ex12/28.png	Pokémon	80	Rare
ex16-24	Wobbuffet	https://images.pokemontcg.io/ex16/24_hires.png	https://images.pokemontcg.io/ex16/24.png	Pokémon	80	Rare
neo2-16	Wobbuffet	https://images.pokemontcg.io/neo2/16_hires.png	https://images.pokemontcg.io/neo2/16.png	Pokémon	90	Rare Holo
ex7-47	Rocket's Wobbuffet	https://images.pokemontcg.io/ex7/47_hires.png	https://images.pokemontcg.io/ex7/47.png	Pokémon	70	Uncommon
xy4-36	Wobbuffet	https://images.pokemontcg.io/xy4/36_hires.png	https://images.pokemontcg.io/xy4/36.png	Pokémon	110	Uncommon
pop4-16	Wobbuffet	https://images.pokemontcg.io/pop4/16_hires.png	https://images.pokemontcg.io/pop4/16.png	Pokémon	80	Common
sm3-49	Wobbuffet	https://images.pokemontcg.io/sm3/49_hires.png	https://images.pokemontcg.io/sm3/49.png	Pokémon	120	Uncommon
xy8-67	Wobbuffet	https://images.pokemontcg.io/xy8/67_hires.png	https://images.pokemontcg.io/xy8/67.png	Pokémon	100	Uncommon
ex13-56	Wobbuffet	https://images.pokemontcg.io/ex13/56_hires.png	https://images.pokemontcg.io/ex13/56.png	Pokémon	70	Uncommon
sm8-93	Wobbuffet	https://images.pokemontcg.io/sm8/93_hires.png	https://images.pokemontcg.io/sm8/93.png	Pokémon	110	Rare
xyp-XY155	Wobbuffet BREAK	https://images.pokemontcg.io/xyp/XY155_hires.png	https://images.pokemontcg.io/xyp/XY155.png	Pokémon	140	Promo
swsh1-191	Wobbuffet V	https://images.pokemontcg.io/swsh1/191_hires.png	https://images.pokemontcg.io/swsh1/191.png	Pokémon	220	Rare Ultra
xy12-50	Koffing	https://images.pokemontcg.io/xy12/50_hires.png	https://images.pokemontcg.io/xy12/50.png	Pokémon	60	Uncommon
col1-60	Koffing	https://images.pokemontcg.io/col1/60_hires.png	https://images.pokemontcg.io/col1/60.png	Pokémon	50	Common
bw8-57	Koffing	https://images.pokemontcg.io/bw8/57_hires.png	https://images.pokemontcg.io/bw8/57.png	Pokémon	60	Uncommon
hgss1-70	Koffing	https://images.pokemontcg.io/hgss1/70_hires.png	https://images.pokemontcg.io/hgss1/70.png	Pokémon	50	Common
ex7-61	Koffing	https://images.pokemontcg.io/ex7/61_hires.png	https://images.pokemontcg.io/ex7/61.png	Pokémon	50	Common
ex11-72	Koffing	https://images.pokemontcg.io/ex11/72_hires.png	https://images.pokemontcg.io/ex11/72.png	Pokémon	50	Common
bw8-56	Koffing	https://images.pokemontcg.io/bw8/56_hires.png	https://images.pokemontcg.io/bw8/56.png	Pokémon	70	Common
ex1-54	Koffing	https://images.pokemontcg.io/ex1/54_hires.png	https://images.pokemontcg.io/ex1/54.png	Pokémon	50	Common
base5-56	Ekans	https://images.pokemontcg.io/base5/56_hires.png	https://images.pokemontcg.io/base5/56.png	Pokémon	50	Common
sm10-62	Ekans	https://images.pokemontcg.io/sm10/62_hires.png	https://images.pokemontcg.io/sm10/62.png	Pokémon	70	Common
dp4-66	Ekans	https://images.pokemontcg.io/dp4/66_hires.png	https://images.pokemontcg.io/dp4/66.png	Pokémon	60	Common
swsh35-33	Ekans	https://images.pokemontcg.io/swsh35/33_hires.png	https://images.pokemontcg.io/swsh35/33.png	Pokémon	70	Common
sm7-3	Victreebel	https://images.pokemontcg.io/sm7/3_hires.png	https://images.pokemontcg.io/sm7/3.png	Pokémon	140	Rare Holo
hgss4-12	Victreebel	https://images.pokemontcg.io/hgss4/12_hires.png	https://images.pokemontcg.io/hgss4/12.png	Pokémon	110	Rare Holo
xy3-3	Victreebel	https://images.pokemontcg.io/xy3/3_hires.png	https://images.pokemontcg.io/xy3/3.png	Pokémon	130	Rare Holo
base2-14	Victreebel	https://images.pokemontcg.io/base2/14_hires.png	https://images.pokemontcg.io/base2/14.png	Pokémon	80	Rare Holo
base4-32	Victreebel	https://images.pokemontcg.io/base4/32_hires.png	https://images.pokemontcg.io/base4/32.png	Pokémon	80	Rare
ecard2-42	Victreebel	https://images.pokemontcg.io/ecard2/42_hires.png	https://images.pokemontcg.io/ecard2/42.png	Pokémon	90	Rare
gym1-26	Erika's Victreebel	https://images.pokemontcg.io/gym1/26_hires.png	https://images.pokemontcg.io/gym1/26.png	Pokémon	80	Rare
base2-30	Victreebel	https://images.pokemontcg.io/base2/30_hires.png	https://images.pokemontcg.io/base2/30.png	Pokémon	80	Rare
hgss1-67	Hoppip	https://images.pokemontcg.io/hgss1/67_hires.png	https://images.pokemontcg.io/hgss1/67.png	Pokémon	30	Common
dp3-90	Hoppip	https://images.pokemontcg.io/dp3/90_hires.png	https://images.pokemontcg.io/dp3/90.png	Pokémon	30	Common
ecard2-83	Hoppip	https://images.pokemontcg.io/ecard2/83_hires.png	https://images.pokemontcg.io/ecard2/83.png	Pokémon	40	Common
neo1-61	Hoppip	https://images.pokemontcg.io/neo1/61_hires.png	https://images.pokemontcg.io/neo1/61.png	Pokémon	50	Common
swsh7-2	Hoppip	https://images.pokemontcg.io/swsh7/2_hires.png	https://images.pokemontcg.io/swsh7/2.png	Pokémon	40	Common
neo2-55	Hoppip	https://images.pokemontcg.io/neo2/55_hires.png	https://images.pokemontcg.io/neo2/55.png	Pokémon	30	Common
bw6-1	Hoppip	https://images.pokemontcg.io/bw6/1_hires.png	https://images.pokemontcg.io/bw6/1.png	Pokémon	30	Common
base4-44	Ivysaur	https://images.pokemontcg.io/base4/44_hires.png	https://images.pokemontcg.io/base4/44.png	Pokémon	60	Uncommon
pl3-62	Ivysaur	https://images.pokemontcg.io/pl3/62_hires.png	https://images.pokemontcg.io/pl3/62.png	Pokémon	80	Uncommon
ecard1-82	Ivysaur	https://images.pokemontcg.io/ecard1/82_hires.png	https://images.pokemontcg.io/ecard1/82.png	Pokémon	80	Uncommon
bp-6	Dark Ivysaur	https://images.pokemontcg.io/bp/6_hires.png	https://images.pokemontcg.io/bp/6.png	Pokémon	50	Promo
ex4-26	Team Aqua's Corphish	https://images.pokemontcg.io/ex4/26_hires.png	https://images.pokemontcg.io/ex4/26.png	Pokémon	50	Uncommon
sm4-24	Corphish	https://images.pokemontcg.io/sm4/24_hires.png	https://images.pokemontcg.io/sm4/24.png	Pokémon	70	Common
xy5-42	Corphish	https://images.pokemontcg.io/xy5/42_hires.png	https://images.pokemontcg.io/xy5/42.png	Pokémon	60	Common
swsh12pt5-33	Corphish	https://images.pokemontcg.io/swsh12pt5/33_hires.png	https://images.pokemontcg.io/swsh12pt5/33.png	Pokémon	70	Common
swsh9-32	Corphish	https://images.pokemontcg.io/swsh9/32_hires.png	https://images.pokemontcg.io/swsh9/32.png	Pokémon	70	Common
swsh5-38	Corphish	https://images.pokemontcg.io/swsh5/38_hires.png	https://images.pokemontcg.io/swsh5/38.png	Pokémon	70	Common
pl3-100	Corphish	https://images.pokemontcg.io/pl3/100_hires.png	https://images.pokemontcg.io/pl3/100.png	Pokémon	50	Common
dp6-89	Corphish	https://images.pokemontcg.io/dp6/89_hires.png	https://images.pokemontcg.io/dp6/89.png	Pokémon	50	Common
ex13-63	Corphish	https://images.pokemontcg.io/ex13/63_hires.png	https://images.pokemontcg.io/ex13/63.png	Pokémon	40	Common
ex13-62	Corphish	https://images.pokemontcg.io/ex13/62_hires.png	https://images.pokemontcg.io/ex13/62.png	Pokémon	50	Common
ex8-57	Corphish	https://images.pokemontcg.io/ex8/57_hires.png	https://images.pokemontcg.io/ex8/57.png	Pokémon	40	Common
ex3-54	Corphish	https://images.pokemontcg.io/ex3/54_hires.png	https://images.pokemontcg.io/ex3/54.png	Pokémon	50	Common
ex3-53	Corphish	https://images.pokemontcg.io/ex3/53_hires.png	https://images.pokemontcg.io/ex3/53.png	Pokémon	50	Common
ex3-52	Corphish	https://images.pokemontcg.io/ex3/52_hires.png	https://images.pokemontcg.io/ex3/52.png	Pokémon	40	Common
ex4-51	Team Aqua's Corphish	https://images.pokemontcg.io/ex4/51_hires.png	https://images.pokemontcg.io/ex4/51.png	Pokémon	50	Common
ex4-50	Team Aqua's Corphish	https://images.pokemontcg.io/ex4/50_hires.png	https://images.pokemontcg.io/ex4/50.png	Pokémon	40	Common
swsh45sv-SV103	Wooloo	https://images.pokemontcg.io/swsh45sv/SV103_hires.png	https://images.pokemontcg.io/swsh45sv/SV103.png	Pokémon	70	Rare Shiny
swshp-SWSH011	Wooloo	https://images.pokemontcg.io/swshp/SWSH011_hires.png	https://images.pokemontcg.io/swshp/SWSH011.png	Pokémon	60	Promo
swsh8-222	Wooloo	https://images.pokemontcg.io/swsh8/222_hires.png	https://images.pokemontcg.io/swsh8/222.png	Pokémon	70	Common
swsh1-152	Wooloo	https://images.pokemontcg.io/swsh1/152_hires.png	https://images.pokemontcg.io/swsh1/152.png	Pokémon	70	Common
np-5	Mudkip	https://images.pokemontcg.io/np/5_hires.png	https://images.pokemontcg.io/np/5.png	Pokémon	50	Promo
np-10	Mudkip	https://images.pokemontcg.io/np/10_hires.png	https://images.pokemontcg.io/np/10.png	Pokémon	50	Promo
xy5-33	Mudkip	https://images.pokemontcg.io/xy5/33_hires.png	https://images.pokemontcg.io/xy5/33.png	Pokémon	60	Common
xyp-XY38	Mudkip	https://images.pokemontcg.io/xyp/XY38_hires.png	https://images.pokemontcg.io/xyp/XY38.png	Pokémon	60	Promo
dpp-DP03	Piplup	https://images.pokemontcg.io/dpp/DP03_hires.png	https://images.pokemontcg.io/dpp/DP03.png	Pokémon	60	Promo
bw11-RC6	Piplup	https://images.pokemontcg.io/bw11/RC6_hires.png	https://images.pokemontcg.io/bw11/RC6.png	Pokémon	60	Uncommon
mcd21-20	Piplup	https://images.pokemontcg.io/mcd21/20_hires.png	https://images.pokemontcg.io/mcd21/20.png	Pokémon	70	\N
col1-53	Chikorita	https://images.pokemontcg.io/col1/53_hires.png	https://images.pokemontcg.io/col1/53.png	Pokémon	50	Common
g1-RC1	Chikorita	https://images.pokemontcg.io/g1/RC1_hires.png	https://images.pokemontcg.io/g1/RC1.png	Pokémon	50	Common
pl3-50	Arcanine	https://images.pokemontcg.io/pl3/50_hires.png	https://images.pokemontcg.io/pl3/50.png	Pokémon	80	Uncommon
xy12-18	Arcanine	https://images.pokemontcg.io/xy12/18_hires.png	https://images.pokemontcg.io/xy12/18.png	Pokémon	130	Rare
sm12-239	Piplup	https://images.pokemontcg.io/sm12/239_hires.png	https://images.pokemontcg.io/sm12/239.png	Pokémon	60	Rare Secret
bw5-27	Piplup	https://images.pokemontcg.io/bw5/27_hires.png	https://images.pokemontcg.io/bw5/27.png	Pokémon	60	Common
sm5-31	Piplup	https://images.pokemontcg.io/sm5/31_hires.png	https://images.pokemontcg.io/sm5/31.png	Pokémon	60	Common
pop9-16	Piplup	https://images.pokemontcg.io/pop9/16_hires.png	https://images.pokemontcg.io/pop9/16.png	Pokémon	50	Common
dp4-5	Pachirisu	https://images.pokemontcg.io/dp4/5_hires.png	https://images.pokemontcg.io/dp4/5.png	Pokémon	70	Rare Holo
swsh5-49	Pachirisu	https://images.pokemontcg.io/swsh5/49_hires.png	https://images.pokemontcg.io/swsh5/49.png	Pokémon	70	Common
swsh9-52	Pachirisu	https://images.pokemontcg.io/swsh9/52_hires.png	https://images.pokemontcg.io/swsh9/52.png	Pokémon	70	Uncommon
bw9-37	Pachirisu	https://images.pokemontcg.io/bw9/37_hires.png	https://images.pokemontcg.io/bw9/37.png	Pokémon	70	Common
dp5-53	Buneary	https://images.pokemontcg.io/dp5/53_hires.png	https://images.pokemontcg.io/dp5/53.png	Pokémon	50	Common
pop6-12	Buneary	https://images.pokemontcg.io/pop6/12_hires.png	https://images.pokemontcg.io/pop6/12.png	Pokémon	50	Common
dp6-86	Buneary	https://images.pokemontcg.io/dp6/86_hires.png	https://images.pokemontcg.io/dp6/86.png	Pokémon	50	Common
sm5-106	Buneary	https://images.pokemontcg.io/sm5/106_hires.png	https://images.pokemontcg.io/sm5/106.png	Pokémon	60	Common
swsh8-212	Buneary	https://images.pokemontcg.io/swsh8/212_hires.png	https://images.pokemontcg.io/swsh8/212.png	Pokémon	50	Common
swsh12-144	Buneary	https://images.pokemontcg.io/swsh12/144_hires.png	https://images.pokemontcg.io/swsh12/144.png	Pokémon	60	Common
sm35-38	Jynx	https://images.pokemontcg.io/sm35/38_hires.png	https://images.pokemontcg.io/sm35/38.png	Pokémon	90	Common
dp3-30	Jynx	https://images.pokemontcg.io/dp3/30_hires.png	https://images.pokemontcg.io/dp3/30.png	Pokémon	70	Rare
ex15-17	Jynx δ	https://images.pokemontcg.io/ex15/17_hires.png	https://images.pokemontcg.io/ex15/17.png	Pokémon	60	Rare
ex10-28	Jynx	https://images.pokemontcg.io/ex10/28_hires.png	https://images.pokemontcg.io/ex10/28.png	Pokémon	70	Rare
ecard2-18	Jynx	https://images.pokemontcg.io/ecard2/18_hires.png	https://images.pokemontcg.io/ecard2/18.png	Pokémon	60	Rare
base1-31	Jynx	https://images.pokemontcg.io/base1/31_hires.png	https://images.pokemontcg.io/base1/31.png	Pokémon	70	Uncommon
col1-29	Mr. Mime	https://images.pokemontcg.io/col1/29_hires.png	https://images.pokemontcg.io/col1/29.png	Pokémon	70	Rare
dp2-30	Mr. Mime	https://images.pokemontcg.io/dp2/30_hires.png	https://images.pokemontcg.io/dp2/30.png	Pokémon	70	Rare
base2-22	Mr. Mime	https://images.pokemontcg.io/base2/22_hires.png	https://images.pokemontcg.io/base2/22.png	Pokémon	40	Rare
sm115-43	Mr. Mime	https://images.pokemontcg.io/sm115/43_hires.png	https://images.pokemontcg.io/sm115/43.png	Pokémon	90	Rare
base4-27	Mr. Mime	https://images.pokemontcg.io/base4/27_hires.png	https://images.pokemontcg.io/base4/27.png	Pokémon	40	Rare
gym1-14	Sabrina's Gengar	https://images.pokemontcg.io/gym1/14_hires.png	https://images.pokemontcg.io/gym1/14.png	Pokémon	80	Rare Holo
pl4-16	Gengar	https://images.pokemontcg.io/pl4/16_hires.png	https://images.pokemontcg.io/pl4/16.png	Pokémon	110	Rare
ecard3-H9	Gengar	https://images.pokemontcg.io/ecard3/H9_hires.png	https://images.pokemontcg.io/ecard3/H9.png	Pokémon	100	Rare Holo
gym2-29	Sabrina's Gengar	https://images.pokemontcg.io/gym2/29_hires.png	https://images.pokemontcg.io/gym2/29.png	Pokémon	90	Rare
ecard1-13	Gengar	https://images.pokemontcg.io/ecard1/13_hires.png	https://images.pokemontcg.io/ecard1/13.png	Pokémon	90	Rare Holo
neo4-6	Dark Gengar	https://images.pokemontcg.io/neo4/6_hires.png	https://images.pokemontcg.io/neo4/6.png	Pokémon	70	Rare Holo
neo4-36	Dark Haunter	https://images.pokemontcg.io/neo4/36_hires.png	https://images.pokemontcg.io/neo4/36.png	Pokémon	50	Uncommon
pl4-42	Haunter	https://images.pokemontcg.io/pl4/42_hires.png	https://images.pokemontcg.io/pl4/42.png	Pokémon	80	Uncommon
ex6-34	Haunter	https://images.pokemontcg.io/ex6/34_hires.png	https://images.pokemontcg.io/ex6/34.png	Pokémon	70	Uncommon
dp7-40	Haunter	https://images.pokemontcg.io/dp7/40_hires.png	https://images.pokemontcg.io/dp7/40.png	Pokémon	80	Uncommon
sm4-37	Haunter	https://images.pokemontcg.io/sm4/37_hires.png	https://images.pokemontcg.io/sm4/37.png	Pokémon	70	Uncommon
base2-50	Cubone	https://images.pokemontcg.io/base2/50_hires.png	https://images.pokemontcg.io/base2/50.png	Pokémon	40	Common
hgss4-60	Cubone	https://images.pokemontcg.io/hgss4/60_hires.png	https://images.pokemontcg.io/hgss4/60.png	Pokémon	40	Common
bw6-60	Cubone	https://images.pokemontcg.io/bw6/60_hires.png	https://images.pokemontcg.io/bw6/60.png	Pokémon	70	Common
base4-70	Cubone	https://images.pokemontcg.io/base4/70_hires.png	https://images.pokemontcg.io/base4/70.png	Pokémon	40	Common
sm6-57	Cubone	https://images.pokemontcg.io/sm6/57_hires.png	https://images.pokemontcg.io/sm6/57.png	Pokémon	60	Common
sm4-52	Cubone	https://images.pokemontcg.io/sm4/52_hires.png	https://images.pokemontcg.io/sm4/52.png	Pokémon	70	Common
basep-1	Pikachu	https://images.pokemontcg.io/basep/1_hires.png	https://images.pokemontcg.io/basep/1.png	Pokémon	60	Promo
det1-10	Detective Pikachu	https://images.pokemontcg.io/det1/10_hires.png	https://images.pokemontcg.io/det1/10.png	Pokémon	90	Rare
ru1-7	Pikachu	https://images.pokemontcg.io/ru1/7_hires.png	https://images.pokemontcg.io/ru1/7.png	Pokémon	60	\N
hsp-HGSS03	Pikachu	https://images.pokemontcg.io/hsp/HGSS03_hires.png	https://images.pokemontcg.io/hsp/HGSS03.png	Pokémon	70	Promo
sm115-7	Charmander	https://images.pokemontcg.io/sm115/7_hires.png	https://images.pokemontcg.io/sm115/7.png	Pokémon	70	Common
sm9-12	Charmander	https://images.pokemontcg.io/sm9/12_hires.png	https://images.pokemontcg.io/sm9/12.png	Pokémon	70	Common
sma-SV6	Charmander	https://images.pokemontcg.io/sma/SV6_hires.png	https://images.pokemontcg.io/sma/SV6.png	Pokémon	70	Rare Shiny
sm9-11	Charmander	https://images.pokemontcg.io/sm9/11_hires.png	https://images.pokemontcg.io/sm9/11.png	Pokémon	50	Common
det1-4	Charmander	https://images.pokemontcg.io/det1/4_hires.png	https://images.pokemontcg.io/det1/4.png	Pokémon	60	Common
\.


--
-- TOC entry 2959 (class 0 OID 52064)
-- Dependencies: 221
-- Data for Name: card_set; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card_set (card_id, set_id) FROM stdin;
ex5-78	ex5
basep-30	basep
si1-4	si1
xy6-43	xy6
ex11-15	ex11
sm4-16	sm4
neo3-25	neo3
xy12-31	xy12
xy1-34	xy1
xy8-27	xy8
ex1-55	ex1
base2-53	base2
dp1-84	dp1
base4-76	base4
xy9-25	xy9
base1-65	base1
xy5-32	xy5
neo3-56	neo3
ex8-77	ex8
sm75-15	sm75
ex3-33	ex3
xy5-30	xy5
ex7-58	ex7
neo1-62	neo1
ecard2-84	ecard2
det1-7	det1
basep-20	basep
sm11-35	sm11
base3-53	base3
base5-65	base5
neo4-79	neo4
ecard2-104	ecard2
swsh10-28	swsh10
basep-4	basep
hgss3-35	hgss3
ex16-22	ex16
base3-48	base3
hgss3-50	hgss3
sm12-23	sm12
gym2-64	gym2
ex11-78	ex11
swsh10-21	swsh10
dp1-92	dp1
base6-84	base6
sm8-109	sm8
pgo-36	pgo
sm115-33	sm115
sm9-34	sm9
xy2-45	xy2
sm9-35	sm9
ecard1-110	ecard1
neo3-4	neo3
ecard3-H5	ecard3
dp2-23	dp2
bw8-55	bw8
ex5-3	ex5
bw11-20	bw11
mcd16-1	mcd16
sm9-15	sm9
swsh2-24	swsh2
xy3-10	xy3
xy12-20	xy12
base1-36	base1
sm11-21	sm11
gym1-37	gym1
bw7-29	bw7
sm10-33	sm10
base1-63	base1
hgss2-63	hgss2
ecard2-H2	ecard2
pl2-1	pl2
basep-6	basep
neo4-12	neo4
ecard3-H2	ecard3
bw4-12	bw4
pl3-15	pl3
dp3-22	dp3
dp5-32	dp5
ex2-24	ex2
neo2-32	neo2
xy10-55	xy10
bw9-64	bw9
col1-22	col1
bw5-60	bw5
ecard2-41	ecard2
sma-SV69	sma
hgss3-86	hgss3
smp-SM36	smp
dp1-3	dp1
pl3-4	pl3
xy3-30	xy3
xy9-43	xy9
sm5-44	sm5
sm8-72	sm8
neo4-11	neo4
ex11-16	ex11
pop1-17	pop1
ex7-20	ex7
ecard2-H28	ecard2
hgss2-26	hgss2
dp7-30	dp7
dp2-17	dp2
neo2-31	neo2
ecard1-66	ecard1
xy7-42	xy7
swsh45sv-SV055	swsh45sv
swsh2-84	swsh2
swsh6-72	swsh6
swsh35-19	swsh35
swsh7-124	swsh7
swsh10-118	swsh10
swsh12-136	swsh12
swsh12-183	swsh12
swsh12-201	swsh12
swshp-SWSH281	swshp
ex14-45	ex14
ex14-46	ex14
ex4-39	ex4
ex6-55	ex6
ex6-54	ex6
base6-68	base6
ecard1-94	ecard1
base1-44	base1
base4-67	base4
sm7-8	sm7
xy5-6	xy5
np-3	np
np-16	np
ex9-70	ex9
pop4-15	pop4
bw10-14	bw10
pop4-14	pop4
sm9-23	sm9
ex14-63	ex14
bw8-24	bw8
ex14-64	ex14
pl1-96	pl1
bw9-11	bw9
col1-13	col1
xy3-7	xy3
dp5-7	dp5
dp5-24	dp5
hgss3-17	hgss3
bwp-BW87	bwp
swsh7-8	swsh7
sm5-157	sm5
smp-SM237	smp
swsh10-13	swsh10
ecard1-42	ecard1
swsh1-41	swsh1
g1-20	g1
ecard1-8	ecard1
ex15-14	ex15
swsh8-218	swsh8
swsh8-256	swsh8
swsh8-217	swsh8
swsh8-257	swsh8
swsh11-151	swsh11
swsh3-153	swsh3
sm2-24	sm2
hgss4-50	hgss4
ex5-51	ex5
sm10-41	sm10
ecard2-38	ecard2
dp6-75	dp6
xy5-71	xy5
hgss4-80	hgss4
base6-96	base6
bw6-12	bw6
bw6-13	bw6
xy2-8	xy2
swsh11-14	swsh11
dp7-72	dp7
ex8-1	ex8
dp4-12	dp4
swsh35-49	swsh35
sm75-40	sm75
sm75-41	sm75
xyp-XY46	xyp
xy10-69	xy10
sm75-72	sm75
sma-SV77	sma
bw11-92	bw11
swshp-SWSH007	swshp
swsh1-64	swsh1
swsh45-30	swsh45
swsh8-85	swsh8
swsh10tg-TG04	swsh10tg
swsh2-204	swsh2
bw2-31	bw2
bw8-41	bw8
xy3-22	xy3
sm8-62	sm8
swsh9-43	swsh9
base3-17	base3
pl3-16	pl3
xy6-17	xy6
bw11-32	bw11
dp5-1	dp5
basep-22	basep
xy7-61	xy7
base2-56	base2
g1-53	g1
gym2-74	gym2
ex6-69	ex6
xy6-67	xy6
ex12-28	ex12
ex16-24	ex16
neo2-16	neo2
ex7-47	ex7
xy4-36	xy4
pop4-16	pop4
sm3-49	sm3
xy8-67	xy8
ex13-56	ex13
sm8-93	sm8
xyp-XY155	xyp
swsh1-191	swsh1
xy12-50	xy12
col1-60	col1
bw8-57	bw8
hgss1-70	hgss1
ex7-61	ex7
ex11-72	ex11
bw8-56	bw8
ex1-54	ex1
base5-56	base5
sm10-62	sm10
dp4-66	dp4
swsh35-33	swsh35
sm7-3	sm7
hgss4-12	hgss4
xy3-3	xy3
base2-14	base2
base4-32	base4
ecard2-42	ecard2
gym1-26	gym1
base2-30	base2
hgss1-67	hgss1
dp3-90	dp3
ecard2-83	ecard2
neo1-61	neo1
swsh7-2	swsh7
neo2-55	neo2
bw6-1	bw6
base4-44	base4
pl3-62	pl3
ecard1-82	ecard1
bp-6	bp
ex4-26	ex4
sm4-24	sm4
xy5-42	xy5
swsh12pt5-33	swsh12pt5
swsh9-32	swsh9
swsh5-38	swsh5
pl3-100	pl3
dp6-89	dp6
ex13-63	ex13
ex13-62	ex13
ex8-57	ex8
ex3-54	ex3
ex3-53	ex3
ex3-52	ex3
ex4-51	ex4
ex4-50	ex4
swsh45sv-SV103	swsh45sv
swshp-SWSH011	swshp
swsh8-222	swsh8
swsh1-152	swsh1
np-5	np
np-10	np
xy5-33	xy5
xyp-XY38	xyp
dpp-DP03	dpp
bw11-RC6	bw11
mcd21-20	mcd21
col1-53	col1
g1-RC1	g1
pl3-50	pl3
xy12-18	xy12
sm12-239	sm12
bw5-27	bw5
sm5-31	sm5
pop9-16	pop9
dp4-5	dp4
swsh5-49	swsh5
swsh9-52	swsh9
bw9-37	bw9
dp5-53	dp5
pop6-12	pop6
dp6-86	dp6
sm5-106	sm5
swsh8-212	swsh8
swsh12-144	swsh12
sm35-38	sm35
dp3-30	dp3
ex15-17	ex15
ex10-28	ex10
ecard2-18	ecard2
base1-31	base1
col1-29	col1
dp2-30	dp2
base2-22	base2
sm115-43	sm115
base4-27	base4
gym1-14	gym1
pl4-16	pl4
ecard3-H9	ecard3
gym2-29	gym2
ecard1-13	ecard1
neo4-6	neo4
neo4-36	neo4
pl4-42	pl4
ex6-34	ex6
dp7-40	dp7
sm4-37	sm4
base2-50	base2
hgss4-60	hgss4
bw6-60	bw6
base4-70	base4
sm6-57	sm6
sm4-52	sm4
basep-1	basep
det1-10	det1
ru1-7	ru1
hsp-HGSS03	hsp
sm115-7	sm115
sm9-12	sm9
sma-SV6	sma
sm9-11	sm9
det1-4	det1
\.


--
-- TOC entry 2954 (class 0 OID 52016)
-- Dependencies: 216
-- Data for Name: card_subtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card_subtype (card_id, subtype_id) FROM stdin;
ex5-78	1
basep-30	1
si1-4	1
xy6-43	1
ex11-15	2
sm4-16	2
neo3-25	2
xy12-31	2
xy1-34	2
xy8-27	1
ex1-55	1
base2-53	1
dp1-84	1
base4-76	1
xy9-25	1
base1-65	1
xy5-32	1
neo3-56	1
ex8-77	1
sm75-15	1
ex3-33	1
xy5-30	1
ex7-58	1
neo1-62	1
ecard2-84	1
det1-7	1
basep-20	1
sm11-35	1
sm11-35	3
sm11-35	4
base3-53	1
base5-65	1
neo4-79	1
ecard2-104	1
swsh10-28	1
basep-4	1
hgss3-35	1
ex16-22	1
base3-48	1
hgss3-50	1
sm12-23	1
gym2-64	1
ex11-78	1
swsh10-21	1
dp1-92	1
base6-84	1
sm8-109	1
pgo-36	1
sm115-33	1
sm9-34	1
xy2-45	1
sm9-35	1
ecard1-110	1
neo3-4	5
ecard3-H5	5
dp2-23	5
bw8-55	5
bw8-55	6
ex5-3	5
bw11-20	1
mcd16-1	1
sm9-15	1
swsh2-24	1
xy3-10	1
xy12-20	1
base1-36	1
sm11-21	1
gym1-37	1
bw7-29	1
sm10-33	1
base1-63	1
hgss2-63	1
ecard2-H2	2
pl2-1	2
basep-6	2
neo4-12	2
ecard3-H2	2
bw4-12	2
pl3-15	1
pl3-15	7
dp3-22	2
dp5-32	2
ex2-24	2
neo2-32	2
xy10-55	1
xy10-55	8
bw9-64	2
bw9-64	6
col1-22	2
bw5-60	2
ecard2-41	2
sma-SV69	2
sma-SV69	4
hgss3-86	2
hgss3-86	9
smp-SM36	2
smp-SM36	4
dp1-3	2
pl3-4	1
pl3-4	7
xy3-30	2
xy9-43	2
sm5-44	2
sm8-72	2
neo4-11	5
ex11-16	5
pop1-17	1
pop1-17	8
ex7-20	5
ecard2-H28	5
hgss2-26	5
dp7-30	5
dp2-17	5
neo2-31	5
ecard1-66	5
xy7-42	1
xy7-42	8
swsh45sv-SV055	2
swsh2-84	2
swsh6-72	2
swsh35-19	2
swsh7-124	1
swsh10-118	1
swsh12-136	10
swsh12-183	1
swsh12-183	11
swsh12-201	10
swshp-SWSH281	1
swshp-SWSH281	11
ex14-45	1
ex14-46	1
ex4-39	1
ex6-55	1
ex6-54	1
base6-68	1
ecard1-94	1
base1-44	1
base4-67	1
sm7-8	1
xy5-6	1
np-3	1
np-16	1
ex9-70	1
pop4-15	1
bw10-14	1
pop4-14	1
sm9-23	1
ex14-63	1
bw8-24	1
ex14-64	1
pl1-96	1
bw9-11	2
bw9-11	6
col1-13	2
xy3-7	2
dp5-7	2
dp5-24	2
hgss3-17	2
bwp-BW87	2
swsh7-8	12
sm5-157	2
sm5-157	4
smp-SM237	2
swsh10-13	2
ecard1-42	2
swsh1-41	2
g1-20	2
ecard1-8	2
ex15-14	2
swsh8-218	12
swsh8-256	1
swsh8-256	11
swsh8-217	1
swsh8-217	11
swsh8-257	1
swsh8-257	11
swsh11-151	2
swsh3-153	2
sm2-24	2
hgss4-50	2
ex5-51	2
sm10-41	2
ecard2-38	2
dp6-75	2
xy5-71	1
hgss4-80	1
base6-96	1
bw6-12	1
bw6-13	1
xy2-8	1
swsh11-14	1
dp7-72	1
ex8-1	2
dp4-12	2
swsh35-49	2
sm75-40	2
sm75-41	2
sm75-41	4
xyp-XY46	2
xy10-69	13
xy10-69	8
sm75-72	2
sm75-72	4
sma-SV77	2
sma-SV77	4
bw11-92	2
swshp-SWSH007	2
swsh1-64	2
swsh45-30	2
swsh8-85	2
swsh10tg-TG04	2
swsh2-204	2
bw2-31	2
bw8-41	2
bw8-41	6
xy3-22	2
sm8-62	2
swsh9-43	2
base3-17	1
pl3-16	1
xy6-17	1
bw11-32	1
dp5-1	1
basep-22	1
xy7-61	1
base2-56	1
g1-53	1
gym2-74	1
ex6-69	1
xy6-67	1
ex12-28	1
ex16-24	1
neo2-16	1
ex7-47	1
xy4-36	1
pop4-16	1
sm3-49	1
xy8-67	1
ex13-56	1
sm8-93	1
xyp-XY155	14
swsh1-191	1
swsh1-191	11
xy12-50	1
col1-60	1
bw8-57	1
hgss1-70	1
ex7-61	1
ex11-72	1
bw8-56	1
ex1-54	1
base5-56	1
sm10-62	1
dp4-66	1
swsh35-33	1
sm7-3	5
hgss4-12	5
xy3-3	5
base2-14	5
base4-32	5
ecard2-42	5
gym1-26	5
base2-30	5
hgss1-67	1
dp3-90	1
ecard2-83	1
neo1-61	1
swsh7-2	1
swsh7-2	15
neo2-55	1
bw6-1	1
base4-44	2
pl3-62	2
ecard1-82	2
bp-6	2
ex4-26	1
sm4-24	1
xy5-42	1
swsh12pt5-33	1
swsh9-32	1
swsh5-38	1
pl3-100	1
dp6-89	1
ex13-63	1
ex13-62	1
ex8-57	1
ex3-54	1
ex3-53	1
ex3-52	1
ex4-51	1
ex4-50	1
swsh45sv-SV103	1
swshp-SWSH011	1
swsh8-222	1
swsh1-152	1
np-5	1
np-10	1
xy5-33	1
xyp-XY38	1
dpp-DP03	1
bw11-RC6	1
mcd21-20	1
col1-53	1
g1-RC1	1
pl3-50	2
xy12-18	2
sm12-239	1
bw5-27	1
sm5-31	1
pop9-16	1
dp4-5	1
swsh5-49	1
swsh9-52	1
bw9-37	1
dp5-53	1
pop6-12	1
dp6-86	1
sm5-106	1
swsh8-212	1
swsh8-212	15
swsh12-144	1
sm35-38	1
dp3-30	1
ex15-17	1
ex10-28	1
ecard2-18	1
base1-31	1
col1-29	1
dp2-30	1
base2-22	1
sm115-43	1
base4-27	1
gym1-14	5
pl4-16	5
ecard3-H9	5
gym2-29	5
ecard1-13	5
neo4-6	5
neo4-36	2
pl4-42	2
ex6-34	2
dp7-40	2
sm4-37	2
base2-50	1
hgss4-60	1
bw6-60	1
base4-70	1
sm6-57	1
sm4-52	1
basep-1	1
det1-10	1
ru1-7	1
hsp-HGSS03	1
sm115-7	1
sm9-12	1
sma-SV6	1
sm9-11	1
det1-4	1
\.


--
-- TOC entry 2957 (class 0 OID 52041)
-- Dependencies: 219
-- Data for Name: card_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card_type (card_id, type_id) FROM stdin;
ex5-78	7
basep-30	7
si1-4	7
xy6-43	11
ex11-15	2
ex11-15	9
sm4-16	2
neo3-25	6
xy12-31	2
xy1-34	2
xy8-27	2
ex1-55	2
base2-53	2
dp1-84	2
base4-76	2
xy9-25	2
base1-65	2
xy5-32	2
neo3-56	2
ex8-77	2
sm75-15	2
ex3-33	2
xy5-30	2
ex7-58	2
neo1-62	2
ecard2-84	2
det1-7	2
basep-20	2
sm11-35	2
base3-53	2
base5-65	2
neo4-79	2
ecard2-104	2
swsh10-28	2
basep-4	4
hgss3-35	8
ex16-22	6
base3-48	3
hgss3-50	6
sm12-23	1
gym2-64	1
ex11-78	1
swsh10-21	1
dp1-92	5
base6-84	5
sm8-109	5
pgo-36	5
sm115-33	5
sm9-34	4
xy2-45	5
sm9-35	4
ecard1-110	5
neo3-4	3
ecard3-H5	3
dp2-23	6
bw8-55	6
ex5-3	3
bw11-20	1
mcd16-1	1
sm9-15	1
swsh2-24	1
xy3-10	1
xy12-20	1
base1-36	1
sm11-21	1
gym1-37	1
bw7-29	2
sm10-33	2
base1-63	2
hgss2-63	2
ecard2-H2	1
pl2-1	1
basep-6	1
neo4-12	1
ecard3-H2	1
bw4-12	1
pl3-15	1
dp3-22	1
dp5-32	8
ex2-24	8
neo2-32	8
xy10-55	8
bw9-64	8
col1-22	8
bw5-60	8
ecard2-41	8
sma-SV69	8
hgss3-86	8
smp-SM36	8
dp1-3	4
pl3-4	4
xy3-30	4
xy9-43	4
sm5-44	4
sm8-72	4
neo4-11	5
ex11-16	1
ex11-16	9
pop1-17	8
ex7-20	5
ex7-20	8
ecard2-H28	8
hgss2-26	8
dp7-30	8
dp2-17	8
neo2-31	8
ecard1-66	8
xy7-42	8
swsh45sv-SV055	6
swsh2-84	6
swsh6-72	6
swsh35-19	6
swsh7-124	10
swsh10-118	10
swsh12-136	10
swsh12-183	10
swsh12-201	10
swshp-SWSH281	10
ex14-45	3
ex14-46	3
ex4-39	3
ex6-55	3
ex6-54	3
base6-68	3
ecard1-94	3
base1-44	3
base4-67	3
sm7-8	3
xy5-6	3
np-3	3
np-16	3
ex9-70	3
pop4-15	6
bw10-14	2
pop4-14	2
sm9-23	2
ex14-63	2
bw8-24	2
ex14-64	2
pl1-96	2
bw9-11	3
col1-13	3
xy3-7	3
dp5-7	3
dp5-24	3
hgss3-17	3
bwp-BW87	3
swsh7-8	3
sm5-157	3
smp-SM237	3
swsh10-13	3
ecard1-42	2
swsh1-41	2
g1-20	2
ecard1-8	2
ex15-14	5
swsh8-218	7
swsh8-256	7
swsh8-217	7
swsh8-257	7
swsh11-151	7
swsh3-153	7
sm2-24	2
hgss4-50	2
ex5-51	2
sm10-41	2
ecard2-38	2
dp6-75	2
xy5-71	6
hgss4-80	2
base6-96	2
bw6-12	3
bw6-13	3
xy2-8	3
swsh11-14	3
dp7-72	6
ex8-1	7
dp4-12	7
swsh35-49	7
sm75-40	10
sm75-41	10
xyp-XY46	7
xy10-69	11
sm75-72	10
sma-SV77	10
bw11-92	10
swshp-SWSH007	2
swsh1-64	2
swsh45-30	2
swsh8-85	2
swsh10tg-TG04	2
swsh2-204	2
bw2-31	2
bw8-41	2
xy3-22	2
sm8-62	2
swsh9-43	2
base3-17	2
pl3-16	2
xy6-17	2
bw11-32	2
dp5-1	2
basep-22	2
xy7-61	7
base2-56	7
g1-53	7
gym2-74	7
ex6-69	7
xy6-67	7
ex12-28	6
ex16-24	6
neo2-16	6
ex7-47	8
xy4-36	6
pop4-16	6
sm3-49	6
xy8-67	6
ex13-56	6
sm8-93	6
xyp-XY155	6
swsh1-191	6
xy12-50	6
col1-60	6
bw8-57	6
hgss1-70	6
ex7-61	3
ex11-72	3
bw8-56	6
ex1-54	3
base5-56	3
sm10-62	6
dp4-66	6
swsh35-33	8
sm7-3	3
hgss4-12	3
xy3-3	3
base2-14	3
base4-32	3
ecard2-42	3
gym1-26	3
base2-30	3
hgss1-67	3
dp3-90	3
ecard2-83	3
neo1-61	3
swsh7-2	3
neo2-55	3
bw6-1	3
base4-44	3
pl3-62	3
ecard1-82	3
bp-6	3
ex4-26	2
sm4-24	2
xy5-42	2
swsh12pt5-33	2
swsh9-32	2
swsh5-38	2
pl3-100	2
dp6-89	2
ex13-63	2
ex13-62	2
ex8-57	2
ex3-54	2
ex3-53	2
ex3-52	2
ex4-51	2
ex4-50	2
swsh45sv-SV103	7
swshp-SWSH011	7
swsh8-222	7
swsh1-152	7
np-5	2
np-10	2
xy5-33	2
xyp-XY38	2
dpp-DP03	2
bw11-RC6	2
mcd21-20	2
col1-53	3
g1-RC1	3
pl3-50	1
xy12-18	1
sm12-239	2
bw5-27	2
sm5-31	2
pop9-16	2
dp4-5	4
swsh5-49	4
swsh9-52	4
bw9-37	4
dp5-53	7
pop6-12	7
dp6-86	7
sm5-106	7
swsh8-212	7
swsh12-144	7
sm35-38	6
dp3-30	6
ex15-17	1
ex10-28	2
ecard2-18	6
base1-31	6
col1-29	6
dp2-30	6
base2-22	6
sm115-43	11
base4-27	6
gym1-14	6
pl4-16	6
ecard3-H9	6
gym2-29	6
ecard1-13	6
neo4-6	6
neo4-36	6
pl4-42	6
ex6-34	6
dp7-40	6
sm4-37	6
base2-50	5
hgss4-60	5
bw6-60	5
base4-70	5
sm6-57	5
sm4-52	5
basep-1	4
det1-10	4
ru1-7	4
hsp-HGSS03	4
sm115-7	1
sm9-12	1
sma-SV6	1
sm9-11	1
det1-4	1
\.


--
-- TOC entry 2950 (class 0 OID 51978)
-- Dependencies: 212
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection (collection_id, user_id, name, description, is_private) FROM stdin;
1	1	The Cerulean Gym	An early stop for all up and coming Pokemon trainers!	f
2	1	Misty's secret Pokemon Collection	Nobody should know that I like these pokemon	t
3	2	Pewter City Gym	The very first stop for new Pokemon trainers who want to test their mettle!	f
4	3	Gary's PC	I store all of my Pokemon here!	f
5	3	Gary's Backup Pokemon	This is an external pc hard drive, incase mine breaks	f
6	4	My battle-team!	There are the best Pokemon I have for gym battles	f
7	5	All of the Pokemon I have saved	These are all of the Pokemon that I have cooked for. They chose to stick around on their own!	f
8	6	The perfect set of Pokemon	These Pokemon help me lead my school to great heights!	f
9	7	For a CHILLING battle	These ice Pokemon will freeze you in place	f
10	8	Pokemon we definitely haven't stolen	We DID NOT steal any of these Pokemon.	f
11	9	My favorite Pokemon	That's it	f
12	10	Cutest Pokemon	These are all the Pokemon that I think are really cute	f
13	11	OG squad	Been here since the beginning	f
14	12	Terrifying Pokemon	Only the scariest Pokemon go here	f
15	13	Charcoal's Collection	This one has all of my pikachu cards!	f
16	13	Water	All the water pokemon!	f
17	13	Fire	All the fire pokemon!	f
18	13	Grass	All the grass pokemon!	f
\.


--
-- TOC entry 2951 (class 0 OID 51990)
-- Dependencies: 213
-- Data for Name: collection_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_card (collection_id, card_id, quantity) FROM stdin;
1	ex5-78	1
1	basep-30	1
1	si1-4	1
1	xy6-43	1
1	ex11-15	1
1	sm4-16	1
1	neo3-25	1
1	xy12-31	1
1	xy1-34	1
1	xy8-27	1
1	ex1-55	1
1	base2-53	1
1	dp1-84	1
1	base4-76	1
1	xy9-25	1
1	base1-65	1
1	xy5-32	1
1	neo3-56	1
1	ex8-77	1
1	sm75-15	1
1	ex3-33	1
1	xy5-30	1
1	ex7-58	1
1	neo1-62	1
1	ecard2-84	1
1	det1-7	1
1	basep-20	1
1	sm11-35	1
1	base3-53	1
1	base5-65	1
1	neo4-79	1
1	ecard2-104	1
1	swsh10-28	1
2	hgss3-35	1
2	ex16-22	1
2	base3-48	1
2	hgss3-50	1
2	sm12-23	1
2	gym2-64	1
2	ex11-78	1
2	swsh10-21	1
3	dp1-92	1
3	base6-84	1
3	sm8-109	1
3	pgo-36	1
3	sm115-33	1
3	sm9-34	1
3	xy2-45	1
3	sm9-35	1
3	ecard1-110	1
3	neo3-4	1
3	ecard3-H5	1
3	dp2-23	1
3	bw8-55	1
3	ex5-3	1
3	bw11-20	1
3	mcd16-1	1
3	sm9-15	1
3	swsh2-24	1
4	xy3-10	1
4	xy12-20	1
4	base1-36	1
4	sm11-21	1
4	gym1-37	1
4	bw7-29	1
4	sm10-33	1
4	base1-63	1
4	hgss2-63	1
4	ecard2-H2	1
4	pl2-1	1
4	basep-6	1
4	neo4-12	1
4	ecard3-H2	1
4	bw4-12	1
4	pl3-15	1
4	dp3-22	1
4	dp5-32	1
4	ex2-24	1
4	neo2-32	1
4	xy10-55	1
4	bw9-64	1
4	col1-22	1
4	bw5-60	1
4	ecard2-41	1
4	sma-SV69	1
4	hgss3-86	1
4	smp-SM36	1
5	dp1-3	1
5	pl3-4	1
5	xy3-30	1
5	xy9-43	1
5	sm5-44	1
5	sm8-72	1
5	neo4-11	1
5	ex11-16	1
5	pop1-17	1
5	ex7-20	1
5	ecard2-H28	1
5	hgss2-26	1
5	dp7-30	1
5	dp2-17	1
5	neo2-31	1
5	ecard1-66	1
5	xy7-42	1
5	swsh45sv-SV055	1
5	swsh2-84	1
5	swsh6-72	1
5	swsh35-19	1
5	swsh7-124	1
5	swsh10-118	1
5	swsh12-136	1
5	swsh12-183	1
5	swsh12-201	1
5	swshp-SWSH281	1
6	ex14-45	1
6	ex14-46	1
6	ex4-39	1
6	ex6-55	1
6	ex6-54	1
6	base6-68	1
6	ecard1-94	1
6	base1-44	1
6	base4-67	1
6	sm7-8	1
6	xy5-6	1
6	np-3	1
6	np-16	1
6	ex9-70	1
6	pop4-15	1
6	sm10-33	1
6	bw10-14	1
6	pop4-14	1
6	sm9-23	1
6	ex14-63	1
6	bw8-24	1
6	ex14-64	1
6	pl1-96	1
6	bw9-11	1
6	col1-13	1
6	xy3-7	1
6	dp5-7	1
6	dp5-24	1
6	hgss3-17	1
6	bwp-BW87	1
6	swsh7-8	1
6	sm5-157	1
6	smp-SM237	1
6	swsh10-13	1
7	ecard1-42	1
7	swsh1-41	1
7	g1-20	1
7	ecard1-8	1
7	ex15-14	1
7	swsh8-218	1
7	swsh8-256	1
7	swsh8-217	1
7	swsh8-257	1
7	swsh11-151	1
7	swsh3-153	1
7	sm2-24	1
7	hgss4-50	1
7	ex5-51	1
7	sm10-41	1
7	ecard2-38	1
7	dp6-75	1
7	xy5-71	1
7	hgss4-80	1
7	base6-96	1
7	bw6-12	1
7	bw6-13	1
7	xy2-8	1
7	swsh11-14	1
7	dp7-72	1
8	basep-30	1
8	si1-4	1
8	ex11-15	1
8	sm4-16	1
8	xy12-31	1
8	ex1-55	1
8	neo3-56	1
8	base1-65	1
8	xy5-32	1
8	sm75-15	1
8	ex8-77	1
8	xy9-25	1
8	ex7-58	1
8	xy5-30	1
8	ex3-33	1
8	det1-7	1
8	ecard2-84	1
8	neo1-62	1
8	base3-53	1
8	sm11-35	1
8	basep-20	1
8	ecard2-104	1
8	neo4-79	1
8	base5-65	1
8	hgss3-35	1
8	basep-4	1
8	swsh10-28	1
8	hgss3-50	1
8	base3-48	1
8	ex16-22	1
8	ex11-78	1
8	gym2-64	1
8	sm12-23	1
8	base6-84	1
8	dp1-92	1
8	swsh10-21	1
8	sm115-33	1
8	pgo-36	1
8	sm8-109	1
8	ex5-3	1
8	bw8-55	1
8	dp2-23	1
8	sm9-15	1
8	mcd16-1	1
8	bw11-20	1
8	xy12-20	1
8	xy3-10	1
8	swsh2-24	1
8	gym1-37	1
9	ex8-1	1
9	dp4-12	1
9	swsh35-49	1
9	sm75-40	1
9	sm75-41	1
9	xyp-XY46	1
9	xy10-69	1
9	sm75-72	1
9	sma-SV77	1
9	bw11-92	1
9	swshp-SWSH007	1
9	swsh1-64	1
9	swsh45-30	1
9	swsh8-85	1
9	swsh10tg-TG04	1
9	swsh2-204	1
9	bw2-31	1
9	bw8-41	1
9	xy3-22	1
9	sm8-62	1
9	swsh9-43	1
9	base3-17	1
9	pl3-16	1
9	xy6-17	1
9	bw11-32	1
9	dp5-1	1
9	basep-22	1
10	xy7-61	1
10	base2-56	1
10	g1-53	1
10	gym2-74	1
10	ex6-69	1
10	xy6-67	1
10	ex12-28	1
10	ex16-24	1
10	neo2-16	1
10	ex7-47	1
10	xy4-36	1
10	pop4-16	1
10	sm3-49	1
10	xy8-67	1
10	ex13-56	1
10	sm8-93	1
10	xyp-XY155	1
10	swsh1-191	1
10	xy12-50	1
10	col1-60	1
10	bw8-57	1
10	hgss1-70	1
10	ex7-61	1
10	ex11-72	1
10	bw8-56	1
10	ex1-54	1
10	base5-56	1
10	sm10-62	1
10	dp4-66	1
10	swsh35-33	1
10	sm7-3	1
10	hgss4-12	1
10	xy3-3	1
10	base2-14	1
10	base4-32	1
10	ecard2-42	1
10	gym1-26	1
10	base2-30	1
10	hgss1-67	1
10	dp3-90	1
10	ecard2-83	1
10	neo1-61	1
10	swsh7-2	1
10	neo2-55	1
10	bw6-1	1
10	base4-44	1
10	pl3-62	1
10	ecard1-82	1
10	bp-6	1
11	ex4-26	1
11	sm4-24	1
11	xy5-42	1
11	swsh12pt5-33	1
11	swsh9-32	1
11	swsh5-38	1
11	pl3-100	1
11	dp6-89	1
11	ex13-63	1
11	ex13-62	1
11	ex8-57	1
11	ex3-54	1
11	ex3-53	1
11	ex3-52	1
11	ex4-51	1
11	ex4-50	1
11	swsh45sv-SV103	1
11	swshp-SWSH011	1
11	swsh8-222	1
11	swsh1-152	1
12	np-5	1
12	np-10	1
12	xy5-33	1
12	xyp-XY38	1
12	dpp-DP03	1
12	bw11-RC6	1
12	mcd21-20	1
12	col1-53	1
12	g1-RC1	1
12	pl3-50	1
12	xy12-18	1
13	sm12-239	1
13	bw5-27	1
13	sm5-31	1
13	bw11-RC6	1
13	mcd21-20	1
13	pop9-16	1
13	dp4-5	1
13	swsh5-49	1
13	swsh9-52	1
13	bw9-37	1
13	dp5-53	1
13	pop6-12	1
13	dp6-86	1
13	sm5-106	1
13	swsh8-212	1
13	swsh12-144	1
14	sm35-38	1
14	dp3-30	1
14	ex15-17	1
14	ex10-28	1
14	ecard2-18	1
14	base1-31	1
14	col1-29	1
14	dp2-30	1
14	base2-22	1
14	sm115-43	1
14	base4-27	1
14	gym1-14	1
14	pl4-16	1
14	ecard3-H9	1
14	gym2-29	1
14	ecard1-13	1
14	neo4-6	1
14	neo4-36	1
14	pl4-42	1
14	ex6-34	1
14	dp7-40	1
14	sm4-37	1
14	base2-50	1
14	hgss4-60	1
14	bw6-60	1
14	base4-70	1
14	sm6-57	1
14	sm4-52	1
15	det1-10	1
15	ru1-7	1
15	sm115-7	1
15	sm9-12	1
15	sma-SV6	1
15	sm9-11	1
15	hsp-HGSS03	3
\.


--
-- TOC entry 2947 (class 0 OID 51954)
-- Dependencies: 209
-- Data for Name: friends; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friends (from_user_id, to_user_id, accepted) FROM stdin;
2	1	t
1	3	t
3	2	t
12	11	t
10	9	t
11	9	t
12	9	t
11	10	t
12	10	t
8	7	t
9	7	t
10	7	t
5	4	t
10	6	t
5	3	t
9	3	t
7	1	t
9	1	t
10	1	t
11	1	t
12	1	t
9	2	t
12	2	t
13	1	t
14	1	t
\.


--
-- TOC entry 2942 (class 0 OID 51897)
-- Dependencies: 204
-- Data for Name: profile_pokemons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_pokemons (image_id, pokemon) FROM stdin;
1	Camerupt
2	Bulbasaur
3	Squirtle
4	Charmander
5	Pikachu
6	Chikorita
7	Totodile
8	Cyndaquil
9	Treecko
10	Mudkip
11	Torchic
\.


--
-- TOC entry 2958 (class 0 OID 52056)
-- Dependencies: 220
-- Data for Name: set; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.set (id, name, series, printed_total, symbol_image, logo_image) FROM stdin;
ex5	Hidden Legends	EX	101	https://images.pokemontcg.io/ex5/symbol.png	https://images.pokemontcg.io/ex5/logo.png
basep	Wizards Black Star Promos	Base	53	https://images.pokemontcg.io/basep/symbol.png	https://images.pokemontcg.io/basep/logo.png
si1	Southern Islands	Other	18	https://images.pokemontcg.io/si1/symbol.png	https://images.pokemontcg.io/si1/logo.png
xy6	Roaring Skies	XY	108	https://images.pokemontcg.io/xy6/symbol.png	https://images.pokemontcg.io/xy6/logo.png
ex11	Delta Species	EX	113	https://images.pokemontcg.io/ex11/symbol.png	https://images.pokemontcg.io/ex11/logo.png
sm4	Crimson Invasion	Sun & Moon	111	https://images.pokemontcg.io/sm4/symbol.png	https://images.pokemontcg.io/sm4/logo.png
neo3	Neo Revelation	Neo	64	https://images.pokemontcg.io/neo3/symbol.png	https://images.pokemontcg.io/neo3/logo.png
xy12	Evolutions	XY	108	https://images.pokemontcg.io/xy12/symbol.png	https://images.pokemontcg.io/xy12/logo.png
xy1	XY	XY	146	https://images.pokemontcg.io/xy1/symbol.png	https://images.pokemontcg.io/xy1/logo.png
xy8	BREAKthrough	XY	162	https://images.pokemontcg.io/xy8/symbol.png	https://images.pokemontcg.io/xy8/logo.png
ex1	Ruby & Sapphire	EX	109	https://images.pokemontcg.io/ex1/symbol.png	https://images.pokemontcg.io/ex1/logo.png
base2	Jungle	Base	64	https://images.pokemontcg.io/base2/symbol.png	https://images.pokemontcg.io/base2/logo.png
dp1	Diamond & Pearl	Diamond & Pearl	130	https://images.pokemontcg.io/dp1/symbol.png	https://images.pokemontcg.io/dp1/logo.png
base4	Base Set 2	Base	130	https://images.pokemontcg.io/base4/symbol.png	https://images.pokemontcg.io/base4/logo.png
xy9	BREAKpoint	XY	122	https://images.pokemontcg.io/xy9/symbol.png	https://images.pokemontcg.io/xy9/logo.png
base1	Base	Base	102	https://images.pokemontcg.io/base1/symbol.png	https://images.pokemontcg.io/base1/logo.png
xy5	Primal Clash	XY	160	https://images.pokemontcg.io/xy5/symbol.png	https://images.pokemontcg.io/xy5/logo.png
ex8	Deoxys	EX	107	https://images.pokemontcg.io/ex8/symbol.png	https://images.pokemontcg.io/ex8/logo.png
sm75	Dragon Majesty	Sun & Moon	70	https://images.pokemontcg.io/sm75/symbol.png	https://images.pokemontcg.io/sm75/logo.png
ex3	Dragon	EX	97	https://images.pokemontcg.io/ex3/symbol.png	https://images.pokemontcg.io/ex3/logo.png
ex7	Team Rocket Returns	EX	109	https://images.pokemontcg.io/ex7/symbol.png	https://images.pokemontcg.io/ex7/logo.png
neo1	Neo Genesis	Neo	111	https://images.pokemontcg.io/neo1/symbol.png	https://images.pokemontcg.io/neo1/logo.png
ecard2	Aquapolis	E-Card	147	https://images.pokemontcg.io/ecard2/symbol.png	https://images.pokemontcg.io/ecard2/logo.png
det1	Detective Pikachu	Sun & Moon	18	https://images.pokemontcg.io/det1/symbol.png	https://images.pokemontcg.io/det1/logo.png
sm11	Unified Minds	Sun & Moon	236	https://images.pokemontcg.io/sm11/symbol.png	https://images.pokemontcg.io/sm11/logo.png
base3	Fossil	Base	62	https://images.pokemontcg.io/base3/symbol.png	https://images.pokemontcg.io/base3/logo.png
base5	Team Rocket	Base	82	https://images.pokemontcg.io/base5/symbol.png	https://images.pokemontcg.io/base5/logo.png
neo4	Neo Destiny	Neo	105	https://images.pokemontcg.io/neo4/symbol.png	https://images.pokemontcg.io/neo4/logo.png
swsh10	Astral Radiance	Sword & Shield	189	https://images.pokemontcg.io/swsh10/symbol.png	https://images.pokemontcg.io/swsh10/logo.png
hgss3	HS—Undaunted	HeartGold & SoulSilver	90	https://images.pokemontcg.io/hgss3/symbol.png	https://images.pokemontcg.io/hgss3/logo.png
ex16	Power Keepers	EX	108	https://images.pokemontcg.io/ex16/symbol.png	https://images.pokemontcg.io/ex16/logo.png
sm12	Cosmic Eclipse	Sun & Moon	236	https://images.pokemontcg.io/sm12/symbol.png	https://images.pokemontcg.io/sm12/logo.png
gym2	Gym Challenge	Gym	132	https://images.pokemontcg.io/gym2/symbol.png	https://images.pokemontcg.io/gym2/logo.png
base6	Legendary Collection	Other	110	https://images.pokemontcg.io/base6/symbol.png	https://images.pokemontcg.io/base6/logo.png
sm8	Lost Thunder	Sun & Moon	214	https://images.pokemontcg.io/sm8/symbol.png	https://images.pokemontcg.io/sm8/logo.png
pgo	Pokémon GO	Sword & Shield	78	https://images.pokemontcg.io/pgo/symbol.png	https://images.pokemontcg.io/pgo/logo.png
sm115	Hidden Fates	Sun & Moon	68	https://images.pokemontcg.io/sm115/symbol.png	https://images.pokemontcg.io/sm115/logo.png
sm9	Team Up	Sun & Moon	181	https://images.pokemontcg.io/sm9/symbol.png	https://images.pokemontcg.io/sm9/logo.png
xy2	Flashfire	XY	106	https://images.pokemontcg.io/xy2/symbol.png	https://images.pokemontcg.io/xy2/logo.png
ecard1	Expedition Base Set	E-Card	165	https://images.pokemontcg.io/ecard1/symbol.png	https://images.pokemontcg.io/ecard1/logo.png
ecard3	Skyridge	E-Card	182	https://images.pokemontcg.io/ecard3/symbol.png	https://images.pokemontcg.io/ecard3/logo.png
dp2	Mysterious Treasures	Diamond & Pearl	123	https://images.pokemontcg.io/dp2/symbol.png	https://images.pokemontcg.io/dp2/logo.png
bw8	Plasma Storm	Black & White	135	https://images.pokemontcg.io/bw8/symbol.png	https://images.pokemontcg.io/bw8/logo.png
bw11	Legendary Treasures	Black & White	113	https://images.pokemontcg.io/bw11/symbol.png	https://images.pokemontcg.io/bw11/logo.png
mcd16	McDonald's Collection 2016	Other	12	https://images.pokemontcg.io/mcd16/symbol.png	https://images.pokemontcg.io/mcd16/logo.png
swsh2	Rebel Clash	Sword & Shield	192	https://images.pokemontcg.io/swsh2/symbol.png	https://images.pokemontcg.io/swsh2/logo.png
xy3	Furious Fists	XY	111	https://images.pokemontcg.io/xy3/symbol.png	https://images.pokemontcg.io/xy3/logo.png
gym1	Gym Heroes	Gym	132	https://images.pokemontcg.io/gym1/symbol.png	https://images.pokemontcg.io/gym1/logo.png
bw7	Boundaries Crossed	Black & White	149	https://images.pokemontcg.io/bw7/symbol.png	https://images.pokemontcg.io/bw7/logo.png
sm10	Unbroken Bonds	Sun & Moon	214	https://images.pokemontcg.io/sm10/symbol.png	https://images.pokemontcg.io/sm10/logo.png
hgss2	HS—Unleashed	HeartGold & SoulSilver	95	https://images.pokemontcg.io/hgss2/symbol.png	https://images.pokemontcg.io/hgss2/logo.png
pl2	Rising Rivals	Platinum	111	https://images.pokemontcg.io/pl2/symbol.png	https://images.pokemontcg.io/pl2/logo.png
bw4	Next Destinies	Black & White	99	https://images.pokemontcg.io/bw4/symbol.png	https://images.pokemontcg.io/bw4/logo.png
pl3	Supreme Victors	Platinum	147	https://images.pokemontcg.io/pl3/symbol.png	https://images.pokemontcg.io/pl3/logo.png
dp3	Secret Wonders	Diamond & Pearl	132	https://images.pokemontcg.io/dp3/symbol.png	https://images.pokemontcg.io/dp3/logo.png
dp5	Majestic Dawn	Diamond & Pearl	100	https://images.pokemontcg.io/dp5/symbol.png	https://images.pokemontcg.io/dp5/logo.png
ex2	Sandstorm	EX	100	https://images.pokemontcg.io/ex2/symbol.png	https://images.pokemontcg.io/ex2/logo.png
neo2	Neo Discovery	Neo	75	https://images.pokemontcg.io/neo2/symbol.png	https://images.pokemontcg.io/neo2/logo.png
xy10	Fates Collide	XY	124	https://images.pokemontcg.io/xy10/symbol.png	https://images.pokemontcg.io/xy10/logo.png
bw9	Plasma Freeze	Black & White	116	https://images.pokemontcg.io/bw9/symbol.png	https://images.pokemontcg.io/bw9/logo.png
col1	Call of Legends	HeartGold & SoulSilver	106	https://images.pokemontcg.io/col1/symbol.png	https://images.pokemontcg.io/col1/logo.png
bw5	Dark Explorers	Black & White	108	https://images.pokemontcg.io/bw5/symbol.png	https://images.pokemontcg.io/bw5/logo.png
sma	Shiny Vault	Sun & Moon	94	https://images.pokemontcg.io/sma/symbol.png	https://images.pokemontcg.io/sma/logo.png
smp	SM Black Star Promos	Sun & Moon	248	https://images.pokemontcg.io/smp/symbol.png	https://images.pokemontcg.io/smp/logo.png
sm5	Ultra Prism	Sun & Moon	156	https://images.pokemontcg.io/sm5/symbol.png	https://images.pokemontcg.io/sm5/logo.png
pop1	POP Series 1	POP	17	https://images.pokemontcg.io/pop1/symbol.png	https://images.pokemontcg.io/pop1/logo.png
dp7	Stormfront	Diamond & Pearl	100	https://images.pokemontcg.io/dp7/symbol.png	https://images.pokemontcg.io/dp7/logo.png
xy7	Ancient Origins	XY	98	https://images.pokemontcg.io/xy7/symbol.png	https://images.pokemontcg.io/xy7/logo.png
swsh45sv	Shiny Vault	Sword & Shield	122	https://images.pokemontcg.io/swsh45sv/symbol.png	https://images.pokemontcg.io/swsh45sv/logo.png
swsh6	Chilling Reign	Sword & Shield	198	https://images.pokemontcg.io/swsh6/symbol.png	https://images.pokemontcg.io/swsh6/logo.png
swsh35	Champion's Path	Sword & Shield	73	https://images.pokemontcg.io/swsh35/symbol.png	https://images.pokemontcg.io/swsh35/logo.png
swsh7	Evolving Skies	Sword & Shield	203	https://images.pokemontcg.io/swsh7/symbol.png	https://images.pokemontcg.io/swsh7/logo.png
swsh12	Silver Tempest	Sword & Shield	195	https://images.pokemontcg.io/swsh12/symbol.png	https://images.pokemontcg.io/swsh12/logo.png
swshp	SWSH Black Star Promos	Sword & Shield	184	https://images.pokemontcg.io/swshp/symbol.png	https://images.pokemontcg.io/swshp/logo.png
ex14	Crystal Guardians	EX	100	https://images.pokemontcg.io/ex14/symbol.png	https://images.pokemontcg.io/ex14/logo.png
ex4	Team Magma vs Team Aqua	EX	95	https://images.pokemontcg.io/ex4/symbol.png	https://images.pokemontcg.io/ex4/logo.png
ex6	FireRed & LeafGreen	EX	112	https://images.pokemontcg.io/ex6/symbol.png	https://images.pokemontcg.io/ex6/logo.png
sm7	Celestial Storm	Sun & Moon	168	https://images.pokemontcg.io/sm7/symbol.png	https://images.pokemontcg.io/sm7/logo.png
np	Nintendo Black Star Promos	NP	40	https://images.pokemontcg.io/np/symbol.png	https://images.pokemontcg.io/np/logo.png
ex9	Emerald	EX	106	https://images.pokemontcg.io/ex9/symbol.png	https://images.pokemontcg.io/ex9/logo.png
pop4	POP Series 4	POP	17	https://images.pokemontcg.io/pop4/symbol.png	https://images.pokemontcg.io/pop4/logo.png
bw10	Plasma Blast	Black & White	101	https://images.pokemontcg.io/bw10/symbol.png	https://images.pokemontcg.io/bw10/logo.png
pl1	Platinum	Platinum	127	https://images.pokemontcg.io/pl1/symbol.png	https://images.pokemontcg.io/pl1/logo.png
bwp	BW Black Star Promos	Black & White	101	https://images.pokemontcg.io/bwp/symbol.png	https://images.pokemontcg.io/bwp/logo.png
swsh1	Sword & Shield	Sword & Shield	202	https://images.pokemontcg.io/swsh1/symbol.png	https://images.pokemontcg.io/swsh1/logo.png
g1	Generations	XY	83	https://images.pokemontcg.io/g1/symbol.png	https://images.pokemontcg.io/g1/logo.png
ex15	Dragon Frontiers	EX	101	https://images.pokemontcg.io/ex15/symbol.png	https://images.pokemontcg.io/ex15/logo.png
swsh8	Fusion Strike	Sword & Shield	264	https://images.pokemontcg.io/swsh8/symbol.png	https://images.pokemontcg.io/swsh8/logo.png
swsh11	Lost Origin	Sword & Shield	196	https://images.pokemontcg.io/swsh11/symbol.png	https://images.pokemontcg.io/swsh11/logo.png
swsh3	Darkness Ablaze	Sword & Shield	189	https://images.pokemontcg.io/swsh3/symbol.png	https://images.pokemontcg.io/swsh3/logo.png
sm2	Guardians Rising	Sun & Moon	145	https://images.pokemontcg.io/sm2/symbol.png	https://images.pokemontcg.io/sm2/logo.png
hgss4	HS—Triumphant	HeartGold & SoulSilver	102	https://images.pokemontcg.io/hgss4/symbol.png	https://images.pokemontcg.io/hgss4/logo.png
dp6	Legends Awakened	Diamond & Pearl	146	https://images.pokemontcg.io/dp6/symbol.png	https://images.pokemontcg.io/dp6/logo.png
bw6	Dragons Exalted	Black & White	124	https://images.pokemontcg.io/bw6/symbol.png	https://images.pokemontcg.io/bw6/logo.png
dp4	Great Encounters	Diamond & Pearl	106	https://images.pokemontcg.io/dp4/symbol.png	https://images.pokemontcg.io/dp4/logo.png
xyp	XY Black Star Promos	XY	211	https://images.pokemontcg.io/xyp/symbol.png	https://images.pokemontcg.io/xyp/logo.png
swsh45	Shining Fates	Sword & Shield	72	https://images.pokemontcg.io/swsh45/symbol.png	https://images.pokemontcg.io/swsh45/logo.png
swsh10tg	Astral Radiance Trainer Gallery	Sword & Shield	30	https://images.pokemontcg.io/swsh10tg/symbol.png	https://images.pokemontcg.io/swsh10tg/logo.png
bw2	Emerging Powers	Black & White	98	https://images.pokemontcg.io/bw2/symbol.png	https://images.pokemontcg.io/bw2/logo.png
swsh9	Brilliant Stars	Sword & Shield	172	https://images.pokemontcg.io/swsh9/symbol.png	https://images.pokemontcg.io/swsh9/logo.png
ex12	Legend Maker	EX	92	https://images.pokemontcg.io/ex12/symbol.png	https://images.pokemontcg.io/ex12/logo.png
xy4	Phantom Forces	XY	119	https://images.pokemontcg.io/xy4/symbol.png	https://images.pokemontcg.io/xy4/logo.png
sm3	Burning Shadows	Sun & Moon	147	https://images.pokemontcg.io/sm3/symbol.png	https://images.pokemontcg.io/sm3/logo.png
ex13	Holon Phantoms	EX	110	https://images.pokemontcg.io/ex13/symbol.png	https://images.pokemontcg.io/ex13/logo.png
hgss1	HeartGold & SoulSilver	HeartGold & SoulSilver	123	https://images.pokemontcg.io/hgss1/symbol.png	https://images.pokemontcg.io/hgss1/logo.png
bp	Best of Game	Other	9	https://images.pokemontcg.io/bp/symbol.png	https://images.pokemontcg.io/bp/logo.png
swsh12pt5	Crown Zenith	Sword & Shield	159	https://images.pokemontcg.io/swsh12pt5/symbol.png	https://images.pokemontcg.io/swsh12pt5/logo.png
swsh5	Battle Styles	Sword & Shield	163	https://images.pokemontcg.io/swsh5/symbol.png	https://images.pokemontcg.io/swsh5/logo.png
dpp	DP Black Star Promos	Diamond & Pearl	56	https://images.pokemontcg.io/dpp/symbol.png	https://images.pokemontcg.io/dpp/logo.png
mcd21	McDonald's Collection 2021	Other	25	https://images.pokemontcg.io/mcd21/symbol.png	https://images.pokemontcg.io/mcd21/logo.png
pop9	POP Series 9	POP	17	https://images.pokemontcg.io/pop9/symbol.png	https://images.pokemontcg.io/pop9/logo.png
pop6	POP Series 6	POP	17	https://images.pokemontcg.io/pop6/symbol.png	https://images.pokemontcg.io/pop6/logo.png
sm35	Shining Legends	Sun & Moon	73	https://images.pokemontcg.io/sm35/symbol.png	https://images.pokemontcg.io/sm35/logo.png
ex10	Unseen Forces	EX	115	https://images.pokemontcg.io/ex10/symbol.png	https://images.pokemontcg.io/ex10/logo.png
pl4	Arceus	Platinum	99	https://images.pokemontcg.io/pl4/symbol.png	https://images.pokemontcg.io/pl4/logo.png
sm6	Forbidden Light	Sun & Moon	131	https://images.pokemontcg.io/sm6/symbol.png	https://images.pokemontcg.io/sm6/logo.png
ru1	Pokémon Rumble	Other	16	https://images.pokemontcg.io/ru1/symbol.png	https://images.pokemontcg.io/ru1/logo.png
hsp	HGSS Black Star Promos	HeartGold & SoulSilver	25	https://images.pokemontcg.io/hsp/symbol.png	https://images.pokemontcg.io/hsp/logo.png
\.


--
-- TOC entry 2953 (class 0 OID 52008)
-- Dependencies: 215
-- Data for Name: subtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subtype (id, name) FROM stdin;
1	Basic
2	Stage 1
3	TAG TEAM
4	GX
5	Stage 2
6	Team Plasma
7	SP
8	EX
9	Prime
10	VSTAR
11	V
12	VMAX
13	MEGA
14	BREAK
15	Rapid Strike
\.


--
-- TOC entry 2956 (class 0 OID 52033)
-- Dependencies: 218
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type (id, name) FROM stdin;
1	Fire
2	Water
3	Grass
4	Lightning
5	Fighting
6	Psychic
7	Colorless
8	Darkness
9	Metal
10	Dragon
11	Fairy
\.


--
-- TOC entry 2943 (class 0 OID 51903)
-- Dependencies: 205
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password_hash, role, email, full_name, shipping_address, bio, profile_pokemon, is_premium, pronouns) FROM stdin;
1	Misty	$2a$10$lOb3FHz3KYh6pssJdd3rQu5PY9forHrKfPU7idPnHVtWiEMS8C79u	ROLE_USER	\N	Misty	3rd House, Cerulean City	I am an aspiring Water Pokémon Master. I am also the Gym Leader of the Cerulean Gym, handing out the Cascade Badge to Trainers who defeat me. I specialize in Water-type Pokémon.	10	t	She/her
2	Brock	$2a$10$HT409E3ucVshKYXsW2cCJOaBuAtJFze781KFiFkHdlVp.ch6uC8..	ROLE_USER	\N	\N	\N	I am an aspiring Pokémon Doctor from Pewter City. I am the Gym Leader of the Pewter Gym, handing out the Boulder Badge to Trainers who defeat me.	1	f	He/him
3	Gary	$2a$10$qCi6GKgXjlqP.dzeJ7jvy.ogyI57ign1DA2j.7DQvhCEOMf./0Zsa	ROLE_USER	\N	\N	\N	I am a Pokémon Researcher from Pallet Town and grandson of Professor Oak. I have two main rivals names Ash and Goh	3	f	He/him
4	Leaf	$2a$10$rxGzyxpA8noBhc6rcZ0/l./N2E0n8M21Yfa1XVpS1fDhzo.h6gRna	ROLE_USER	\N	\N	\N	I am on a journey to defeat the elite four after conquering every gym! Add me on PokemonGo #847232235678	2	f	She/her
5	Arven	$2a$10$GyzK5p/ZXJxJI1w.RaMx.e3bhtJi4kHqEJoOIXuaAK37u/Kqlcpz.	ROLE_USER	\N	\N	\N	I am the ultimate Pokemon chef! I will cook my way around the world and feed every Pokemon I can.	11	f	He/him
6	Nemona	$2a$10$4qzaFJjY2.Ujr6LXL5gUzeW0P3vqkz/xhfuCU4P.5kGjgjixcIXBu	ROLE_USER	\N	\N	\N	\N	6	f	\N
7	Grusha	$2a$10$Wpl/aM9lh7eTTHnFWK5o0OEBxNjRA4y2IXcdfUUPJ0X6aQ6k5SRQ.	ROLE_USER	\N	\N	\N	I am the gym Glaseado gym! You'll never get past our freezing winds!	7	f	He/him
8	Team Rocket	$2a$10$uZ6nWD6p2nt4Cco9ECpke.9CCF0qFmMFCFqBYbAsKWqU4mMZpbc82	ROLE_USER	\N	\N	\N	Prepare for trouble! And make it double! To protect the world from devastation! To unite all peoples within our nation! To denounce the evils of truth and love! To extend our reach to the stars above! Jessie! James! Team Rocket blasts off at the speed of light! Surrender now, or prepare to fight!	8	f	\N
10	StormFyra	$2a$10$nIN.kgMcCDOfE6Bh2V7Yx.ZEzQWqzNOzIjfilwllgFrUaPwAtFxO2	ROLE_USER	\N	\N	\N	I love mudkip	10	t	they/them
14	Kiln	$2a$10$RAZAdxxaIXEESVdMItht2uqtYi0RzyVeHX8osKeXKyM8R7aywgLw.	ROLE_USER	\N	\N	\N	Gotta catch 'em all!	5	t	he/him
11	Yuumi	$2a$10$RxAVlccyIDeELOBlM2SroOTEIKM8a6aaGnWSAA2lUUa8p3ieuSHq2	ROLE_USER	\N	\N	\N	\N	5	t	she/her
12	QTSalt	$2a$10$bcpKULRWzdhjL4rOUMIPVONKLPu/3gJiHj0Qf0yGwEzCpHQpmstY6	ROLE_USER	\N	\N	\N	I love this site! It's such a great place to make friends.	9	f	they/them
9	Catandnova	$2a$10$qXYcuJLhMCP50MCxv9TNvuXglzVnRkhdZI.MlKTB2VlrDL6m.ICkm	ROLE_USER	\N	\N	\N	Hello! Im a very mean user.	5	t	they/she/he
13	Charcoal	$2a$10$8l3bImyetG8lvoqM9jA2j.7wwtBLaWB1R5W7BYsAx1buGp7dTp91q	ROLE_USER	\N	\N	\N	I wanna be the very best! Like no one ever was.	5	t	he/him
\.


--
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 211
-- Name: collection_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_collection_id_seq', 27, true);


--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 203
-- Name: profile_pokemons_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_pokemons_image_id_seq', 11, true);


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 202
-- Name: seq_user_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_user_id', 14, true);


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 214
-- Name: subtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subtype_id_seq', 15, true);


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 217
-- Name: type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_id_seq', 11, true);


--
-- TOC entry 2769 (class 2606 OID 51923)
-- Name: badges badges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (badge_name);


--
-- TOC entry 2771 (class 2606 OID 51928)
-- Name: badges_user_can_give badges_user_can_give_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.badges_user_can_give
    ADD CONSTRAINT badges_user_can_give_pkey PRIMARY KEY (user_id, badge_name);


--
-- TOC entry 2773 (class 2606 OID 51943)
-- Name: badges_user_has badges_user_has_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.badges_user_has
    ADD CONSTRAINT badges_user_has_pkey PRIMARY KEY (user_id, badge_name);


--
-- TOC entry 2777 (class 2606 OID 51975)
-- Name: card card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_pkey PRIMARY KEY (card_id);


--
-- TOC entry 2797 (class 2606 OID 52068)
-- Name: card_set card_set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_set
    ADD CONSTRAINT card_set_pkey PRIMARY KEY (card_id, set_id);


--
-- TOC entry 2787 (class 2606 OID 52020)
-- Name: card_subtype card_subtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_subtype
    ADD CONSTRAINT card_subtype_pkey PRIMARY KEY (card_id, subtype_id);


--
-- TOC entry 2793 (class 2606 OID 52045)
-- Name: card_type card_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_type
    ADD CONSTRAINT card_type_pkey PRIMARY KEY (card_id, type_id);


--
-- TOC entry 2781 (class 2606 OID 51995)
-- Name: collection_card collection_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_card
    ADD CONSTRAINT collection_card_pkey PRIMARY KEY (collection_id, card_id);


--
-- TOC entry 2779 (class 2606 OID 51984)
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (collection_id);


--
-- TOC entry 2775 (class 2606 OID 51960)
-- Name: friends friends_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY (from_user_id, to_user_id);


--
-- TOC entry 2767 (class 2606 OID 51913)
-- Name: users pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_user PRIMARY KEY (user_id);


--
-- TOC entry 2765 (class 2606 OID 51902)
-- Name: profile_pokemons profile_pokemons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_pokemons
    ADD CONSTRAINT profile_pokemons_pkey PRIMARY KEY (image_id);


--
-- TOC entry 2795 (class 2606 OID 52063)
-- Name: set set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.set
    ADD CONSTRAINT set_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 52015)
-- Name: subtype subtype_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtype
    ADD CONSTRAINT subtype_name_key UNIQUE (name);


--
-- TOC entry 2785 (class 2606 OID 52013)
-- Name: subtype subtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtype
    ADD CONSTRAINT subtype_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 52040)
-- Name: type type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_name_key UNIQUE (name);


--
-- TOC entry 2791 (class 2606 OID 52038)
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 51934)
-- Name: badges_user_can_give fk_badge_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.badges_user_can_give
    ADD CONSTRAINT fk_badge_name FOREIGN KEY (badge_name) REFERENCES public.badges(badge_name);


--
-- TOC entry 2802 (class 2606 OID 51949)
-- Name: badges_user_has fk_badge_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.badges_user_has
    ADD CONSTRAINT fk_badge_name FOREIGN KEY (badge_name) REFERENCES public.badges(badge_name);


--
-- TOC entry 2812 (class 2606 OID 52069)
-- Name: card_set fk_card_set_card_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_set
    ADD CONSTRAINT fk_card_set_card_id FOREIGN KEY (card_id) REFERENCES public.card(card_id);


--
-- TOC entry 2813 (class 2606 OID 52074)
-- Name: card_set fk_card_set_set_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_set
    ADD CONSTRAINT fk_card_set_set_id FOREIGN KEY (set_id) REFERENCES public.set(id);


--
-- TOC entry 2808 (class 2606 OID 52021)
-- Name: card_subtype fk_card_subtype_card_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_subtype
    ADD CONSTRAINT fk_card_subtype_card_id FOREIGN KEY (card_id) REFERENCES public.card(card_id);


--
-- TOC entry 2809 (class 2606 OID 52026)
-- Name: card_subtype fk_card_subtype_subtype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_subtype
    ADD CONSTRAINT fk_card_subtype_subtype_id FOREIGN KEY (subtype_id) REFERENCES public.subtype(id);


--
-- TOC entry 2810 (class 2606 OID 52046)
-- Name: card_type fk_card_type_card_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_type
    ADD CONSTRAINT fk_card_type_card_id FOREIGN KEY (card_id) REFERENCES public.card(card_id);


--
-- TOC entry 2811 (class 2606 OID 52051)
-- Name: card_type fk_card_type_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_type
    ADD CONSTRAINT fk_card_type_type_id FOREIGN KEY (type_id) REFERENCES public.type(id);


--
-- TOC entry 2807 (class 2606 OID 52001)
-- Name: collection_card fk_collection_card_card; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_card
    ADD CONSTRAINT fk_collection_card_card FOREIGN KEY (card_id) REFERENCES public.card(card_id);


--
-- TOC entry 2806 (class 2606 OID 51996)
-- Name: collection_card fk_collection_card_collection; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_card
    ADD CONSTRAINT fk_collection_card_collection FOREIGN KEY (collection_id) REFERENCES public.collection(collection_id);


--
-- TOC entry 2805 (class 2606 OID 51985)
-- Name: collection fk_collection_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT fk_collection_user FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 2803 (class 2606 OID 51961)
-- Name: friends fk_friends_from; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT fk_friends_from FOREIGN KEY (from_user_id) REFERENCES public.users(user_id);


--
-- TOC entry 2804 (class 2606 OID 51966)
-- Name: friends fk_friends_to; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT fk_friends_to FOREIGN KEY (to_user_id) REFERENCES public.users(user_id);


--
-- TOC entry 2799 (class 2606 OID 51929)
-- Name: badges_user_can_give fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.badges_user_can_give
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 2801 (class 2606 OID 51944)
-- Name: badges_user_has fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.badges_user_has
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 2798 (class 2606 OID 51914)
-- Name: users fk_users_profile_pokemons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_profile_pokemons FOREIGN KEY (profile_pokemon) REFERENCES public.profile_pokemons(image_id);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE badges; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.badges TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.badges TO card_collection_appuser;


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE badges_user_can_give; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.badges_user_can_give TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.badges_user_can_give TO card_collection_appuser;


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE badges_user_has; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.badges_user_has TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.badges_user_has TO card_collection_appuser;


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE card; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.card TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.card TO card_collection_appuser;


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE card_set; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.card_set TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.card_set TO card_collection_appuser;


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE card_subtype; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.card_subtype TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.card_subtype TO card_collection_appuser;


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE card_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.card_type TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.card_type TO card_collection_appuser;


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE collection; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.collection TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.collection TO card_collection_appuser;


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE collection_card; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.collection_card TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.collection_card TO card_collection_appuser;


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 211
-- Name: SEQUENCE collection_collection_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.collection_collection_id_seq TO card_collection_owner;
GRANT SELECT,USAGE ON SEQUENCE public.collection_collection_id_seq TO card_collection_appuser;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE friends; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.friends TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.friends TO card_collection_appuser;


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE profile_pokemons; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.profile_pokemons TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.profile_pokemons TO card_collection_appuser;


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 203
-- Name: SEQUENCE profile_pokemons_image_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.profile_pokemons_image_id_seq TO card_collection_owner;
GRANT SELECT,USAGE ON SEQUENCE public.profile_pokemons_image_id_seq TO card_collection_appuser;


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 202
-- Name: SEQUENCE seq_user_id; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.seq_user_id TO card_collection_owner;
GRANT SELECT,USAGE ON SEQUENCE public.seq_user_id TO card_collection_appuser;


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE set; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.set TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.set TO card_collection_appuser;


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE subtype; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subtype TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.subtype TO card_collection_appuser;


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 214
-- Name: SEQUENCE subtype_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.subtype_id_seq TO card_collection_owner;
GRANT SELECT,USAGE ON SEQUENCE public.subtype_id_seq TO card_collection_appuser;


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.type TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.type TO card_collection_appuser;


--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 217
-- Name: SEQUENCE type_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.type_id_seq TO card_collection_owner;
GRANT SELECT,USAGE ON SEQUENCE public.type_id_seq TO card_collection_appuser;


--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO card_collection_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.users TO card_collection_appuser;


-- Completed on 2023-02-09 14:35:11

--
-- PostgreSQL database dump complete
--

