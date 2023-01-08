--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.1

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
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: u1a8gs28es1bak
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO u1a8gs28es1bak;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO zwvgvxrtrcezmy;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO zwvgvxrtrcezmy;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO zwvgvxrtrcezmy;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO zwvgvxrtrcezmy;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO zwvgvxrtrcezmy;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO zwvgvxrtrcezmy;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO zwvgvxrtrcezmy;

--
-- Name: main_academic; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.main_academic (
    id integer NOT NULL,
    year text NOT NULL,
    event text NOT NULL,
    weight text NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.main_academic OWNER TO zwvgvxrtrcezmy;

--
-- Name: main_daily; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.main_daily (
    id integer NOT NULL,
    day text NOT NULL,
    n2021 text NOT NULL,
    n2022 text DEFAULT '0'::text NOT NULL
);


ALTER TABLE public.main_daily OWNER TO zwvgvxrtrcezmy;

--
-- Name: main_imonlyhuman; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.main_imonlyhuman (
    id integer NOT NULL,
    name text NOT NULL,
    classname text NOT NULL,
    "time" text NOT NULL,
    value text DEFAULT '10'::text NOT NULL
);


ALTER TABLE public.main_imonlyhuman OWNER TO zwvgvxrtrcezmy;

--
-- Name: main_undergraduate; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.main_undergraduate (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    credit text NOT NULL,
    grade text NOT NULL,
    gpa text NOT NULL,
    level text NOT NULL
);


ALTER TABLE public.main_undergraduate OWNER TO zwvgvxrtrcezmy;

--
-- Name: main_value_year_a; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.main_value_year_a (
    id integer NOT NULL,
    year text NOT NULL,
    event text NOT NULL,
    book text NOT NULL,
    routine_2am_7am text NOT NULL,
    writing text NOT NULL,
    study_time text NOT NULL,
    response_teacher text NOT NULL,
    response_friend text NOT NULL
);


ALTER TABLE public.main_value_year_a OWNER TO zwvgvxrtrcezmy;

--
-- Name: main_value_year_b; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.main_value_year_b (
    id integer NOT NULL,
    year text NOT NULL,
    event text NOT NULL,
    pro_contest text NOT NULL,
    pro_solving text NOT NULL,
    algorithm text NOT NULL,
    soft_developing text NOT NULL,
    research text NOT NULL,
    software text NOT NULL,
    online_course text NOT NULL
);


ALTER TABLE public.main_value_year_b OWNER TO zwvgvxrtrcezmy;

--
-- Name: main_weight_year_a; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.main_weight_year_a (
    id integer NOT NULL,
    parameter text NOT NULL,
    n2004 text NOT NULL,
    n2005 text NOT NULL,
    n2006 text NOT NULL,
    n2007 text NOT NULL,
    n2008 text NOT NULL,
    n2009 text NOT NULL,
    n2010 text NOT NULL,
    n2011 text NOT NULL,
    n2012 text NOT NULL,
    n2013 text NOT NULL,
    n2014 text NOT NULL,
    n2015 text NOT NULL,
    n2016 text NOT NULL,
    n2017 text NOT NULL,
    n2018 text NOT NULL,
    n2019 text NOT NULL,
    n2020 text NOT NULL,
    n2021 text NOT NULL,
    n2022 text NOT NULL
);


ALTER TABLE public.main_weight_year_a OWNER TO zwvgvxrtrcezmy;

--
-- Name: main_weight_year_b; Type: TABLE; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE TABLE public.main_weight_year_b (
    id integer NOT NULL,
    parameter text NOT NULL,
    n2017 text NOT NULL,
    n2018 text NOT NULL,
    n2019 text NOT NULL,
    n2020 text NOT NULL,
    n2021 text NOT NULL,
    n2022 text NOT NULL
);


ALTER TABLE public.main_weight_year_b OWNER TO zwvgvxrtrcezmy;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add academic	7	add_academic
26	Can change academic	7	change_academic
27	Can delete academic	7	delete_academic
28	Can view academic	7	view_academic
29	Can add daily	8	add_daily
30	Can change daily	8	change_daily
31	Can delete daily	8	delete_daily
32	Can view daily	8	view_daily
33	Can add imonlyhuman	9	add_imonlyhuman
34	Can change imonlyhuman	9	change_imonlyhuman
35	Can delete imonlyhuman	9	delete_imonlyhuman
36	Can view imonlyhuman	9	view_imonlyhuman
37	Can add l1 t1	10	add_l1t1
38	Can change l1 t1	10	change_l1t1
39	Can delete l1 t1	10	delete_l1t1
40	Can view l1 t1	10	view_l1t1
41	Can add l1 t2	11	add_l1t2
42	Can change l1 t2	11	change_l1t2
43	Can delete l1 t2	11	delete_l1t2
44	Can view l1 t2	11	view_l1t2
45	Can add l2 t1	12	add_l2t1
46	Can change l2 t1	12	change_l2t1
47	Can delete l2 t1	12	delete_l2t1
48	Can view l2 t1	12	view_l2t1
49	Can add l2 t2	13	add_l2t2
50	Can change l2 t2	13	change_l2t2
51	Can delete l2 t2	13	delete_l2t2
52	Can view l2 t2	13	view_l2t2
53	Can add l3 t1	14	add_l3t1
54	Can change l3 t1	14	change_l3t1
55	Can delete l3 t1	14	delete_l3t1
56	Can view l3 t1	14	view_l3t1
57	Can add l3 t2	15	add_l3t2
58	Can change l3 t2	15	change_l3t2
59	Can delete l3 t2	15	delete_l3t2
60	Can view l3 t2	15	view_l3t2
61	Can add l4 t1	16	add_l4t1
62	Can change l4 t1	16	change_l4t1
63	Can delete l4 t1	16	delete_l4t1
64	Can view l4 t1	16	view_l4t1
65	Can add l4 t2	17	add_l4t2
66	Can change l4 t2	17	change_l4t2
67	Can delete l4 t2	17	delete_l4t2
68	Can view l4 t2	17	view_l4t2
69	Can add value year1	18	add_valueyear1
70	Can change value year1	18	change_valueyear1
71	Can delete value year1	18	delete_valueyear1
72	Can view value year1	18	view_valueyear1
73	Can add value year2	19	add_valueyear2
74	Can change value year2	19	change_valueyear2
75	Can delete value year2	19	delete_valueyear2
76	Can view value year2	19	view_valueyear2
77	Can add weight year1	20	add_weightyear1
78	Can change weight year1	20	change_weightyear1
79	Can delete weight year1	20	delete_weightyear1
80	Can view weight year1	20	view_weightyear1
81	Can add weight year2	21	add_weightyear2
82	Can change weight year2	21	change_weightyear2
83	Can delete weight year2	21	delete_weightyear2
84	Can view weight year2	21	view_weightyear2
85	Can add undergraduate	22	add_undergraduate
86	Can change undergraduate	22	change_undergraduate
87	Can delete undergraduate	22	delete_undergraduate
88	Can view undergraduate	22	view_undergraduate
89	Can add value year a	23	add_valueyeara
90	Can change value year a	23	change_valueyeara
91	Can delete value year a	23	delete_valueyeara
92	Can view value year a	23	view_valueyeara
93	Can add value year b	24	add_valueyearb
94	Can change value year b	24	change_valueyearb
95	Can delete value year b	24	delete_valueyearb
96	Can view value year b	24	view_valueyearb
97	Can add weight year a	25	add_weightyeara
98	Can change weight year a	25	change_weightyeara
99	Can delete weight year a	25	delete_weightyeara
100	Can view weight year a	25	view_weightyeara
101	Can add weight year b	26	add_weightyearb
102	Can change weight year b	26	change_weightyearb
103	Can delete weight year b	26	delete_weightyearb
104	Can view weight year b	26	view_weightyearb
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	main	academic
8	main	daily
9	main	imonlyhuman
10	main	l1t1
11	main	l1t2
12	main	l2t1
13	main	l2t2
14	main	l3t1
15	main	l3t2
16	main	l4t1
17	main	l4t2
18	main	valueyear1
19	main	valueyear2
20	main	weightyear1
21	main	weightyear2
22	main	undergraduate
23	main	valueyeara
24	main	valueyearb
25	main	weightyeara
26	main	weightyearb
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-01-11 13:21:49.345924+00
2	auth	0001_initial	2022-01-11 13:21:49.874509+00
3	admin	0001_initial	2022-01-11 13:21:50.289356+00
4	admin	0002_logentry_remove_auto_add	2022-01-11 13:21:50.306439+00
5	admin	0003_logentry_add_action_flag_choices	2022-01-11 13:21:50.323553+00
6	contenttypes	0002_remove_content_type_name	2022-01-11 13:21:50.364344+00
7	auth	0002_alter_permission_name_max_length	2022-01-11 13:21:50.39224+00
8	auth	0003_alter_user_email_max_length	2022-01-11 13:21:50.417151+00
9	auth	0004_alter_user_username_opts	2022-01-11 13:21:50.438608+00
10	auth	0005_alter_user_last_login_null	2022-01-11 13:21:50.454876+00
11	auth	0006_require_contenttypes_0002	2022-01-11 13:21:50.460715+00
12	auth	0007_alter_validators_add_error_messages	2022-01-11 13:21:50.475244+00
13	auth	0008_alter_user_username_max_length	2022-01-11 13:21:50.507477+00
14	auth	0009_alter_user_last_name_max_length	2022-01-11 13:21:50.556969+00
15	auth	0010_alter_group_name_max_length	2022-01-11 13:21:50.584176+00
16	auth	0011_update_proxy_permissions	2022-01-11 13:21:50.600004+00
17	auth	0012_alter_user_first_name_max_length	2022-01-11 13:21:50.622801+00
18	main	0001_initial	2022-01-11 13:21:50.655139+00
19	sessions	0001_initial	2022-01-11 13:21:50.695008+00
20	main	0002_auto_20220128_2334	2022-01-28 17:34:26.616318+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: main_academic; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.main_academic (id, year, event, weight, value) FROM stdin;
1	2004	class-1	40	85
2	2005	class-2	40	90
3	2006	class-3	40	75
4	2007	class-4	40	75
5	2008	class-5	50	90
6	2009	class-6	50	85
7	2010	class-7	50	85
8	2011	class-8	60	90
9	2012	class-9	70	60
10	2013	class-10	80	70
11	2014	clg-1str	90	55
12	2015	clg-2nd	90	65
13	2015	clg-3rd	90	45
14	2008	psc	40	90
15	2011	jsc	60	90
16	2013	ssc	80	60
17	2016	hsc	100	70
18	2014	clg-ad	100	90
19	2016	uni-ad	100	70
26	2020	lockdown	50	10
27	2021	bsc-7th-a	50	65
28	2021	bsc-8th-a	50	65
29	2022	bsc-7th-b	100	10
30	2022	bsc-8th-b	100	10
22	2018	bsc-3rd	100	50
20	2017	bsc-1st	100	50
21	2017	bsc-2nd	100	40
23	2018	bsc-4th	100	40
24	2019	bsc-5th	100	70
25	2019	bsc-6th	100	60
\.


--
-- Data for Name: main_daily; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.main_daily (id, day, n2021, n2022) FROM stdin;
1	01 Jan	60	60
2	02 Jan	60	60
3	03 Jan	30	60
63	04 Mar	10	20
67	08 Mar	15	25
68	09 Mar	40	25
91	01 Apr	40	10
92	02 Apr	60	20
102	12 Apr	15	50
105	15 Apr	10	40
101	11 Apr	25	60
96	06 Apr	10	60
97	07 Apr	10	10
103	13 Apr	80	60
104	14 Apr	35	50
93	03 Apr	10	40
94	04 Apr	20	30
95	05 Apr	10	60
98	08 Apr	15	25
99	09 Apr	15	25
100	10 Apr	45	50
107	17 Apr	20	50
154	03 Jun	15	80
155	04 Jun	10	80
109	19 Apr	60	20
110	20 Apr	60	20
111	21 Apr	10	20
156	05 Jun	20	80
157	06 Jun	20	80
152	01 Jun	60	10
153	02 Jun	20	10
106	16 Apr	10	40
159	08 Jun	10	10
108	18 Apr	20	20
112	22 Apr	10	10
113	23 Apr	10	10
114	24 Apr	25	10
160	09 Jun	10	10
161	10 Jun	20	60
162	11 Jun	35	60
163	12 Jun	40	60
164	13 Jun	40	20
165	14 Jun	40	40
22	22 Jan	10	85
20	20 Jan	15	40
23	23 Jan	10	75
21	21 Jan	10	50
25	25 Jan	40	40
26	26 Jan	30	10
24	24 Jan	10	85
27	27 Jan	15	10
32	01 Feb	40	55
35	04 Feb	10	50
33	02 Feb	70	35
34	03 Feb	30	45
36	05 Feb	10	30
28	28 Jan	60	35
29	29 Jan	60	55
30	30 Jan	80	45
31	31 Jan	80	65
167	16 Jun	45	10
168	17 Jun	50	10
169	18 Jun	30	10
170	19 Jun	40	20
171	20 Jun	50	20
172	21 Jun	40	20
173	22 Jun	40	80
174	23 Jun	50	85
37	06 Feb	10	90
175	24 Jun	70	30
176	25 Jun	70	60
177	26 Jun	40	60
178	27 Jun	20	60
38	07 Feb	20	90
39	08 Feb	20	90
40	09 Feb	10	60
41	10 Feb	10	30
42	11 Feb	20	60
43	12 Feb	30	30
44	13 Feb	30	40
45	14 Feb	30	40
46	15 Feb	70	60
47	16 Feb	70	60
48	17 Feb	10	60
49	18 Feb	10	10
50	19 Feb	10	20
51	20 Feb	15	20
62	03 Mar	10	30
52	21 Feb	15	40
179	28 Jun	50	60
64	05 Mar	10	30
65	06 Mar	10	30
66	07 Mar	15	30
116	26 Apr	60	10
180	29 Jun	50	20
70	11 Mar	40	30
181	30 Jun	70	20
69	10 Mar	40	30
166	15 Jun	40	20
158	07 Jun	40	85
117	27 Apr	60	10
118	28 Apr	60	10
119	29 Apr	10	20
120	30 Apr	10	10
252	09 Sep	10	0
253	10 Sep	10	0
261	18 Sep	10	0
266	23 Sep	10	0
267	24 Sep	40	0
270	27 Sep	40	0
271	28 Sep	40	0
272	29 Sep	50	0
275	02 Oct	50	0
276	03 Oct	55	0
278	05 Oct	55	0
279	06 Oct	60	0
281	08 Oct	60	0
282	09 Oct	60	0
121	01 May	60	10
122	02 May	35	10
123	03 May	60	10
124	04 May	60	10
125	05 May	80	10
126	06 May	85	10
298	25 Oct	10	0
302	29 Oct	30	0
303	30 Oct	30	0
304	31 Oct	30	0
305	01 Nov	60	0
306	02 Nov	60	0
307	03 Nov	60	0
308	04 Nov	70	0
309	05 Nov	25	0
310	06 Nov	25	0
311	07 Nov	25	0
312	08 Nov	45	0
313	09 Nov	50	0
314	10 Nov	70	0
315	11 Nov	70	0
316	12 Nov	25	0
317	13 Nov	25	0
318	14 Nov	25	0
319	15 Nov	25	0
320	16 Nov	25	0
321	17 Nov	35	0
322	18 Nov	35	0
323	19 Nov	35	0
324	20 Nov	35	0
325	21 Nov	20	0
328	24 Nov	20	0
329	25 Nov	20	0
332	28 Nov	25	0
337	03 Dec	65	0
338	04 Dec	65	0
342	08 Dec	20	0
343	09 Dec	20	0
344	10 Dec	20	0
345	11 Dec	30	0
349	15 Dec	60	0
358	24 Dec	80	0
359	25 Dec	80	0
360	26 Dec	40	0
362	28 Dec	40	0
4	04 Jan	60	60
5	05 Jan	20	60
6	06 Jan	20	60
7	07 Jan	15	30
346	12 Dec	50	0
347	13 Dec	65	0
348	14 Dec	50	0
350	16 Dec	50	0
351	17 Dec	70	0
352	18 Dec	55	0
353	19 Dec	75	0
354	20 Dec	75	0
355	21 Dec	75	0
335	01 Dec	55	0
336	02 Dec	75	0
339	05 Dec	20	0
340	06 Dec	35	0
341	07 Dec	35	0
326	22 Nov	15	0
327	23 Nov	10	0
330	26 Nov	15	0
331	27 Nov	25	0
333	29 Nov	30	0
254	11 Sep	80	0
255	12 Sep	40	0
256	13 Sep	40	0
257	14 Sep	65	0
258	15 Sep	65	0
259	16 Sep	70	0
268	25 Sep	55	0
269	26 Sep	55	0
273	30 Sep	30	0
274	01 Oct	40	0
277	04 Oct	75	0
280	07 Oct	40	0
294	21 Oct	20	0
283	10 Oct	15	0
287	14 Oct	40	0
288	15 Oct	40	0
289	16 Oct	50	0
290	17 Oct	50	0
284	11 Oct	15	0
285	12 Oct	15	0
286	13 Oct	15	0
260	17 Sep	15	0
262	19 Sep	20	0
263	20 Sep	15	0
264	21 Sep	15	0
265	22 Sep	10	0
8	08 Jan	20	30
9	09 Jan	15	30
10	10 Jan	10	30
11	11 Jan	10	30
12	12 Jan	61	61
13	13 Jan	15	30
14	14 Jan	15	30
15	15 Jan	15	10
16	16 Jan	40	10
17	17 Jan	40	10
18	18 Jan	30	10
19	19 Jan	30	40
361	27 Dec	35	0
363	29 Dec	30	0
364	30 Dec	35	0
365	31 Dec	60	0
356	22 Dec	70	0
357	23 Dec	70	0
334	30 Nov	20	0
291	18 Oct	50	0
296	23 Oct	40	0
297	24 Oct	40	0
299	26 Oct	50	0
300	27 Oct	50	0
301	28 Oct	30	0
292	19 Oct	20	0
293	20 Oct	20	0
295	22 Oct	60	0
53	22 Feb	30	40
54	23 Feb	30	10
55	24 Feb	10	40
56	25 Feb	10	60
57	26 Feb	70	20
58	27 Feb	70	20
59	28 Feb	70	40
60	01 Mar	80	40
61	02 Mar	80	10
78	19 Mar	60	30
79	20 Mar	60	30
81	22 Mar	60	30
71	12 Mar	40	20
72	13 Mar	10	20
73	14 Mar	20	25
75	16 Mar	40	20
80	21 Mar	60	25
82	23 Mar	60	20
86	27 Mar	10	25
87	28 Mar	10	20
128	08 May	25	10
129	09 May	30	10
90	31 Mar	30	10
130	10 May	30	10
131	11 May	30	10
83	24 Mar	60	30
85	26 Mar	10	30
133	13 May	10	10
134	14 May	20	10
88	29 Mar	10	30
89	30 Mar	20	30
74	15 Mar	40	30
76	17 Mar	40	30
77	18 Mar	40	25
84	25 Mar	20	25
135	15 May	10	90
138	18 May	20	90
139	19 May	30	90
140	20 May	70	90
141	21 May	70	90
142	22 May	70	90
143	23 May	70	90
145	25 May	65	90
146	26 May	55	90
147	27 May	55	90
148	28 May	25	90
136	16 May	10	95
137	17 May	10	95
144	24 May	70	95
149	29 May	60	95
150	30 May	60	95
151	31 May	20	95
115	25 Apr	35	20
132	12 May	20	20
127	07 May	90	20
182	01 Jul	70	10
183	02 Jul	40	10
184	03 Jul	40	10
185	04 Jul	40	10
186	05 Jul	20	10
187	06 Jul	20	10
188	07 Jul	80	10
189	08 Jul	60	10
190	09 Jul	50	10
191	10 Jul	50	10
193	12 Jul	10	10
194	13 Jul	10	10
195	14 Jul	10	10
196	15 Jul	10	10
197	16 Jul	20	10
198	17 Jul	20	10
199	18 Jul	20	10
202	21 Jul	30	10
203	22 Jul	50	10
205	24 Jul	70	10
206	25 Jul	55	10
207	26 Jul	55	10
208	27 Jul	70	10
209	28 Jul	20	10
211	30 Jul	80	10
212	31 Jul	60	10
214	02 Aug	10	10
215	03 Aug	20	10
216	04 Aug	20	10
218	06 Aug	20	10
219	07 Aug	20	10
220	08 Aug	20	10
221	09 Aug	20	10
230	18 Aug	70	10
233	21 Aug	45	10
234	22 Aug	50	10
236	24 Aug	50	10
237	25 Aug	55	10
239	27 Aug	60	10
241	29 Aug	40	10
242	30 Aug	80	10
244	01 Sep	10	20
250	07 Sep	30	20
251	08 Sep	30	20
192	11 Jul	60	20
200	19 Jul	50	20
201	20 Jul	50	20
204	23 Jul	50	20
210	29 Jul	70	20
213	01 Aug	10	20
217	05 Aug	30	20
222	10 Aug	20	20
223	11 Aug	40	20
224	12 Aug	20	10
225	13 Aug	60	10
226	14 Aug	45	10
227	15 Aug	45	10
228	16 Aug	30	10
231	19 Aug	50	20
232	20 Aug	45	20
235	23 Aug	50	20
238	26 Aug	45	20
240	28 Aug	40	20
229	17 Aug	70	20
243	31 Aug	80	10
245	02 Sep	10	10
246	03 Sep	20	40
247	04 Sep	10	10
248	05 Sep	10	10
249	06 Sep	10	60
\.


--
-- Data for Name: main_imonlyhuman; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.main_imonlyhuman (id, name, classname, "time", value) FROM stdin;
15	CSE-432 / COMPILER DESIGN (SESSIONAL) / 1.5 CREDIT / L4T1	UNDERGRADUATE	2021-2023	100
16	CSE-458 / COMPUTER GRAPHICS (SESSIONAL) / 1.5 CREDIT / L4T1	UNDERGRADUATE	2021-2023	100
17	CSE-464 / MACHINE LEARNING (SESSIONAL) / 0.75 CREDIT / L4T1	UNDERGRADUATE	2021-2023	100
18	CSE-321 / COMPUTER ARCHITECTURE / 3 CREDIT / L3T2	UNDERGRADUATE	2021-2023	100
19	CSE-353 / SYSTEM ANALYSIS AND DESIGN / 3 CREDIT / L3T2	UNDERGRADUATE	2021-2023	100
21	EE-283 / ELECTRICAL DRIVES AND INSTRUMENTATION / 3 CREDIT / SHORT / L2T2 / 30	UNDERGRADUATE	2021-2023	50
24	EE-281 / ELECTRONIC DEVICES AND CIRCUITS / 3 CREDIT / SHORT / L2T1 / 55	UNDERGRADUATE	2021-2023	50
26	BANGLA SIGN LANGUAGE TRANSLATION	REASERCH	2021-2023	20
27	IMAGE CAPTIONING	REASERCH	2021-2023	20
28	SEMANTIC SEGMENTATION FOR ROAD	REASERCH	2021-2023	20
29	PERSON REIDENTIFICATION	REASERCH	2021-2023	20
30	FLOWER CLASSIFICATION	REASERCH	2021-2023	20
31	NEXT WORD PREDICTION	REASERCH	2021-2023	20
32	MCQ EVALUATOR	REASERCH	2021-2023	20
33	MOVIE GENRE PREDICTION	REASERCH	2021-2023	20
34	ALGORITHM + DATA STRUCTURE + PROBLEM SOLVING + PROGRAMING CONTEST	SKILLSET	2022-2029	20
35	GRE + IELTS + MAIL + VISA	POSTGRADUATE	2023-2024	10
36	PHD	POSTGRADUATE	2024-2028	10
37	BOOK	GOAL	2021-2029	10
38	MOVIE	GOAL	2021-2029	20
39	DEVOPS JOB + MLOPS JOB + R&D JOB	GOAL	2022-2029	10
40	HOUSE	GOAL	2028-2032	10
41	CAR	GOAL	2028-2030	10
42	M	GOAL	2028-2029	10
43	+25K -5K	TRANSACTION	2022-2023	10
44	+180K -60K	TRANSACTION	2024-2028	10
45	+500K -300K	TRANSACTION	2029-2032	10
46	done_image_media_player	PYTHON	2021-2023	100
47	done_ip_supply_chain	PYTHON	2021-2023	100
48	done_mk_cryptography	PYTHON	2021-2023	100
49	done_tutorial_basic_matplot_numpy_panda_scipy_tkinter	PYTHON	2021-2023	100
50	done_tutorial_random_materials_realpython	PYTHON	2021-2023	10
51	done_tutorial_opencv	IMAGE PROCESSING	2021-2023	50
52	done_image_feature_matching	IMAGE PROCESSING	2021-2023	50
53	done_image_mcq_evaluator	IMAGE PROCESSING	2021-2023	50
54	done_urbosi_image_canny_edge_detection	IMAGE PROCESSING	2021-2023	50
55	done_urbosi_image_feature_matching	IMAGE PROCESSING	2021-2023	50
56	done_coursera_deep_learning_specialization	ML	2021-2023	10
57	done_data_pipelining	ML	2021-2023	50
58	done_image_captioning_using_pytorch	ML	2021-2023	50
59	done_image_captioning_with_transformers	ML	2021-2023	50
60	done_image_classification	ML	2021-2023	10
61	done_image_deep_fake_video	ML	2021-2023	10
62	done_image_face_recognition_projects	ML	2021-2023	10
63	done_image_flower_recognition	ML	2021-2023	50
64	done_image_KittiSeg	ML	2021-2023	50
65	done_image_movie_genre_prediction	ML	2021-2023	50
66	done_image_person_reID_baseline_pytorch	ML	2021-2023	50
67	done_image_sign_language_master	ML	2021-2023	50
68	done_iq_association_rule_mining_for_depression_analysis	ML	2021-2023	50
69	done_mnist_fashion_design_recognition	ML	2021-2023	10
70	done_mnist_handwritten_digit_recognition	ML	2021-2023	10
71	done_pyimage_random_materials	ML	2021-2023	10
72	done_tutorial_ml_algorithms_book	ML	2021-2023	10
73	done_tutorial_ml_collection	ML	2021-2023	10
74	done_tutorial_ml_from_scratch	ML	2021-2023	10
75	done_tutorial_pytorch	ML	2021-2023	10
76	done_tutorial_tensorflow	ML	2021-2023	10
77	done_urbosi_image_custom_cnn	ML	2021-2023	50
78	done_coursera_natural_language_processing_specialization	NLP	2021-2023	10
79	done_nlp_algorithms_book	NLP	2021-2023	10
80	done_nlp_language_modeling	NLP	2021-2023	10
81	done_nlp_next_word_predictor	NLP	2021-2023	10
82	done_backend_barcode_scanner	DEVOPS	2021-2023	100
84	done_backend_psych_eval	DEVOPS	2021-2023	100
85	done_backend_webcam	DEVOPS	2021-2023	10
2	CSE-433 / SOFTWARE ENGINEERING / 3 CREDIT / L4T2	UNDERGRADUATE	2021-2023	100
5	HUM-447 / FINANCIAL COST AND MANAGERIAL ACCOUNTING / 2 CREDIT / L4T2	UNDERGRADUATE	2021-2023	100
23	CHEM-141 / CHEMISTRY / 3 CREDIT / SHORT / L1T2 / 30 	UNDERGRADUATE	2021-2023	100
25	PHY-141 / PHYSICS / 3 CREDIT / SHORT / L1T1 / 60	UNDERGRADUATE	2021-2023	100
22	MATH-143 / CO-ORDINATE GEOMETRY, ORDINARY AND PARTIAL DIFFERENTIAL EQUATION / 4 CREDIT / SHORT / L1T2 / 40	UNDERGRADUATE	2021-2023	100
4	HUM-445 / ENGINEERING MANAGEMENT / 2 CREDIT / L4T2	UNDERGRADUATE	2021-2023	100
7	CSE-424 / DIGITAL SYSTEM DESIGN - SESSIONAL / 1.5 CREDIT / L4T2	UNDERGRADUATE	2021-2023	100
8	CSE-434 / SOFTWARE ENGINEERING - SESSIONAL / 0.75 CREDIT / L4T2	UNDERGRADUATE	2021-2023	100
9	CSE-431 / COMPILER DESIGN / 3 CREDIT / L4T1	UNDERGRADUATE	2021-2023	100
10	CSE-435 / INFORMATION SECURITY / 3 CREDIT / L4T1	UNDERGRADUATE	2021-2023	100
11	CSE-457 / COMPUTER GRAPHICS / 3 CREDIT / L4T1	UNDERGRADUATE	2021-2023	100
12	CSE-463 / MACHINE LEARNING / 3 CREDIT / L4T1	UNDERGRADUATE	2021-2023	100
13	HUM-413 / SOCIOLOGY FOR SCIENCE AND TECHNOLOGY / 2 CREDIT / L4T1	UNDERGRADUATE	2021-2023	100
14	CSE-402 / INDUSTRIAL ATTACHMENT / 1 CREDIT / L4T1	UNDERGRADUATE	2021-2023	100
1	CSE-423 / DIGITAL SYSTEM DESIGN / 3 CREDIT / L4T2	UNDERGRADUATE	2021-2023	100
83	done_backend_job_recruitment	DEVOPS	2021-2023	25
3	CSE-465 / DIGITAL SIGNAL PROCESSING / 3 CREDIT / L4T2	UNDERGRADUATE	2021-2023	100
6	CSE-400 / PROJECT AND THESIS - SESSIONAL - ONLY / 4 CREDIT / L4T2	UNDERGRADUATE	2021-2023	10
20	CSE-251 / DATABASE MANAGEMENT SYSTEMS / 3 CREDIT / SHORT / L2T2 / 35 	UNDERGRADUATE	2021-2023	100
\.


--
-- Data for Name: main_undergraduate; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.main_undergraduate (id, code, name, credit, grade, gpa, level) FROM stdin;
6	CSE-100	COMPUTER FUNDAMENTAL - SESSIONAL - ONLY	0.75	A	3.75	l1t1
17	CHEM-142	CHEMISTRY - SESSIONAL	0.75	A-	3.50	l1t2
30	CSE-251	DATABASE MANAGEMENT SYSTEMS	3.00	D	2.00	l2t2
36	EE-284	ELECTRICAL DRIVES AND INSTRUMENTATION - SESSIONAL	0.75	B+	3.25	l2t2
37	CSE-200	SOFTWARE DEVELOPMENT WITH JAVA - SESSIONAL - ONLY	0.75	A+	4.00	l2t2
43	CSE-302	TECHINAL WRITING AND PRESENTATION - SESSIONAL - ONLY	0.75	A	3.75	l3t1
44	CSE-314	DATA COMMUNICATION - SESSIONAL	0.75	A	3.75	l3t1
53	CSE-300	SOFTWARE DEVELOPMENT PROJECT - SESSIONAL - ONLY	0.75	A-	3.50	l3t2
54	CSE-312	COMPUTER NETWORK - SESSIONAL	0.75	A-	3.50	l3t2
55	CSE-338	COMPUTER PERIPHERALS AND INTERFACING - SESSIONAL	0.75	B-	2.75	l3t2
57	CSE-354	SYSTEM ANALYSIS AND DESIGN - SESSIONAL	0.75	A-	3.50	l3t2
26	EE-282	ELECTRONIC DEVICES AND CIRCUITS - SESSIONAL	0.75	B+	3.25	l2t1
1	CSE-141	STRUCTURED PROGRAMMING	3.00	B+	3.25	l1t1
2	EE-181	BASIC ELECTRICAL ENGINEERING	3.00	D	2.00	l1t1
65	CSE-458	COMPUTER GRAPHICS - SESSIONAL	1.50	A+	4.00	l4t1
4	MATH-141	DIFFERENTIAL CALCULUS AND INTEGRAL CALCULUS	3.00	C	2.25	l1t1
5	HUM-141	ENGLISH	2.00	D	2.00	l1t1
7	CSE-142	STRUCTURED PROGRAMMING - SESSIONAL	1.50	A+	4.00	l1t1
66	CSE-464	MACHINE LEARNING - SESSIONAL	0.75	C+	2.50	l4t1
9	PHY-142	PHYSICS - SESSIONAL	1.50	B+	3.25	l1t1
10	CSE-111	DISCRETE MATHEMATICS	3.00	C	2.25	l1t2
11	CSE-121	DIGITAL LOGIC DESIGN	3.00	C+	2.50	l1t2
12	CSE-143	OBJECT ORIENTED PROGRAMMING	3.00	B+	3.25	l1t2
14	MATH-143	CO-ORDINATE GEOMETRY ORDINARY AND PARTIAL DIFFERENTIAL EQUATION	4.00	C+	2.50	l1t2
15	CSE-122	DIGITAL LOGIC DESIGN - SESSIONAL	1.50	A	3.75	l1t2
16	CSE-144	OBJECT ORIENTED PROGRAMMING - SESSIONAL	1.50	A+	4.00	l1t2
18	HUM-144	ENGLISH SKILL DEVELOPMENT - SESSIONAL	1.50	A	3.75	l1t2
28	CSE-223	DIGITAL ELECTRONICS AND PULSE TEHNIQUES	3.00	D	2.00	l2t2
29	CSE-243	ALGORITHMS DESIGN AND ANALYSIS	3.00	B	3.00	l2t2
31	EE-283	ELECTRICAL DRIVES AND INSTRUMENTATION	3.00	F	0.00	l2t2
32	MATH-243	FOURIER ANALYSIS AND LAPLACE TRANSFORMATION	3.00	D	2.00	l2t2
38	CSE-313	DATA COMMUNICATION	3.00	C	2.25	l3t1
39	CSE-323	APPLIED STATISTICS AND QUEUEING THEORY	3.00	B+	3.25	l3t1
40	CSE-331	THEROY OF COMPUTING	2.00	A-	3.50	l3t1
41	CSE-333	MICROPROCESSOR AND ASSEMBLY LANGUAGE PROGRAMMING	3.00	B	3.00	l3t1
42	CSE-335	OPERATING SYSTEM	3.00	B	3.00	l3t1
48	CSE-311	COMPUTER NETWORK	3.00	A	3.75	l3t2
49	CSE-321	COMPUTER ARCHITECTURE	3.00	B-	2.75	l3t2
50	CSE-337	COMPUTER PERIPHERALS AND INTERFACING	3.00	C	2.25	l3t2
51	CSE-345	ARTIFICIAL INTELLIGENCE	3.00	D	2.00	l3t2
52	CSE-353	SYSTEM ANALYSIS AND DESIGN	3.00	A-	3.50	l3t2
74	CSE-434	SOFTWARE ENGINEERING - SESSIONAL	0.75	A	3.75	l4t2
24	CSE-242	DATA STRUCTURE - SESSIONAL	1.50	A+	4.00	l2t1
25	CSE-246	NUMERICAL ANALYSIS - SESSIONAL	1.50	B+	3.25	l2t1
27	ME-246	ENGINEERING DRAWING AND CAD - SESSIONAL	1.50	B+	3.25	l2t1
33	CSE-224	DIGITAL ELECTRONICS AND PULSE TEHNIQUES - SESSIONAL	1.50	B	3.00	l2t2
34	CSE-244	ALGORITHMS DESIGN AND ANALYSIS - SESSIONAL	1.50	A+	4.00	l2t2
35	CSE-252	DATABASE MANAGEMENT SYSTEMS - SESSIONAL	1.50	C+	2.50	l2t2
45	CSE-326	INTERNET PROGRAMMING - SESSIONAL - ONLY	1.50	A+	4.00	l3t1
46	CSE-334	MICROPROCESSOR AND ASSEMBLY LANGUAGE PROGRAMMING - SESSIONAL	1.50	A-	3.50	l3t1
47	CSE-336	OPERATING SYSTEM - SESSIONAL	1.50	A+	4.00	l3t1
56	CSE-346	ARTIFICIAL INTELLIGENCE - SESSIONAL	1.50	A	3.75	l3t2
8	EE-182	BASIC ELECTRICAL ENGINEERING - SESSIONAL	1.50	B+	3.25	l1t1
59	CSE-435	INFORMATION SECURITY	3.00	B-	2.75	l4t1
61	CSE-463	MACHINE LEARNING	3.00	C+	2.50	l4t1
62	HUM-413	SOCIOLOGY FOR SCIENCE AND TECHNOLOGY	2.00	B-	2.75	l4t1
58	CSE-431	COMPILER DESIGN	3.00	C	2.25	l4t1
60	CSE-457	COMPUTER GRAPHICS	3.00	C+	2.50	l4t1
73	CSE-424	DIGITAL SYSTEM DESIGN - SESSIONAL	1.50	B	3.00	l4t2
3	PHY-141	PHYSICS	3.00	C	2.25	l1t1
13	CHEM-141	CHEMISTRY	3.00	D	2.00	l1t2
64	CSE-432	COMPILER DESIGN - SESSIONAL	1.50	A+	4.00	l4t1
19	CSE-241	DATA STRUCTURE	3.00	C	2.25	l2t1
20	CSE-245	NUMERICAL ANALYSIS	3.00	B-	2.75	l2t1
21	EE-281	ELECTRONIC DEVICES AND CIRCUITS	3.00	F	0.00	l2t1
22	MATH-241	VECTOR CALCULUS LINEAR ALGEBRA AND COMPLEX VARIABLES	3.00	C	2.25	l2t1
23	HUM-243	ENGINEERING ECONOMICS	3.00	D	2.00	l2t1
67	CSE-423	DIGITAL SYSTEM DESIGN	3.00	C+	2.50	l4t2
70	HUM-445	ENGINEERING MANAGEMENT	2.00	C	2.25	l4t2
71	HUM-447	FINANCIAL COST AND MANAGERIAL ACCOUNTING	2.00	C	2.25	l4t2
68	CSE-433	SOFTWARE ENGINEERING	3.00	C+	2.50	l4t2
63	CSE-402	INDUSTRIAL ATTACHMENT - SESSIONAL - ONLY	1.00	A+	4.00	l4t1
69	CSE-465	DIGITAL SIGNAL PROCESSING	3.00	C	2.25	l4t2
72	CSE-400	PROJECT AND THESIS - SESSIONAL - ONLY	4.00	F	0.00	l4t2
\.


--
-- Data for Name: main_value_year_a; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.main_value_year_a (id, year, event, book, routine_2am_7am, writing, study_time, response_teacher, response_friend) FROM stdin;
1	2004	class-1	90	90	90	80	70	80
2	2005	class-2	90	90	90	90	80	90
3	2006	class-3	90	90	90	80	70	70
4	2007	class-4	90	90	90	80	70	70
5	2008	class-5, psc	90	90	90	90	80	90
6	2009	class-6	90	90	90	80	80	90
7	2010	class-7	90	90	90	80	80	90
8	2011	class-8, jsc	90	90	90	90	90	90
9	2012	class-9	80	40	60	40	40	40
10	2013	class-10, ssc	70	40	60	50	20	20
11	2014	clg-ad, clg-1st	80	60	80	70	50	50
12	2015	clg-2nd, clg-3rd	80	60	80	70	50	50
13	2016	hsc, university-admission	80	70	80	80	50	60
16	2019	bsc-5th-semester, bsc-6th-semester	40	40	40	40	40	40
19	2022	bsc-7th-semester-b, bsc-8th-semester-b	10	10	10	10	10	10
17	2020	lockdown	40	20	20	20	20	20
18	2021	bsc-7th-semester-a, bsc-8th-semester-a	60	60	60	60	40	60
14	2017	bsc-1st-semester, bsc-2nd-semester	40	20	20	20	20	20
15	2018	bsc-3rd-semester, bsc-4th-semester	40	10	20	20	10	10
\.


--
-- Data for Name: main_value_year_b; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.main_value_year_b (id, year, event, pro_contest, pro_solving, algorithm, soft_developing, research, software, online_course) FROM stdin;
4	2020	lockdown	10	10	10	20	10	20	10
5	2021	bsc-7th-semester-a, bsc-8th-semester-a	10	10	10	60	40	60	40
6	2022	bsc-7th-semester-b, bsc-8th-semester-b	10	10	10	10	10	10	10
3	2019	bsc-5th-semester, bsc-6th-semester	15	15	15	40	20	40	20
1	2017	bsc-1st-semester, bsc-2nd-semester	30	40	40	5	1	5	2
2	2018	bsc-3rd-semester, bsc-4th-semester	40	50	50	2	1	2	3
\.


--
-- Data for Name: main_weight_year_a; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.main_weight_year_a (id, parameter, n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021, n2022) FROM stdin;
1	study_time	60	60	60	60	70	70	70	80	80	80	100	100	100	100	100	100	50	100	100
2	writing	60	60	60	60	70	70	70	80	80	80	100	100	100	100	100	100	50	100	100
3	response_teacher	40	40	40	40	50	50	50	60	60	60	70	70	70	80	80	80	80	80	80
4	response_friend	30	30	30	30	40	40	40	50	50	50	60	60	60	80	80	80	80	80	80
5	routine_2am_7am	20	20	20	20	20	20	20	20	20	20	20	20	20	20	20	20	20	20	20
6	book	10	10	10	10	10	10	10	10	10	10	10	10	10	10	10	10	10	10	10
\.


--
-- Data for Name: main_weight_year_b; Type: TABLE DATA; Schema: public; Owner: zwvgvxrtrcezmy
--

COPY public.main_weight_year_b (id, parameter, n2017, n2018, n2019, n2020, n2021, n2022) FROM stdin;
1	pro_contest	100	100	100	100	100	100
2	pro_solving	100	100	100	100	100	100
3	algorithm	100	100	100	100	100	100
4	soft_developing	5	5	50	100	100	100
5	research	5	5	50	100	100	100
6	software	5	5	50	100	100	100
7	online_course	5	5	50	100	100	100
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zwvgvxrtrcezmy
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zwvgvxrtrcezmy
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zwvgvxrtrcezmy
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 104, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zwvgvxrtrcezmy
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zwvgvxrtrcezmy
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zwvgvxrtrcezmy
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zwvgvxrtrcezmy
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zwvgvxrtrcezmy
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 26, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zwvgvxrtrcezmy
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: main_academic academic_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.main_academic
    ADD CONSTRAINT academic_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: main_daily daily_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.main_daily
    ADD CONSTRAINT daily_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: main_imonlyhuman imonlyhuman_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.main_imonlyhuman
    ADD CONSTRAINT imonlyhuman_pkey PRIMARY KEY (id);


--
-- Name: main_undergraduate main_undergraduate_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.main_undergraduate
    ADD CONSTRAINT main_undergraduate_pkey PRIMARY KEY (id);


--
-- Name: main_value_year_a value_year_1_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.main_value_year_a
    ADD CONSTRAINT value_year_1_pkey PRIMARY KEY (id);


--
-- Name: main_value_year_b value_year_2_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.main_value_year_b
    ADD CONSTRAINT value_year_2_pkey PRIMARY KEY (id);


--
-- Name: main_weight_year_a weight_year_1_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.main_weight_year_a
    ADD CONSTRAINT weight_year_1_pkey PRIMARY KEY (id);


--
-- Name: main_weight_year_b weight_year_2_pkey; Type: CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.main_weight_year_b
    ADD CONSTRAINT weight_year_2_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: zwvgvxrtrcezmy
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zwvgvxrtrcezmy
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: u1a8gs28es1bak
--

GRANT USAGE ON SCHEMA heroku_ext TO zwvgvxrtrcezmy WITH GRANT OPTION;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO zwvgvxrtrcezmy;


--
-- PostgreSQL database dump complete
--

