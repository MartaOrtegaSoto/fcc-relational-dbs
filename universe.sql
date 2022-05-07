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
    name character varying(30) NOT NULL,
    description text,
    number_of_stars_in_millions integer,
    shape_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    is_spherical boolean
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_rings boolean,
    diameter_in_km numeric(10,1),
    number_of_moons integer
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
-- Name: shape; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.shape (
    shape_id integer NOT NULL,
    name character varying(30) NOT NULL,
    resembles_to character varying(30) NOT NULL
);


ALTER TABLE public.shape OWNER TO freecodecamp;

--
-- Name: shapes_shape_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.shapes_shape_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shapes_shape_id_seq OWNER TO freecodecamp;

--
-- Name: shapes_shape_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.shapes_shape_id_seq OWNED BY public.shape.shape_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer
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
-- Name: shape shape_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.shape ALTER COLUMN shape_id SET DEFAULT nextval('public.shapes_shape_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way galaxy', 2000, 2);
INSERT INTO public.galaxy VALUES (2, 'Messier 82', 'The Messier 82 galaxy', 500, 3);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'The Andromeda galaxy', 12000, 1);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'The Large Magellanic Cloud galaxy', 1000, 3);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'The Black Eye galaxy', 50000, 1);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'The Whirlpool galaxy', 750, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'moon', true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'moon', true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'mooon', true);
INSERT INTO public.moon VALUES (4, 'Io', 6, 'moon', true);
INSERT INTO public.moon VALUES (5, 'Europa', 6, 'moon', true);
INSERT INTO public.moon VALUES (6, 'Callisto', 6, 'moon', true);
INSERT INTO public.moon VALUES (7, 'Gyanmede', 6, 'moon', true);
INSERT INTO public.moon VALUES (8, 'Mimas', 7, 'moon', true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 7, 'moon', true);
INSERT INTO public.moon VALUES (10, 'Tethys', 7, 'moon', true);
INSERT INTO public.moon VALUES (11, 'Dione', 7, 'moon', true);
INSERT INTO public.moon VALUES (12, 'Rhea', 7, 'moon', true);
INSERT INTO public.moon VALUES (13, 'Titan', 7, 'moon', true);
INSERT INTO public.moon VALUES (14, 'Iapetus', 7, 'moon', true);
INSERT INTO public.moon VALUES (15, 'Miranda', 8, 'moon', true);
INSERT INTO public.moon VALUES (16, 'Ariel', 8, 'moon', true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 8, 'moon', true);
INSERT INTO public.moon VALUES (18, 'Titania', 8, 'moon', true);
INSERT INTO public.moon VALUES (19, 'Oberon', 8, 'moon', true);
INSERT INTO public.moon VALUES (20, 'Triton', 9, 'moon', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Planet Mercury', false, 4879.4, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Planet Venus', false, 12104.0, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Planet Earth', false, 12742.6, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Planet Mars', false, 6779.0, 2);
INSERT INTO public.planet VALUES (5, 'Ceres', 1, 'Planet Ceres', true, 2367.7, 0);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1, 'Planet Jupiter', false, 139820.0, 79);
INSERT INTO public.planet VALUES (7, 'Saturn', 1, 'Planet Saturn', true, 116460.0, 82);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 'Planet Uranus', false, 50724.0, 27);
INSERT INTO public.planet VALUES (9, 'Neptune', 1, 'Planet Neptune', false, 49244.0, 14);
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 'Planet Pluto', false, 2376.6, 0);
INSERT INTO public.planet VALUES (11, 'Charon', 1, 'Planet Charon', false, 1212.0, 0);
INSERT INTO public.planet VALUES (12, 'Eris', 1, 'Planet Eris', false, 2326.0, 0);


--
-- Data for Name: shape; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.shape VALUES (1, 'Elliptical', 'egg');
INSERT INTO public.shape VALUES (2, 'Spiral', 'snail shell');
INSERT INTO public.shape VALUES (3, 'Irregular', 'Anything');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The Sun star', 54);
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 3, 'The VY Canis Majoris star', 155);
INSERT INTO public.star VALUES (3, 'UY Scuti', 1, 'The UY Scuti star', 1234);
INSERT INTO public.star VALUES (4, 'Rigel', 5, 'The Rigel star', 345);
INSERT INTO public.star VALUES (5, 'AH Scorpii', 4, 'The AH Scorpii Star', 874);
INSERT INTO public.star VALUES (6, 'Westerlund 1-26', 1, 'The Westerlun 1-26 star', 11343);
INSERT INTO public.star VALUES (7, 'Antares', 3, 'The Antares star', 66);


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
-- Name: shapes_shape_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.shapes_shape_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: shape shapes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.shape
    ADD CONSTRAINT shapes_name_key UNIQUE (name);


--
-- Name: shape shapes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.shape
    ADD CONSTRAINT shapes_pkey PRIMARY KEY (shape_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy fk_shape; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_shape FOREIGN KEY (shape_id) REFERENCES public.shape(shape_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

