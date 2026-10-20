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

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.customers VALUES (6, '555-555-5555', 'Fabio');
INSERT INTO public.customers VALUES (12, '', 'Test');


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.services VALUES (1, 'cut');
INSERT INTO public.services VALUES (2, 'color');
INSERT INTO public.services VALUES (3, 'style');


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.appointments VALUES (1, 6, '10:30', 1);
INSERT INTO public.appointments VALUES (9, 12, 'Test', 1);
INSERT INTO public.appointments VALUES (10, 12, 'Test', 1);
INSERT INTO public.appointments VALUES (11, 12, 'Test', 1);
INSERT INTO public.appointments VALUES (13, 12, 'Test', 1);
INSERT INTO public.appointments VALUES (14, 12, '10:30', 2);
INSERT INTO public.appointments VALUES (15, 12, 'Test', 1);
INSERT INTO public.appointments VALUES (16, 12, 'Test', 1);
INSERT INTO public.appointments VALUES (17, 12, 'Test', 1);
INSERT INTO public.appointments VALUES (18, 12, 'Test', 1);
INSERT INTO public.appointments VALUES (20, 12, 'Test', 1);


--
-- Name: appointments_appointmen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.appointments_appointmen_id_seq', 26, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 17, true);


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.services_service_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

