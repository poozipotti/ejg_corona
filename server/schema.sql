--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)

-- Started on 2020-04-26 15:04:05 EDT

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
-- TOC entry 204 (class 1259 OID 24635)
-- Name: Picture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Picture" (
    id text NOT NULL,
    name text,
    "Report" text
);


ALTER TABLE public."Picture" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24622)
-- Name: Report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Report" (
    id text NOT NULL,
    name text,
    descriptions text,
    "User" text
);


ALTER TABLE public."Report" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24648)
-- Name: Service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Service" (
    id text NOT NULL,
    name text,
    description text,
    "Report" text
);


ALTER TABLE public."Service" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24614)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    username text,
    password text,
    email text
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 2796 (class 2606 OID 24642)
-- Name: Picture Picture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Picture"
    ADD CONSTRAINT "Picture_pkey" PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 24629)
-- Name: Report Report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Report"
    ADD CONSTRAINT "Report_pkey" PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 24655)
-- Name: Service Service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Service"
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 24621)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 24643)
-- Name: Picture Report; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Picture"
    ADD CONSTRAINT "Report" FOREIGN KEY ("Report") REFERENCES public."Report"(id);


--
-- TOC entry 2801 (class 2606 OID 24656)
-- Name: Service Report; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Service"
    ADD CONSTRAINT "Report" FOREIGN KEY (id) REFERENCES public."Report"(id);


--
-- TOC entry 2799 (class 2606 OID 24630)
-- Name: Report User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Report"
    ADD CONSTRAINT "User" FOREIGN KEY ("User") REFERENCES public."User"(id);


-- Completed on 2020-04-26 15:04:05 EDT

--
-- PostgreSQL database dump complete
--

