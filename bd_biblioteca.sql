--
-- PostgreSQL database cluster dump
--

-- Started on 2023-07-02 18:38:50

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Debian 12.15-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-07-02 18:38:50

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

-- Completed on 2023-07-02 18:38:50

--
-- PostgreSQL database dump complete
--

--
-- Database "bd_biblioteca" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Debian 12.15-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-07-02 18:38:50

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
-- TOC entry 3061 (class 1262 OID 16683)
-- Name: bd_biblioteca; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bd_biblioteca WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE bd_biblioteca OWNER TO postgres;

\connect bd_biblioteca

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
-- TOC entry 202 (class 1259 OID 16684)
-- Name: autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autores (
    aut_codigo integer NOT NULL,
    aut_nombre character varying,
    aut_foto bytea,
    aut_ciudad integer
);


ALTER TABLE public.autores OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16690)
-- Name: autores_aut_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autores_aut_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autores_aut_codigo_seq OWNER TO postgres;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 203
-- Name: autores_aut_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autores_aut_codigo_seq OWNED BY public.autores.aut_codigo;


--
-- TOC entry 204 (class 1259 OID 16692)
-- Name: ciudades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudades (
    ciu_codigo integer NOT NULL,
    ciu_descripcion character varying
);


ALTER TABLE public.ciudades OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16698)
-- Name: ciudades_ciu_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ciudades_ciu_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudades_ciu_codigo_seq OWNER TO postgres;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 205
-- Name: ciudades_ciu_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ciudades_ciu_codigo_seq OWNED BY public.ciudades.ciu_codigo;


--
-- TOC entry 206 (class 1259 OID 16700)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    cli_codigo integer NOT NULL,
    cli_nombre character varying,
    cli_ciudad integer,
    cli_direccion character varying,
    cli_obs character varying,
    cli_foto bytea
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16706)
-- Name: clientes_cli_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_cli_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_cli_codigo_seq OWNER TO postgres;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 207
-- Name: clientes_cli_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_cli_codigo_seq OWNED BY public.clientes.cli_codigo;


--
-- TOC entry 208 (class 1259 OID 16708)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    lib_codigo integer NOT NULL,
    lib_descripcion character varying,
    lib_cantidad integer,
    lib_obs character varying,
    lib_tipo integer
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16714)
-- Name: libros_autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros_autores (
    lau_libro integer NOT NULL,
    lau_autor integer NOT NULL
);


ALTER TABLE public.libros_autores OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16717)
-- Name: libros_lib_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_lib_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libros_lib_codigo_seq OWNER TO postgres;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 210
-- Name: libros_lib_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_lib_codigo_seq OWNED BY public.libros.lib_codigo;


--
-- TOC entry 218 (class 1259 OID 65694)
-- Name: libros_tipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros_tipos (
    lit_codigo integer NOT NULL,
    lit_descripcion character varying(255) NOT NULL
);


ALTER TABLE public.libros_tipos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 65692)
-- Name: libros_tipos_lit_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_tipos_lit_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libros_tipos_lit_codigo_seq OWNER TO postgres;

--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 217
-- Name: libros_tipos_lit_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_tipos_lit_codigo_seq OWNED BY public.libros_tipos.lit_codigo;


--
-- TOC entry 211 (class 1259 OID 16719)
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos (
    pre_numero integer NOT NULL,
    pre_fecha date,
    pre_cliente integer,
    pre_observacion character varying,
    pre_situacion character varying,
    pre_usuario integer,
    pre_total double precision,
    pli_prestamo integer
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16725)
-- Name: prestamos_libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos_libros (
    pli_secuencia integer NOT NULL,
    pli_prestamo integer,
    pli_libro integer,
    pli_estado integer,
    pli_dias integer,
    pli_valor double precision,
    pli_fecha_devolucion date
);


ALTER TABLE public.prestamos_libros OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16728)
-- Name: prestamos_libros_pli_secuencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestamos_libros_pli_secuencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prestamos_libros_pli_secuencia_seq OWNER TO postgres;

--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 213
-- Name: prestamos_libros_pli_secuencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestamos_libros_pli_secuencia_seq OWNED BY public.prestamos_libros.pli_secuencia;


--
-- TOC entry 214 (class 1259 OID 16730)
-- Name: prestamos_pre_numero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestamos_pre_numero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prestamos_pre_numero_seq OWNER TO postgres;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 214
-- Name: prestamos_pre_numero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestamos_pre_numero_seq OWNED BY public.prestamos.pre_numero;


--
-- TOC entry 215 (class 1259 OID 16732)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    usu_codigo integer NOT NULL,
    usu_username character varying,
    usu_password character varying
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16738)
-- Name: usuarios_usu_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_usu_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_usu_codigo_seq OWNER TO postgres;

--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 216
-- Name: usuarios_usu_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_usu_codigo_seq OWNED BY public.usuarios.usu_codigo;


