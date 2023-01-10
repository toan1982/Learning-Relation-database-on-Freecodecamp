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
-- Name: records; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.records (
    record_id integer NOT NULL,
    user_id integer,
    played_times integer,
    number_of_guesses integer
);


ALTER TABLE public.records OWNER TO freecodecamp;

--
-- Name: records_record_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.records_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_record_id_seq OWNER TO freecodecamp;

--
-- Name: records_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.records_record_id_seq OWNED BY public.records.record_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22)
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
-- Name: records record_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.records ALTER COLUMN record_id SET DEFAULT nextval('public.records_record_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.records VALUES (114, 99, 1, 489);
INSERT INTO public.records VALUES (115, 99, 2, 394);
INSERT INTO public.records VALUES (116, 100, 1, 382);
INSERT INTO public.records VALUES (117, 100, 2, 93);
INSERT INTO public.records VALUES (118, 99, 3, 116);
INSERT INTO public.records VALUES (119, 99, 4, 973);
INSERT INTO public.records VALUES (120, 99, 5, 591);
INSERT INTO public.records VALUES (121, 101, 1, 371);
INSERT INTO public.records VALUES (122, 101, 2, 858);
INSERT INTO public.records VALUES (123, 102, 1, 214);
INSERT INTO public.records VALUES (124, 102, 2, 716);
INSERT INTO public.records VALUES (125, 101, 3, 705);
INSERT INTO public.records VALUES (126, 101, 4, 196);
INSERT INTO public.records VALUES (127, 101, 5, 299);
INSERT INTO public.records VALUES (128, 103, 1, 710);
INSERT INTO public.records VALUES (129, 103, 2, 181);
INSERT INTO public.records VALUES (130, 104, 1, 381);
INSERT INTO public.records VALUES (131, 104, 2, 427);
INSERT INTO public.records VALUES (132, 103, 3, 614);
INSERT INTO public.records VALUES (133, 103, 4, 454);
INSERT INTO public.records VALUES (134, 103, 5, 140);
INSERT INTO public.records VALUES (135, 105, 1, 311);
INSERT INTO public.records VALUES (136, 105, 2, 943);
INSERT INTO public.records VALUES (137, 106, 1, 133);
INSERT INTO public.records VALUES (138, 106, 2, 415);
INSERT INTO public.records VALUES (139, 105, 3, 669);
INSERT INTO public.records VALUES (140, 105, 4, 155);
INSERT INTO public.records VALUES (141, 105, 5, 404);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (99, 'user_1673333849908');
INSERT INTO public.users VALUES (100, 'user_1673333849907');
INSERT INTO public.users VALUES (101, 'user_1673333891259');
INSERT INTO public.users VALUES (102, 'user_1673333891258');
INSERT INTO public.users VALUES (103, 'user_1673333906939');
INSERT INTO public.users VALUES (104, 'user_1673333906938');
INSERT INTO public.users VALUES (105, 'user_1673334005453');
INSERT INTO public.users VALUES (106, 'user_1673334005452');


--
-- Name: records_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.records_record_id_seq', 141, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 106, true);


--
-- Name: records records_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (record_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: records records_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

