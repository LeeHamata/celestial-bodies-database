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
-- Name: ecosystem; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ecosystem (
    name character varying(30) NOT NULL,
    ecosystem_id integer NOT NULL,
    type text NOT NULL,
    age_in_million_of_years integer,
    planet_id integer
);


ALTER TABLE public.ecosystem OWNER TO freecodecamp;

--
-- Name: ecosystem_ecosystem_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ecosystem_ecosystem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ecosystem_ecosystem_id_seq OWNER TO freecodecamp;

--
-- Name: ecosystem_ecosystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ecosystem_ecosystem_id_seq OWNED BY public.ecosystem.ecosystem_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_million_of_years integer,
    planets_types text
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    moon_type text NOT NULL,
    distance_from_earth numeric,
    age_in_million_of_years integer,
    planet_id integer
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
    name character varying(30) NOT NULL,
    planet_type text NOT NULL,
    distance_from_earth numeric,
    age_in_million_of_years integer,
    planet_id integer NOT NULL,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    galaxy_id integer
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
-- Name: ecosystem ecosystem_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ecosystem ALTER COLUMN ecosystem_id SET DEFAULT nextval('public.ecosystem_ecosystem_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: ecosystem; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ecosystem VALUES ('Amazon Rainforest', 1, 'Tropical Forest', 55, 3);
INSERT INTO public.ecosystem VALUES ('Great Barrier Reef', 2, 'Marine', 20, 3);
INSERT INTO public.ecosystem VALUES ('Hypothetical Europa Ocean', 3, 'Subsurface Ocean', 4000, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Via Lactea', 1, 'Its a galaxy with 400,000 millions of stars', true, true, 13500, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Its a galaxy with 1 billion of stars', false, true, 4000, NULL);
INSERT INTO public.galaxy VALUES ('The triangule', 3, 'Its a galaxy with 10 billion of stars', false, true, 2000000, NULL);
INSERT INTO public.galaxy VALUES ('Sombrero', 4, 'Its a very bright core and dark', false, true, 13000000, NULL);
INSERT INTO public.galaxy VALUES ('Whirpool', 5, 'Know for its well-defiend spiral arms', false, true, 400, NULL);
INSERT INTO public.galaxy VALUES ('Sculptor', 6, 'A bright galaxy with intense star formation', false, true, 100000000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 'Rocky', 0.384, 4500, 3);
INSERT INTO public.moon VALUES ('Phobos', 2, 'Rocky', 225, 4500, 4);
INSERT INTO public.moon VALUES ('Deimos', 3, 'Rocky', 225, 4500, 4);
INSERT INTO public.moon VALUES ('Io', 4, 'Volcanic', 628, 4500, 5);
INSERT INTO public.moon VALUES ('Europa', 5, 'Icy', 628, 4500, 5);
INSERT INTO public.moon VALUES ('Ganymede', 6, 'Rocky/Icy', 628, 4500, 5);
INSERT INTO public.moon VALUES ('Callisto', 7, 'Rocky/Icy', 628, 4500, 5);
INSERT INTO public.moon VALUES ('Titan', 8, 'Icy', 1275, 4500, 6);
INSERT INTO public.moon VALUES ('Enceladus', 9, 'Icy', 1275, 4500, 6);
INSERT INTO public.moon VALUES ('Mimas', 10, 'Rocky/Icy', 1275, 4500, 6);
INSERT INTO public.moon VALUES ('Triton', 11, 'Icy', 4351, 4500, 8);
INSERT INTO public.moon VALUES ('Nereid', 12, 'Icy', 4351, 4500, 8);
INSERT INTO public.moon VALUES ('Charon', 13, 'Rocky/Icy', 5900, 4500, 9);
INSERT INTO public.moon VALUES ('Styx', 14, 'Icy', 5900, 4500, 9);
INSERT INTO public.moon VALUES ('Kerberos', 15, 'Icy', 5900, 4500, 9);
INSERT INTO public.moon VALUES ('Hydra', 16, 'Icy', 5900, 4500, 9);
INSERT INTO public.moon VALUES ('Kepler-1625b I', 17, 'Exomoon', 800000, 4000, 10);
INSERT INTO public.moon VALUES ('Pandora', 18, 'Rocky', 1275, 4500, 6);
INSERT INTO public.moon VALUES ('Hyperion', 19, 'Rocky/Icy', 1275, 4500, 6);
INSERT INTO public.moon VALUES ('Oberon', 20, 'Icy', 2724, 4500, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 'Terrestrial', 77, 4500, 1, 1);
INSERT INTO public.planet VALUES ('Venus', 'Terrestrial', 261, 4500, 2, 1);
INSERT INTO public.planet VALUES ('Earth', 'Terrestrial', 0, 4500, 3, 1);
INSERT INTO public.planet VALUES ('Mars', 'Terrestrial', 225, 4500, 4, 1);
INSERT INTO public.planet VALUES ('Jupiter', 'Gas Giant', 628, 4500, 5, 1);
INSERT INTO public.planet VALUES ('Saturn', 'Gas Giant', 1275, 4500, 6, 1);
INSERT INTO public.planet VALUES ('Uranus', 'Ice Giant', 2724, 4500, 7, 1);
INSERT INTO public.planet VALUES ('Neptune', 'Ice Giant', 4351, 4500, 8, 1);
INSERT INTO public.planet VALUES ('Kepler-22b', 'Exoplanet', 600000, 4000, 9, 2);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 'Exoplanet', 40100, 4850, 10, 5);
INSERT INTO public.planet VALUES ('HD 209458 b', 'Gas Giant', 159000, 4000, 11, 3);
INSERT INTO public.planet VALUES ('Gliese 581 c', 'Exoplanet', 200000, 7000, 12, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 'Is a star at the center of our solar system', 3000000, 149000000, 1);
INSERT INTO public.star VALUES ('Sirius', 2, 'Is the brightest star in the night', 200, 8, 2);
INSERT INTO public.star VALUES ('Betelgeuse', 3, 'Is a masive red supergiant star', 10, 642, 3);
INSERT INTO public.star VALUES ('Rigel', 4, 'Is a very luminus blue supergiant star', 8, 860, 4);
INSERT INTO public.star VALUES ('Proxima centauri', 5, 'Is a small red dwarf star', 4, 24, 5);
INSERT INTO public.star VALUES ('Vega', 6, 'Is a one of the brightest stars', 455, 25, 6);


--
-- Name: ecosystem_ecosystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ecosystem_ecosystem_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: ecosystem ecosystem_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ecosystem
    ADD CONSTRAINT ecosystem_name_key UNIQUE (name);


--
-- Name: ecosystem ecosystem_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ecosystem
    ADD CONSTRAINT ecosystem_pkey PRIMARY KEY (ecosystem_id);


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
-- Name: ecosystem ecosystem_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ecosystem
    ADD CONSTRAINT ecosystem_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