--
-- TOC entry 2879 (class 2604 OID 16740)
-- Name: autores aut_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores ALTER COLUMN aut_codigo SET DEFAULT nextval('public.autores_aut_codigo_seq'::regclass);


--
-- TOC entry 2880 (class 2604 OID 16741)
-- Name: ciudades ciu_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades ALTER COLUMN ciu_codigo SET DEFAULT nextval('public.ciudades_ciu_codigo_seq'::regclass);


--
-- TOC entry 2881 (class 2604 OID 16742)
-- Name: clientes cli_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN cli_codigo SET DEFAULT nextval('public.clientes_cli_codigo_seq'::regclass);


--
-- TOC entry 2882 (class 2604 OID 16743)
-- Name: libros lib_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros ALTER COLUMN lib_codigo SET DEFAULT nextval('public.libros_lib_codigo_seq'::regclass);


--
-- TOC entry 2886 (class 2604 OID 65697)
-- Name: libros_tipos lit_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_tipos ALTER COLUMN lit_codigo SET DEFAULT nextval('public.libros_tipos_lit_codigo_seq'::regclass);


--
-- TOC entry 2883 (class 2604 OID 16744)
-- Name: prestamos pre_numero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos ALTER COLUMN pre_numero SET DEFAULT nextval('public.prestamos_pre_numero_seq'::regclass);


--
-- TOC entry 2884 (class 2604 OID 16745)
-- Name: prestamos_libros pli_secuencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos_libros ALTER COLUMN pli_secuencia SET DEFAULT nextval('public.prestamos_libros_pli_secuencia_seq'::regclass);


--
-- TOC entry 2885 (class 2604 OID 16746)
-- Name: usuarios usu_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN usu_codigo SET DEFAULT nextval('public.usuarios_usu_codigo_seq'::regclass);


--
-- TOC entry 3039 (class 0 OID 16684)
-- Dependencies: 202
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autores (aut_codigo, aut_nombre, aut_foto, aut_ciudad) FROM stdin;
1	Autor 1	\N	1
2	Autor 2	\N	2
3	Autor 3	\N	1
4	Autor 4	\N	3
\.


--
-- TOC entry 3041 (class 0 OID 16692)
-- Dependencies: 204
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ciudades (ciu_codigo, ciu_descripcion) FROM stdin;
10	cde
6	Ciudad 6
1	Ciudad 1
2	Ciudad 2
3	Ciudad 3
\.


--
-- TOC entry 3043 (class 0 OID 16700)
-- Dependencies: 206
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (cli_codigo, cli_nombre, cli_ciudad, cli_direccion, cli_obs, cli_foto) FROM stdin;
4	juan	\N	\N	\N	\N
5	jose	10	san jose	ooooooooo	\N
1	Cliente 1	1	Dirección 1	Observación 1	\N
2	Cliente 2	2	Dirección 2	Observación 2	\N
3	Cliente 3	1	Dirección 3	Observación 3	\N
6	Cliente 4	3	Dirección 4	Observación 4	\N
\.


--
-- TOC entry 3045 (class 0 OID 16708)
-- Dependencies: 208
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (lib_codigo, lib_descripcion, lib_cantidad, lib_obs, lib_tipo) FROM stdin;
1	Libro 1	5	Observación 1	1
2	Libro 2	3	Observación 2	2
3	Libro 3	2	Observación 3	1
4	Libro 4	7	Observación 4	3
\.


--
-- TOC entry 3046 (class 0 OID 16714)
-- Dependencies: 209
-- Data for Name: libros_autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros_autores (lau_libro, lau_autor) FROM stdin;
1	1
1	2
2	2
3	3
3	4
4	1
4	3
\.


--
-- TOC entry 3055 (class 0 OID 65694)
-- Dependencies: 218
-- Data for Name: libros_tipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros_tipos (lit_codigo, lit_descripcion) FROM stdin;
1	Tipo 1
2	Tipo 2
3	Tipo 3
\.


--
-- TOC entry 3048 (class 0 OID 16719)
-- Dependencies: 211
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestamos (pre_numero, pre_fecha, pre_cliente, pre_observacion, pre_situacion, pre_usuario, pre_total, pli_prestamo) FROM stdin;
3	2023-06-30	3	Observación 3	\N	\N	\N	\N
4	2023-07-01	4	Observación 4	\N	\N	\N	\N
1	2023-07-01	1	Entregado	1	2	100.99	\N
2	2023-07-02	2	No devuelto	0	2	150.99	\N
\.


