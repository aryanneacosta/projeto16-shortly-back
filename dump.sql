--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(500) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    user_id integer NOT NULL,
    url text NOT NULL,
    short_url text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    email character varying(500) NOT NULL,
    password character varying(500) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: visit_count; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.visit_count (
    id integer NOT NULL,
    user_id integer NOT NULL,
    url_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: visit_count_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.visit_count_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: visit_count_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.visit_count_id_seq OWNED BY public.visit_count.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visit_count id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visit_count ALTER COLUMN id SET DEFAULT nextval('public.visit_count_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (16, 1, 'ca3e9557-dd48-4990-9b7e-b057180c3edf', '2022-10-13 13:12:39.805243');
INSERT INTO public.sessions VALUES (17, 1, '7c9f2101-a93c-4526-905b-037a189ef192', '2022-10-13 13:12:56.660282');
INSERT INTO public.sessions VALUES (18, 1, 'b23281b9-5fa0-41ce-9c49-fbfa26815b50', '2022-10-13 13:19:26.635632');
INSERT INTO public.sessions VALUES (19, 1, 'e0ba710b-b10f-4c1f-b5a6-c290193038e1', '2022-10-13 13:20:58.548075');
INSERT INTO public.sessions VALUES (20, 2, 'd79b2081-6af0-4e5b-ac3e-8298e6f046eb', '2022-10-14 16:15:03.300762');
INSERT INTO public.sessions VALUES (21, 3, '51f7e7ab-394c-4cb5-985c-a8dfdee25d05', '2022-10-16 14:52:00.221614');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (2, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', 'f20A1JoYXvUQ6G5aTYn83', '2022-10-13 15:59:14.562021');
INSERT INTO public.urls VALUES (3, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', '8ozmTe_nGzqbPZFRbB2YD', '2022-10-13 16:00:06.951499');
INSERT INTO public.urls VALUES (4, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', 'PHBUvjzUtTTYDMAjstXHh', '2022-10-13 16:07:04.485726');
INSERT INTO public.urls VALUES (5, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', 'btZQKtLXj53leVCqjR3Fx', '2022-10-13 16:08:23.384322');
INSERT INTO public.urls VALUES (6, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', '7VCQoJdmnKQg948IvVJHT', '2022-10-13 16:09:17.475032');
INSERT INTO public.urls VALUES (7, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', 'WcWZrIylGvt0B23Xdtxgq', '2022-10-13 16:09:43.989125');
INSERT INTO public.urls VALUES (8, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', 'qUyosPKktW7O6MAtESdZp', '2022-10-13 16:10:08.325721');
INSERT INTO public.urls VALUES (9, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', 'SLlydt54NzCOLmm1aMjFQ', '2022-10-13 16:10:29.263182');
INSERT INTO public.urls VALUES (10, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', 'eV27Qad9P2xyZvq3KiZaa', '2022-10-13 16:10:40.337826');
INSERT INTO public.urls VALUES (11, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', '4XD0gvCnML4bs60Xe4T1Y', '2022-10-13 16:10:50.420087');
INSERT INTO public.urls VALUES (12, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', 'RQuZfPbDLsVbDP3v6oBGc', '2022-10-13 16:11:04.295116');
INSERT INTO public.urls VALUES (13, 1, 'https://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', 'vs-QpGElp_H-xQ6MxMP8n', '2022-10-13 16:11:38.791491');
INSERT INTO public.urls VALUES (14, 1, '//stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', '9OVU0FkO3o_Ebe46WjqUc', '2022-10-13 16:14:27.447891');
INSERT INTO public.urls VALUES (15, 1, '//stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', '_MzHERA7LuoqOe9Gi-Fpb', '2022-10-13 16:15:22.651837');
INSERT INTO public.urls VALUES (16, 1, 'http://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url', 'NAWOn9tYmrOJUS4IbNYoL', '2022-10-13 16:16:16.753204');
INSERT INTO public.urls VALUES (17, 2, 'https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-insert/', 'GIwnT66K_kI31WopTWQd2', '2022-10-14 19:33:10.003688');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao@driven.com.br', '$2b$10$pWE0V2lty2t73zOn1FmCM.i6iDQsd1Onn1sHHlsDFbQR81h06C8Ia', '2022-10-13 12:45:13.67059');
INSERT INTO public.users VALUES (2, 'Areia', 'areia@driven.com.br', '$2b$10$0d.ZjrlbeSWFPXI6qJpK7eGUBQkcEgzjxhpLr1TmZKAQ.HI73uLCu', '2022-10-14 16:14:11.345273');
INSERT INTO public.users VALUES (3, 'João', 'maria@driven.com.br', '$2b$10$hQA/w08y1SC.C51g8vytnOsoU448KRj2Pa28DIziPLE754xJkL/y.', '2022-10-14 20:06:13.552559');


--
-- Data for Name: visit_count; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.visit_count VALUES (1, 2, 17, '2022-10-17 14:02:10.713166');
INSERT INTO public.visit_count VALUES (2, 1, 15, '2022-10-17 14:02:52.607787');
INSERT INTO public.visit_count VALUES (3, 1, 15, '2022-10-17 14:03:03.936537');
INSERT INTO public.visit_count VALUES (4, 1, 15, '2022-10-17 14:03:11.915383');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 21, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 19, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: visit_count_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.visit_count_id_seq', 4, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visit_count visit_count_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visit_count
    ADD CONSTRAINT visit_count_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: urls urls_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: visit_count visit_count_url_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visit_count
    ADD CONSTRAINT visit_count_url_id_fkey FOREIGN KEY (url_id) REFERENCES public.urls(id);


--
-- Name: visit_count visit_count_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visit_count
    ADD CONSTRAINT visit_count_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

