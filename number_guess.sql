--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1747210033278', 2, 379);
INSERT INTO public.users VALUES (1, 'user_1747210033279', 5, 50);
INSERT INTO public.users VALUES (12, 'user_1747210266752', 2, 381);
INSERT INTO public.users VALUES (4, 'user_1747210073272', 2, 330);
INSERT INTO public.users VALUES (11, 'user_1747210266753', 5, 516);
INSERT INTO public.users VALUES (3, 'user_1747210073273', 5, 2);
INSERT INTO public.users VALUES (6, 'user_1747210141870', 2, 647);
INSERT INTO public.users VALUES (14, 'user_1747210377741', 2, 506);
INSERT INTO public.users VALUES (5, 'user_1747210141871', 5, 41);
INSERT INTO public.users VALUES (13, 'user_1747210377742', 5, 116);
INSERT INTO public.users VALUES (8, 'user_1747210169602', 2, 693);
INSERT INTO public.users VALUES (7, 'user_1747210169603', 5, 27);
INSERT INTO public.users VALUES (16, 'user_1747210526195', 2, 58);
INSERT INTO public.users VALUES (15, 'user_1747210526196', 5, 71);
INSERT INTO public.users VALUES (10, 'user_1747210231538', 2, 727);
INSERT INTO public.users VALUES (9, 'user_1747210231539', 5, 6);
INSERT INTO public.users VALUES (18, 'user_1747210627042', 2, 86);
INSERT INTO public.users VALUES (17, 'user_1747210627043', 5, 507);
INSERT INTO public.users VALUES (20, 'user_1747210711195', 2, 382);
INSERT INTO public.users VALUES (19, 'user_1747210711196', 5, 77);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: users username_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT username_unique UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