--
-- TOC entry 3049 (class 0 OID 16725)
-- Dependencies: 212
-- Data for Name: prestamos_libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestamos_libros (pli_secuencia, pli_prestamo, pli_libro, pli_estado, pli_dias, pli_valor, pli_fecha_devolucion) FROM stdin;
5	3	1	1	10	9.99	2023-07-10
6	3	2	1	10	7.99	2023-07-10
7	3	3	1	10	11.99	2023-07-10
8	4	4	1	21	14.99	2023-07-22
19	1	1	1	7	10.99	2023-07-08
20	1	2	1	7	8.99	2023-07-08
21	2	3	1	14	12.99	2023-07-16
22	2	4	1	14	11.99	2023-07-16
\.


--
-- TOC entry 3052 (class 0 OID 16732)
-- Dependencies: 215
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (usu_codigo, usu_username, usu_password) FROM stdin;
1	Cabral	12345
2	Marcelo	12345
\.


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 203
-- Name: autores_aut_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autores_aut_codigo_seq', 9, true);


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 205
-- Name: ciudades_ciu_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ciudades_ciu_codigo_seq', 10, true);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 207
-- Name: clientes_cli_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_cli_codigo_seq', 5, true);


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 210
-- Name: libros_lib_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_lib_codigo_seq', 3, true);


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 217
-- Name: libros_tipos_lit_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_tipos_lit_codigo_seq', 1, false);


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 213
-- Name: prestamos_libros_pli_secuencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamos_libros_pli_secuencia_seq', 22, true);


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 214
-- Name: prestamos_pre_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamos_pre_numero_seq', 20, true);


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 216
-- Name: usuarios_usu_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_usu_codigo_seq', 8, true);


--
-- TOC entry 2888 (class 2606 OID 16748)
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (aut_codigo);


--
-- TOC entry 2890 (class 2606 OID 16750)
-- Name: ciudades ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (ciu_codigo);


--
-- TOC entry 2892 (class 2606 OID 16752)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cli_codigo);


--
-- TOC entry 2896 (class 2606 OID 16754)
-- Name: libros_autores libros_autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_autores
    ADD CONSTRAINT libros_autores_pkey PRIMARY KEY (lau_libro, lau_autor);


--
-- TOC entry 2894 (class 2606 OID 16756)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (lib_codigo);


--
-- TOC entry 2904 (class 2606 OID 65699)
-- Name: libros_tipos libros_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_tipos
    ADD CONSTRAINT libros_tipos_pkey PRIMARY KEY (lit_codigo);


--
-- TOC entry 2900 (class 2606 OID 16758)
-- Name: prestamos_libros prestamos_libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos_libros
    ADD CONSTRAINT prestamos_libros_pkey PRIMARY KEY (pli_secuencia);


--
-- TOC entry 2898 (class 2606 OID 16760)
-- Name: prestamos prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (pre_numero);


--
-- TOC entry 2902 (class 2606 OID 16762)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (usu_codigo);


--
-- TOC entry 2905 (class 2606 OID 16763)
-- Name: autores autores_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_fk FOREIGN KEY (aut_ciudad) REFERENCES public.ciudades(ciu_codigo);


--
-- TOC entry 2906 (class 2606 OID 16768)
-- Name: clientes clientes_cli_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cli_ciudad_fkey FOREIGN KEY (cli_ciudad) REFERENCES public.ciudades(ciu_codigo);


--
-- TOC entry 2907 (class 2606 OID 16773)
-- Name: libros_autores libros_autores_lau_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_autores
    ADD CONSTRAINT libros_autores_lau_autor_fkey FOREIGN KEY (lau_autor) REFERENCES public.autores(aut_codigo);


--
-- TOC entry 2908 (class 2606 OID 16778)
-- Name: libros_autores libros_autores_lau_libro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_autores
    ADD CONSTRAINT libros_autores_lau_libro_fkey FOREIGN KEY (lau_libro) REFERENCES public.libros(lib_codigo);


--
-- TOC entry 2911 (class 2606 OID 16783)
-- Name: prestamos_libros prestamos_libros_pli_libro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos_libros
    ADD CONSTRAINT prestamos_libros_pli_libro_fkey FOREIGN KEY (pli_libro) REFERENCES public.libros(lib_codigo);


--
-- TOC entry 2912 (class 2606 OID 16788)
-- Name: prestamos_libros prestamos_libros_pli_prestamo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos_libros
    ADD CONSTRAINT prestamos_libros_pli_prestamo_fkey FOREIGN KEY (pli_prestamo) REFERENCES public.prestamos(pre_numero);


--
-- TOC entry 2909 (class 2606 OID 16793)
-- Name: prestamos prestamos_pre_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pre_cliente_fkey FOREIGN KEY (pre_cliente) REFERENCES public.clientes(cli_codigo);


--
-- TOC entry 2910 (class 2606 OID 16798)
-- Name: prestamos prestamos_pre_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pre_usuario_fkey FOREIGN KEY (pre_usuario) REFERENCES public.usuarios(usu_codigo);


-- Completed on 2023-07-02 18:38:50

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-07-02 18:38:50

--
-- PostgreSQL database cluster dump complete
--

