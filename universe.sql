--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_types character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,2),
    description text,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer,
    is_spherical boolean,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_type_id integer NOT NULL,
    diameter_in_km integer,
    distance_from_star_in_au numeric(8,4),
    has_life boolean,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(14,4),
    is_spherical boolean,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, 'Galaksi tempat Tata Surya berada', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.54, 'Galaksi spiral besar terdekat dengan Bima Sakti', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000, 2.73, 'Galaksi spiral terbesar ketiga di Grup Lokal', false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 13000, 0.16, 'Galaksi satelit Bima Sakti', false);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Elliptical', 13000, 53.50, 'Galaksi elips raksasa dengan lubang hitam supermasif', false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 13000, 29.30, 'Galaksi dengan tonjolan pusat yang besar', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, true, 'Satu-satunya satelit alami Bumi');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, 'Bulan Mars yang lebih besar');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, 'Bulan Mars yang lebih kecil');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, true, 'Benda paling aktif secara vulkanik di Tata Surya');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, true, 'Diduga punya lautan di bawah es');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, true, 'Bulan terbesar di Tata Surya');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, true, 'Permukaannya penuh kawah');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, true, 'Bulan Saturnus dengan atmosfer tebal');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, true, 'Menyemburkan gumpalan es dari kutub selatan');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, true, 'Punya kawah besar bernama Herschel');
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1123, true, 'Bulan Saturnus yang berbatu dan beres');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1527, true, 'Bulan Saturnus terbesar kedua');
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1062, true, 'Hampir seluruhnya tersusun dari es air');
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1469, true, 'Punya dua sisi dengan warna berbeda');
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1578, true, 'Bulan Uranus terbesar');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1523, true, 'Bulan Uranus terbesar kedua');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1169, true, 'Bulan Uranus dengan permukaan gelap');
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1158, true, 'Bulan Uranus dengan permukaan cerah');
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 472, true, 'Bulan Uranus dengan medan yang sangat beragam');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, true, 'Bulan Neptunus yang mengorbit berlawanan arah');
INSERT INTO public.moon VALUES (21, 'Proteus', 8, 420, false, 'Bulan Neptunus berbentuk tidak beraturan');
INSERT INTO public.moon VALUES (22, 'Charon', 10, 1212, true, 'Bulan terbesar Pluto');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, 4879, 0.3870, false, 'Planet terdekat dari Matahari');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, 12104, 0.7230, false, 'Planet terpanas di Tata Surya');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 12742, 1.0000, true, 'Satu-satunya planet yang diketahui berpenghuni');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, 6779, 1.5240, false, 'Dijuluki planet merah');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, 139820, 5.2030, false, 'Planet terbesar di Tata Surya');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, 116460, 9.5370, false, 'Terkenal dengan sistem cincinnya');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, 50724, 19.1910, false, 'Berputar miring pada sumbunya');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, 49244, 30.0690, false, 'Planet terjauh dari Matahari');
INSERT INTO public.planet VALUES (9, 'Ceres', 1, 4, 940, 2.7700, false, 'Dwarf planet di sabuk asteroid');
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 4, 2377, 39.4800, false, 'Dwarf planet di sabuk Kuiper');
INSERT INTO public.planet VALUES (11, 'Eris', 1, 4, 2326, 67.8000, false, 'Dwarf planet di piringan tersebar');
INSERT INTO public.planet VALUES (12, 'Proxima b', 3, 1, NULL, 0.0485, false, 'Eksoplanet di zona layak huni Proxima Centauri');


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Planet berbatu dengan permukaan padat');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Planet raksasa yang sebagian besar tersusun dari hidrogen dan helium');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planet raksasa dengan banyak es air, amonia, dan metana');
INSERT INTO public.planet_type VALUES (4, 'Dwarf Planet', 'Benda langit bulat yang belum membersihkan orbitnya');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 0.0000, true, 'Bintang pusat Tata Surya');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, 8.6000, true, 'Bintang paling terang di langit malam');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 4850, 4.2400, true, 'Bintang terdekat dari Matahari');
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 5300, 4.3700, true, 'Bintang utama sistem Alpha Centauri');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 10, 548.0000, true, 'Bintang raksasa merah di rasi Orion');
INSERT INTO public.star VALUES (6, 'Vega', 1, 455, 25.0000, true, 'Bintang terang di rasi Lyra');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

