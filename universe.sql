--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30),
    rank integer NOT NULL,
    distance_mly numeric(5,3),
    notes text
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
    name character varying(30),
    label character varying(30) NOT NULL,
    planet_id integer,
    has_life boolean
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
-- Name: ovni; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ovni (
    ovni_id integer NOT NULL,
    name character varying(30),
    fake boolean NOT NULL
);


ALTER TABLE public.ovni OWNER TO freecodecamp;

--
-- Name: ovni_ovni_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ovni_ovni_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ovni_ovni_id_seq OWNER TO freecodecamp;

--
-- Name: ovni_ovni_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ovni_ovni_id_seq OWNED BY public.ovni.ovni_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    diameter_km integer,
    has_moons boolean,
    star_id integer NOT NULL
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
    star_id integer NOT NULL,
    name character varying(30),
    size_sun integer NOT NULL,
    distance_from_earth_ly integer NOT NULL,
    still_alive boolean,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: ovni ovni_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ovni ALTER COLUMN ovni_id SET DEFAULT nextval('public.ovni_ovni_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 1, 0.000, 'This is the galaxy containing the Sun');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 2, 0.025, NULL);
INSERT INTO public.galaxy VALUES (3, 'Virgo Stellar Stream', 3, 0.030, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sagittarius Dwarf Elliptical', 4, 0.081, NULL);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 5, 0.163, NULL);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 6, 0.197, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Metis', 'XVI', 5, false);
INSERT INTO public.moon VALUES (2, 'Adrastea', 'XV', 5, false);
INSERT INTO public.moon VALUES (3, 'Amalthea', 'V', 5, false);
INSERT INTO public.moon VALUES (4, 'Thebe', 'XIV', 5, false);
INSERT INTO public.moon VALUES (5, 'Io', 'I', 5, false);
INSERT INTO public.moon VALUES (6, 'Europa', 'II', 5, false);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'III', 5, false);
INSERT INTO public.moon VALUES (8, 'Callisto', 'IV', 5, false);
INSERT INTO public.moon VALUES (9, 'Themisto', 'XVIII', 5, false);
INSERT INTO public.moon VALUES (10, 'Leda', 'XIII', 5, false);
INSERT INTO public.moon VALUES (11, 'Ersa', 'LXXI', 5, false);
INSERT INTO public.moon VALUES (12, 'Himalia', 'VI', 5, false);
INSERT INTO public.moon VALUES (13, 'Pandia', 'LXV', 5, false);
INSERT INTO public.moon VALUES (14, 'Lysithea', 'X', 5, false);
INSERT INTO public.moon VALUES (15, 'Elara', 'VII', 5, false);
INSERT INTO public.moon VALUES (16, 'Dia', 'LIII', 5, false);
INSERT INTO public.moon VALUES (17, 'Carpo', 'XLVI', 5, false);
INSERT INTO public.moon VALUES (18, 'Valetudo', 'LXII', 5, false);
INSERT INTO public.moon VALUES (19, 'Euporie', 'XXXIV', 5, false);
INSERT INTO public.moon VALUES (20, 'S/2003 J 18', 'LV', 5, false);
INSERT INTO public.moon VALUES (21, 'Eupheme', 'LX', 5, false);


--
-- Data for Name: ovni; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ovni VALUES (1, 'New México', false);
INSERT INTO public.ovni VALUES (2, 'California', false);
INSERT INTO public.ovni VALUES (3, 'Honduras', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, false, 7);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, false, 7);
INSERT INTO public.planet VALUES (3, 'Earth', 12760, true, 7);
INSERT INTO public.planet VALUES (4, 'Mars', 6787, true, 7);
INSERT INTO public.planet VALUES (5, 'Jupitter', 428400, true, 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 120500, true, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 51120, true, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 49530, true, 7);
INSERT INTO public.planet VALUES (9, 'b', NULL, false, 8);
INSERT INTO public.planet VALUES (10, 'g', NULL, false, 8);
INSERT INTO public.planet VALUES (11, 'c', NULL, false, 8);
INSERT INTO public.planet VALUES (12, 'h', NULL, false, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Antares', 883, 550, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 887, 643, true, 1);
INSERT INTO public.star VALUES (3, 'KW Sagittarii', 1009, 7800, true, 1);
INSERT INTO public.star VALUES (4, 'VV Cephei A', 1050, 4900, true, 1);
INSERT INTO public.star VALUES (5, 'Mu Cephei', 1260, 6000, true, 1);
INSERT INTO public.star VALUES (6, 'KY Cygni', 2850, 5000, true, 1);
INSERT INTO public.star VALUES (7, 'Sun', 1, 0, true, 1);
INSERT INTO public.star VALUES (8, 'Tau Ceti', 1, 12, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: ovni_ovni_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ovni_ovni_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: ovni ovni_ovni_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ovni
    ADD CONSTRAINT ovni_ovni_id_key UNIQUE (ovni_id);


--
-- Name: ovni ovni_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ovni
    ADD CONSTRAINT ovni_pkey PRIMARY KEY (ovni_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
