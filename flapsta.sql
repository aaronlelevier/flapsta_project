--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: core_contact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE core_contact (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    message text NOT NULL,
    subject character varying(200) NOT NULL
);


ALTER TABLE public.core_contact OWNER TO postgres;

--
-- Name: core_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_contact_id_seq OWNER TO postgres;

--
-- Name: core_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_contact_id_seq OWNED BY core_contact.id;


--
-- Name: core_flapster; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE core_flapster (
    id integer NOT NULL,
    user_id integer NOT NULL,
    newsletter_id integer,
    salt character varying(75) NOT NULL
);


ALTER TABLE public.core_flapster OWNER TO postgres;

--
-- Name: core_flapster_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_flapster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_flapster_id_seq OWNER TO postgres;

--
-- Name: core_flapster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_flapster_id_seq OWNED BY core_flapster.id;


--
-- Name: core_newsletter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE core_newsletter (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    subscribe boolean NOT NULL
);


ALTER TABLE public.core_newsletter OWNER TO postgres;

--
-- Name: core_newsletter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_newsletter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_newsletter_id_seq OWNER TO postgres;

--
-- Name: core_newsletter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_newsletter_id_seq OWNED BY core_newsletter.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: products_color; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_color (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    slug character varying(30) NOT NULL
);


ALTER TABLE public.products_color OWNER TO postgres;

--
-- Name: products_color_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_color_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_color_id_seq OWNER TO postgres;

--
-- Name: products_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_color_id_seq OWNED BY products_color.id;


--
-- Name: products_idea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_idea (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    slug character varying(30) NOT NULL,
    image character varying(100),
    "default" boolean NOT NULL,
    description text NOT NULL,
    available boolean NOT NULL
);


ALTER TABLE public.products_idea OWNER TO postgres;

--
-- Name: products_idea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_idea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_idea_id_seq OWNER TO postgres;

--
-- Name: products_idea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_idea_id_seq OWNED BY products_idea.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_product (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    developed_for character varying(50) NOT NULL,
    description text,
    image_one character varying(100),
    image_two character varying(100),
    image_three character varying(100),
    unit_price double precision,
    sale_price double precision,
    contrast character varying(25) NOT NULL,
    main_art boolean NOT NULL,
    featured boolean NOT NULL,
    slug character varying(60) NOT NULL,
    idea_one character varying(60) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    our_rating integer NOT NULL,
    available boolean NOT NULL,
    "SKU" character varying(25),
    "ASIN" character varying(25),
    "UPC" character varying(25)
);


ALTER TABLE public.products_product OWNER TO postgres;

--
-- Name: products_product_colors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_product_colors (
    id integer NOT NULL,
    product_id integer NOT NULL,
    color_id integer NOT NULL
);


ALTER TABLE public.products_product_colors OWNER TO postgres;

--
-- Name: products_product_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_product_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_colors_id_seq OWNER TO postgres;

--
-- Name: products_product_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_product_colors_id_seq OWNED BY products_product_colors.id;


--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_product_id_seq OWNED BY products_product.id;


--
-- Name: products_product_ideas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_product_ideas (
    id integer NOT NULL,
    product_id integer NOT NULL,
    idea_id integer NOT NULL
);


ALTER TABLE public.products_product_ideas OWNER TO postgres;

--
-- Name: products_product_ideas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_product_ideas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_ideas_id_seq OWNER TO postgres;

--
-- Name: products_product_ideas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_product_ideas_id_seq OWNED BY products_product_ideas.id;


--
-- Name: products_product_related_products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_product_related_products (
    id integer NOT NULL,
    from_product_id integer NOT NULL,
    to_product_id integer NOT NULL
);


ALTER TABLE public.products_product_related_products OWNER TO postgres;

--
-- Name: products_product_related_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_product_related_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_related_products_id_seq OWNER TO postgres;

--
-- Name: products_product_related_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_product_related_products_id_seq OWNED BY products_product_related_products.id;


--
-- Name: products_star; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_star (
    id integer NOT NULL,
    vote integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.products_star OWNER TO postgres;

--
-- Name: products_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_star_id_seq OWNER TO postgres;

--
-- Name: products_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_star_id_seq OWNED BY products_star.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE social_auth_association_id_seq OWNED BY social_auth_association.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(40) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE social_auth_nonce_id_seq OWNED BY social_auth_nonce.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE social_auth_usersocialauth (
    id integer NOT NULL,
    user_id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE social_auth_usersocialauth_id_seq OWNED BY social_auth_usersocialauth.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO postgres;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO postgres;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_contact ALTER COLUMN id SET DEFAULT nextval('core_contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_flapster ALTER COLUMN id SET DEFAULT nextval('core_flapster_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_newsletter ALTER COLUMN id SET DEFAULT nextval('core_newsletter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_color ALTER COLUMN id SET DEFAULT nextval('products_color_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_idea ALTER COLUMN id SET DEFAULT nextval('products_idea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_product ALTER COLUMN id SET DEFAULT nextval('products_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_product_colors ALTER COLUMN id SET DEFAULT nextval('products_product_colors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_product_ideas ALTER COLUMN id SET DEFAULT nextval('products_product_ideas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_product_related_products ALTER COLUMN id SET DEFAULT nextval('products_product_related_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_star ALTER COLUMN id SET DEFAULT nextval('products_star_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_association ALTER COLUMN id SET DEFAULT nextval('social_auth_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('social_auth_nonce_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add migration history	8	add_migrationhistory
23	Can change migration history	8	change_migrationhistory
24	Can delete migration history	8	delete_migrationhistory
25	Can add contact	9	add_contact
26	Can change contact	9	change_contact
27	Can delete contact	9	delete_contact
28	Can add style	10	add_style
29	Can change style	10	change_style
30	Can delete style	10	delete_style
31	Can add color	11	add_color
32	Can change color	11	change_color
33	Can delete color	11	delete_color
34	Can add Product	12	add_product
35	Can change Product	12	change_product
36	Can delete Product	12	delete_product
37	Can add idea descriptor	13	add_ideadescriptor
38	Can change idea descriptor	13	change_ideadescriptor
39	Can delete idea descriptor	13	delete_ideadescriptor
40	Can add Idea	14	add_idea
41	Can change Idea	14	change_idea
42	Can delete Idea	14	delete_idea
43	Can add tag	15	add_tag
44	Can change tag	15	change_tag
45	Can delete tag	15	delete_tag
46	Can add star	16	add_star
47	Can change star	16	change_star
48	Can delete star	16	delete_star
49	Can add user social auth	17	add_usersocialauth
50	Can change user social auth	17	change_usersocialauth
51	Can delete user social auth	17	delete_usersocialauth
52	Can add nonce	18	add_nonce
53	Can change nonce	18	change_nonce
54	Can delete nonce	18	delete_nonce
55	Can add association	19	add_association
56	Can change association	19	change_association
57	Can delete association	19	delete_association
58	Can add newsletter	20	add_newsletter
59	Can change newsletter	20	change_newsletter
60	Can delete newsletter	20	delete_newsletter
61	Can add flapster	21	add_flapster
62	Can change flapster	21	change_flapster
63	Can delete flapster	21	delete_flapster
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 63, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
18	!	2014-02-19 06:11:21.151262-08	f	AaronLelevier4d23b9ce7d4a4329	Aaron	Lelevier	aaron.y.lelevier@gmail.com	f	t	2014-02-19 06:11:21.13237-08
2	!	2014-02-09 16:34:05.655112-08	f	AaronLelevier	Aaron	Lelevier	aaron.lelevier@gmail.com	f	t	2014-02-09 16:33:44.82373-08
4	!	2014-02-19 06:14:14.90354-08	f	aron.ysidoro.3	Aron	Ysidoro		f	t	2014-02-09 16:49:57.546047-08
6	md5$voOtpTVds4zj$c944d2dcf12dd6012ee99c79b5e03504	2014-02-12 06:12:55.465797-08	f	Yuki2			pyaaron@gmail.com	f	t	2014-02-12 06:12:55.465797-08
7	md5$0XAxpreL8JNO$fa41409370e43af3984d66bbba3c069d	2014-02-12 06:13:58.434943-08	f	Yuki3			pyaaron@gmail.com	f	f	2014-02-12 06:13:58.434943-08
8	md5$pciWCP7lBt82$8176ff32cc252fd108d155968a20900a	2014-02-12 06:15:09.498554-08	f	Yuki4			pyaaron@gmail.com	f	t	2014-02-12 06:15:09.498554-08
9	md5$bMWoahnFOI0g$cf807be1ae6f30eb8ce3831a29e28f55	2014-02-12 06:24:11.820217-08	f	Yuki5			pyaaron@gmail.com	f	t	2014-02-12 06:24:11.820217-08
10	md5$xCa8fMTkC6bY$40aa2fcdd61ddbb256b0ce9747ad77d1	2014-02-12 06:25:00.831963-08	f	Yuki6			pyaaron@gmail.com	f	f	2014-02-12 06:25:00.831963-08
5	md5$tqdIXE8V5NQg$193e3ed65f1eed3966bea58425844e54	2014-02-20 07:01:59.098397-08	f	Yuki			pyaaron@gmail.com	f	t	2014-02-12 06:06:41.380486-08
11	md5$cjkgCeV8BlCN$2b25a4a75fe7fe97599f28d2553717cf	2014-02-12 06:37:32.370315-08	f	Yuki7			pyaaron@gmail.com	f	t	2014-02-12 06:25:39.514003-08
12	md5$iail5k90JiEz$9c6079e4957e56bf9f09165859b275a7	2014-02-12 06:57:28.247598-08	f	Sam			pyaaron@gmail.com	f	t	2014-02-12 06:57:28.247598-08
13	md5$npA3MjlSvouC$a97e678aadc11687a146b8c118fb140d	2014-02-12 06:58:28.419516-08	f	Sam2			pyaaron@gmail.com	f	f	2014-02-12 06:58:28.419516-08
14	md5$ts4XMHN8h43a$dea8d34e113ee1d5790e0c0af56f4974	2014-02-12 07:02:12.431572-08	f	bob1			pyaaron@gmail.com	f	f	2014-02-12 07:02:12.431572-08
15	md5$bfkHdlLCkLAT$35c003f077310c31eb498e68e1ba5682	2014-02-15 08:26:05.342869-08	f	test3			pyaaron@gmail.com	f	t	2014-02-15 08:22:49.143167-08
19	!	2014-02-25 05:44:22.700726-08	f	AaronLelevier0740031f73374f3f	Aaron	Lelevier	aaron.yy.lelevier@gmail.com	f	t	2014-02-23 11:33:22.34127-08
16	md5$X7WdK0FyhOd0$709a4ce1358860daec96314df5cdb782	2014-02-18 07:41:17.056164-08	f	TestC			pyaaron@gmail.com	f	f	2014-02-18 07:41:17.056164-08
17	md5$3tpHPRZFk3FP$15ff3da1682e8dd44aacc1d77e7917cc	2014-02-18 07:46:26.518958-08	f	TestD			pyaaron@gmail.com	f	f	2014-02-18 07:46:26.518958-08
3	!	2014-02-25 05:45:17.030848-08	f	AronYsidoro	Aron	Ysidoro		f	t	2014-02-09 16:40:13.412719-08
20	md5$tZquUwfuK8X8$0a0c5d8d1d32ec3c583043d163a95dc9	2014-03-08 10:26:54.230473-08	f	admin			pyaaron@gmail.com	t	t	2014-03-08 10:26:54.230473-08
1	md5$RkINQvskHjYw$09aab00342b28307b418e93a479aaa46	2014-03-19 06:02:01.071728-07	t	Aaron			pyaaron@gmail.com	t	t	2014-02-01 11:45:39.550236-08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 20, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: core_contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_contact (id, name, email, message, subject) FROM stdin;
1	Aaron	pyaaron@gmail.com	hi	a
2	a	pyaaron@gmail.com	h	h
3	a	pyaaron@gmail.com	a	a
4	Aaron	pyaaron@gmail.com	test	test
5	Aaron	pyaaron@gmail.com	test	test
6	Aaron	pyaaron@gmail.com	test	test ssl backend
7	Aaron	pyaaron@gmail.com	test	test ssl backend
8	Aaron	pyaaron@gmail.com	test	test ssl backend
9	Aaron	pyaaron@gmail.com	test	test ssl backend
10	Aaron	pyaaron@gmail.com	test	test ssl backend
11	a	pyaaron@gmail.com	test	sub
12	a	pyaaron@gmail.com	test	subject
13	a	pyaaron@gmail.com	test	subject
14	a	pyaaron@gmail.com	test	subject
15	Aaaron	pyaaron@gmail.com	test	sub
16	Aaron	pyaaron@gmail.com	test send	test
17	test	flapstausa@gmail.com	test	test
18	test	flapstausa@gmail.com	test	test
\.


--
-- Name: core_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_contact_id_seq', 18, true);


--
-- Data for Name: core_flapster; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_flapster (id, user_id, newsletter_id, salt) FROM stdin;
2	7	3	10Qi7oFE3pqPiKR6
3	10	4	RlWA2rVDpMwlZwyu
4	11	5	C8HYIFGNI8cYry7r
5	13	\N	kuijmP9Z0W3MpXOP
6	14	\N	5HerDG4Z9OqtYpfU
7	15	\N	IS52cra0ncGSRUpz
8	16	\N	Fg5cAu3AKWt5vwEY
9	17	\N	IzV3y2SONcnc6Jg9
\.


--
-- Name: core_flapster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_flapster_id_seq', 9, true);


--
-- Data for Name: core_newsletter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_newsletter (id, email, subscribe) FROM stdin;
1	pyaaron@gmail.com	t
2	Adrian1@gmail.com	t
3	pyaaron@gmail.com	t
4	pyaaron@gmail.com	t
5	pyaaron@gmail.com	t
\.


--
-- Name: core_newsletter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_newsletter_id_seq', 5, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2014-02-01 12:28:47.265196-08	1	12	1	Product 1	1	
2	2014-02-01 12:43:41.116472-08	1	12	5	iPhone Case1	2	Changed title, developed_for, ideas, colors and styles.
3	2014-02-01 12:44:09.203175-08	1	12	4	iPhone Case0	2	Changed contrast, colors and styles.
4	2014-02-02 07:25:19.13575-08	1	12	16	Flower Field	2	Changed image_one.
5	2014-02-02 07:25:30.042599-08	1	12	21	Creative Magento	2	Changed image_two and image_three.
6	2014-02-02 07:25:40.284268-08	1	12	21	Creative Magento	2	Changed image_one.
7	2014-02-02 07:26:58.272947-08	1	12	20	Flying in Space	2	Changed image_one, image_two and image_three.
8	2014-02-02 07:27:17.208126-08	1	12	19	Carrying a Bicycle with One Hand	2	Changed image_one, image_two and image_three.
9	2014-02-02 07:27:27.224184-08	1	12	21	Creative Magento	2	Changed image_two.
10	2014-02-02 07:27:47.205971-08	1	12	17	Keyboard Melody	2	Changed image_one, image_two and image_three.
11	2014-02-02 07:28:04.211964-08	1	12	18	Classic Clock	2	Changed image_one and image_two.
12	2014-02-02 07:28:26.269644-08	1	12	15	Deep Space Journey	2	Changed image_one, image_two and image_three.
13	2014-02-02 07:28:47.380521-08	1	12	16	Flower Field	2	Changed image_one, image_two and image_three.
14	2014-02-02 07:30:17.283184-08	1	14	56	Coolish	2	Changed name.
15	2014-02-02 07:30:27.412703-08	1	14	55	Sandstorm	2	Changed name.
16	2014-02-02 07:30:36.973702-08	1	14	54	DeepSpace	2	Changed name.
17	2014-02-02 07:30:55.405709-08	1	14	52	Vogue	2	Changed default and name.
18	2014-02-02 07:31:23.53037-08	1	14	51	Trending	2	Changed products.
19	2014-02-02 07:31:55.513869-08	1	12	20	Flying in Space	2	No fields changed.
20	2014-02-02 07:34:39.061174-08	1	14	52	Vogue	2	No fields changed.
21	2014-02-02 07:34:53.375791-08	1	14	52	Vogue	2	No fields changed.
22	2014-02-02 07:35:18.29927-08	1	14	56	Coolish	2	Changed image.
23	2014-02-02 08:25:45.376622-08	1	13	60	HighTension	2	Changed name.
24	2014-02-07 07:12:51.857503-08	1	12	40	Product14	2	Changed related_products.
25	2014-02-21 07:36:31.968927-08	1	12	338	I LOVE BRA	2	Changed colors.
26	2014-02-21 07:37:38.334595-08	1	12	311	Solid Black 	2	Changed colors.
27	2014-02-21 07:37:59.072216-08	1	12	290	Blessed Virgin	2	Changed colors.
28	2014-02-21 07:38:12.8212-08	1	12	243	Bridal Bouquet 	2	Changed colors.
29	2014-02-23 10:35:16.130884-08	1	12	287	Abstract Flowers and Feathers	2	Changed image_one.
30	2014-02-25 06:57:06.715761-08	1	12	290	Blessed Virgin	2	Changed available.
31	2014-03-03 06:39:09.376928-08	1	12	290	Blessed Virgin	3	
32	2014-03-05 06:39:33.677126-08	1	12	339	Calfornia Republic	2	Changed ideas.
33	2014-03-07 06:08:26.13717-08	1	12	339	California Republic	2	Changed title.
34	2014-03-08 13:17:20.501885-08	1	12	338	I LOVE BR	2	Changed title.
35	2014-03-08 13:20:44.292043-08	1	12	317	Got Beer?	2	Changed image_one.
36	2014-03-08 13:22:09.806816-08	1	12	317	Got Beer?	2	Changed image_one.
37	2014-03-11 06:08:02.006813-07	1	12	287	Abstract Flowers and Feathers	2	Changed sale_price.
38	2014-03-11 06:10:28.735149-07	1	12	287	Abstract Flowers and Feathers	2	Changed sale_price.
39	2014-03-13 21:04:30.656713-07	1	12	330	Brasilian	2	Changed SKU, UPC and ASIN.
40	2014-03-13 21:08:11.705362-07	1	12	300	Leopard	2	Changed SKU, UPC and ASIN.
41	2014-03-13 21:12:24.609897-07	1	12	341	Tribal Croxx	1	
42	2014-03-14 05:41:06.762699-07	1	12	341	Tribal Cross	2	Changed title and image_one.
43	2014-03-16 07:16:26.378904-07	1	12	282	Camo	2	Changed ideas.
44	2014-03-16 07:16:45.43699-07	1	12	333	Vintange Koleidoscope	2	Changed ideas.
45	2014-03-16 08:16:42.40539-07	1	12	302	OMG	2	Changed image_two.
46	2014-03-16 08:17:11.224309-07	1	12	255	Paisley Butterfly	2	Changed image_two.
47	2014-03-16 08:17:37.539796-07	1	12	259	Whooo Whooo	2	Changed image_two.
48	2014-03-16 08:18:02.030608-07	1	12	258	Enjoy the Sea	2	Changed image_two.
49	2014-03-16 08:18:32.111463-07	1	12	270	Creepy Lab	2	Changed image_two.
50	2014-03-16 08:18:57.974862-07	1	12	267	Skulls with Roses	2	Changed image_two.
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 50, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	log entry	admin	logentry
8	migration history	south	migrationhistory
9	contact	core	contact
10	style	products	style
11	color	products	color
12	Product	products	product
13	idea descriptor	products	ideadescriptor
14	Idea	products	idea
15	tag	products	tag
16	star	products	star
17	user social auth	social_auth	usersocialauth
18	nonce	social_auth	nonce
19	association	social_auth	association
20	newsletter	core	newsletter
21	flapster	core	flapster
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 21, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
8z57sdcixcejxbgd2k4yrnehuaq1pd7k	OWU1NmM2OGNlMTFhODBkZTI3NmQyMzNmYThlZjQ4MGY0NTEwYjMyNzqAAn1xAS4=	2014-03-01 07:38:16.548852-08
db1xnhe47w9z8wdkgu6bqv62gol31xyq	OWU1NmM2OGNlMTFhODBkZTI3NmQyMzNmYThlZjQ4MGY0NTEwYjMyNzqAAn1xAS4=	2014-03-01 07:40:56.385578-08
o6zmmqs6dn11jo32zptj2cw70e0hupvk	MTkzN2VmMTlkMWNkMzQ0MTFjYTI4ZmYxNGJkNjRjODQ0MjgzNzE3NTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2014-03-01 10:12:32.186569-08
0pkc03kj25x8684jbp50lmu2dt7kz1g9	MTkzN2VmMTlkMWNkMzQ0MTFjYTI4ZmYxNGJkNjRjODQ0MjgzNzE3NTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2014-04-02 06:02:01.077509-07
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: products_color; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_color (id, name, slug) FROM stdin;
82	Black	black
83	Brown	brown
84	Yellow	yellow
85	Green	green
86	Silver	silver
87	White	white
88	Orange	orange
89	Red	red
90	Blue	blue
91	Gold	gold
92	Purple	purple
93	Pink	pink
94	Multi-color	multi-color
\.


--
-- Name: products_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_color_id_seq', 94, true);


--
-- Data for Name: products_idea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_idea (id, name, slug, image, "default", description, available) FROM stdin;
89	New Arrivals	new-arrivals	product_pictures/iPhone1.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
90	Hottest Designs	hottest-designs	product_pictures/iPhone3.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
91	Flowers	flowers	product_pictures/iPhone2.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
92	Skulls	skulls	product_pictures/iPhone4.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
93	Hearts	hearts	product_pictures/iPhone3.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
94	Vintage	vintage	product_pictures/iPhone1.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
95	Animals	animals	product_pictures/iPhone3.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
96	Abstract	abstract	product_pictures/iPhone4.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
97	Snazzy	snazzy	product_pictures/iPhone2.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
98	Black & White	black-white	product_pictures/iPhone4.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
99	Pattern & Textures	pattern-textures	product_pictures/iPhone3.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
100	Orient	orient	product_pictures/iPhone3.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
101	Funny	funny	product_pictures/iPhone2.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
102	Colorful	colorful	product_pictures/iPhone1.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
103	Urban	urban	product_pictures/iPhone3.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
104	Other	other	product_pictures/iPhone3.jpg	f	Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.	t
\.


--
-- Name: products_idea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_idea_id_seq', 104, true);


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_product (id, title, developed_for, description, image_one, image_two, image_three, unit_price, sale_price, contrast, main_art, featured, slug, idea_one, created, modified, our_rating, available, "SKU", "ASIN", "UPC") FROM stdin;
307	Colorful Heart Collage	Made For Me	\N	product_pictures/Colorful Heart Collage_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	colorful-heart-collage	Hottest Designs	2014-02-15 08:27:39.546962-08	2014-03-13 21:07:17.3539-07	1	t	IP5-0015	B00INIALIM	799559978570 
257	Crisp Air	Made For Me	\N	product_pictures/Crisp Air_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	crisp-air	Animals	2014-02-15 08:27:39.38745-08	2014-03-13 21:07:17.365909-07	1	t	IP5-0017	B00INID8SM	799559978594 
262	Peace and Colors	Made For Me	\N	product_pictures/Peace and Colors_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	peace-and-colors	Pattern & Textures	2014-02-15 08:27:39.403729-08	2014-03-13 21:07:17.642338-07	1	t	IP5-0064	B00INO0BQS	799559979065 
248	Floral Ornament	Made For Me	\N	product_pictures/Floral Ornament_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	floral-ornament	Flowers	2014-02-15 08:27:39.357777-08	2014-03-13 21:07:17.436391-07	1	t	IP5-0029	B00INITOEE	799559978716 
274	All Seeing Eye	Made For Me	\N	product_pictures/All Seeing Eye_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	all-seeing-eye	Hottest Designs	2014-02-15 08:27:39.442957-08	2014-03-13 21:07:17.293291-07	1	t	IP5-0005	B00IMXNMN4	799559978471 
250	Flowers and Butterflies	Made For Me	\N	product_pictures/Flowers and Butterflies_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	flowers-and-butterflies	Hottest Designs	2014-02-15 08:27:39.364374-08	2014-03-13 21:07:17.45367-07	1	t	IP5-0032	B00INJ1ZZE	799559978747 
271	Ace of Spades	Made For Me	\N	product_pictures/Ace of Spades_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	ace-of-spades	Hottest Designs	2014-02-15 08:27:39.433077-08	2014-03-13 21:07:17.281566-07	1	t	0W-4O64-E9IC	B00IMWTCZW	799559978457 
263	Abstract Wall	Made For Me	\N	product_pictures/Abstract Wall_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	abstract-wall	Vintage	2014-02-15 08:27:39.40725-08	2014-03-13 21:07:17.27527-07	1	t	IP5-0002	B00IMWR1UU	799559978440 
270	Creepy Lab	Made For Me		product_pictures/Creepy Lab_2.jpg	product_pictures/Creepy Lab_Fotor_3_1.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	creepy-lab	Hottest Designs	2014-02-15 08:27:39.430091-08	2014-03-16 08:18:32.092802-07	1	t	IP5-0016	B00INIBSTS	799559978587 
242	Hand Drawn Flower	Made For Me	\N	product_pictures/Hand Drawn Flower_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	hand-drawn-flower	Flowers	2014-02-15 08:27:39.338125-08	2014-03-14 05:56:55.934867-07	1	t	IP5-0037	B00INJ6VR6	799559978792 
246	Bed of Roses	Made For Me	\N	product_pictures/Bed of Roses_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	bed-of-roses	Hottest Designs	2014-02-15 08:27:39.351282-08	2014-03-13 21:07:17.299236-07	1	t	IP5-0006	B00IMXTPF8	799559978488 
256	Looking for Flowers	Made For Me	\N	product_pictures/Looking for Flowers_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	looking-for-flowers	Flowers	2014-02-15 08:27:39.38408-08	2014-03-13 21:07:17.551772-07	1	t	IP5-0049	B00INJWZ4E	799559978914 
303	Fleur De Lis	Made For Me	\N	product_pictures/Fleur De Lis_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	fleur-de-lis	Hottest Designs	2014-02-15 08:27:39.533706-08	2014-03-13 21:07:17.430493-07	1	t	IP5-0028	B00INIS96I	799559978709 
276	KICK YOUR ASS	Made For Me	\N	product_pictures/KICK YOUR ASS_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	kick-your-ass	Hottest Designs	2014-02-15 08:27:39.449434-08	2014-03-13 21:07:17.538246-07	1	t	IP5-0046	B00INJSC1E	799559978884 
254	Tropical Flowers	Made For Me	\N	product_pictures/Tropical Flowers_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	tropical-flowers	Flowers	2014-02-15 08:27:39.377542-08	2014-03-13 21:07:17.782176-07	1	t	IP5-0088	B00INQBZRA	799559979300 
255	Paisley Butterfly	Made For Me		product_pictures/Paisley Butterfly_2.jpg	product_pictures/Paisley Butterfly_Fotor_3_1.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	paisley-butterfly	Hearts	2014-02-15 08:27:39.380834-08	2014-03-16 08:17:11.207-07	1	t	IP5-0061	B00INNQX16	799559979034 
260	Midnight Visitor	Made For Me	\N	product_pictures/Midnight Visitor_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	midnight-visitor	Animals	2014-02-15 08:27:39.397116-08	2014-03-13 21:07:17.564031-07	1	t	IP5-0051	B00INLM9SY	799559978938 
247	Bunch of Flowers	Made For Me	\N	product_pictures/Bunch of Flowers_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	bunch-of-flowers	Hottest Designs	2014-02-15 08:27:39.354603-08	2014-03-13 21:07:17.324481-07	1	t	IP5-0010	B00IMYIJGS	799559978525 
245	Vintage Hibiscus	Made For Me	\N	product_pictures/Vintage Hibiscus_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	vintage-hibiscus	Flowers	2014-02-15 08:27:39.347983-08	2014-03-13 21:07:17.80491-07	1	t	IP5-0092	B00INQHU74	799559979348 
264	Moonlit Night	Made For Me	\N	product_pictures/Moonlit Night_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	moonlit-night	Animals	2014-02-15 08:27:39.410573-08	2014-03-13 21:07:17.569914-07	1	t	IP5-0052	B00INLN6KY	799559978945 
251	Elegant Flowers	Made For Me	\N	product_pictures/Elegant Flowers_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	elegant-flowers	Flowers	2014-02-15 08:27:39.36766-08	2014-03-13 21:07:17.406854-07	1	t	IP5-0024	B00ININ6AM	799559978662 
269	Obituary	Made For Me	\N	product_pictures/Obituary_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	obituary	Hottest Designs	2014-02-15 08:27:39.426878-08	2014-03-13 21:07:17.581858-07	1	t	IP5-0054	B00INLOPKE	799559978969 
244	Vivid Flowers	Made For Me	\N	product_pictures/Vivid Flowers_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	vivid-flowers	Flowers	2014-02-15 08:27:39.344634-08	2014-03-13 21:07:17.843034-07	1	t	IP5-0098	B00INQSSQQ	799559979409 
259	Whooo Whooo	Made For Me		product_pictures/Whooo Whooo_2.jpg	product_pictures/Whooo Whooo_Fotor_3_1.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	whooo-whooo	Hearts	2014-02-15 08:27:39.393866-08	2014-03-16 08:17:37.522523-07	1	t	IP5-0099	B00INQUCWE	799559979416 
272	Royal Soul	Made For Me	\N	product_pictures/Royal Soul_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	royal-soul	Hottest Designs	2014-02-15 08:27:39.436307-08	2014-03-13 21:07:17.684899-07	1	t	IP5-0071	B00INOL9AU	799559979133 
243	Bridal Bouquet	Made For Me		product_pictures/Bridal Bouquet_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	bridal-bouquet	Flowers	2014-02-15 08:27:39.341298-08	2014-03-14 05:56:56.011353-07	1	t	IP5-0009	B00IMYHAT0	799559978518 
258	Enjoy the Sea	Made For Me		product_pictures/Enjoy the Sea_2.jpg	product_pictures/Enjoy the Sea_Fotor_3_1.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	enjoy-the-sea	Hearts	2014-02-15 08:27:39.390771-08	2014-03-16 08:18:02.013954-07	1	t	IP5-0025	B00INIOB2E	799559978679 
267	Skulls with Roses	Made For Me		product_pictures/Skulls with Roses_2.jpg	product_pictures/Skulls with Roses_Fotor_3_1.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	skulls-with-roses	Flowers	2014-02-15 08:27:39.420638-08	2014-03-16 08:18:57.956636-07	1	t	IP5-0076	B00INP0RYI	799559979188 
305	Bleeding Hearts	Made For Me	\N	product_pictures/Bleeding Hearts_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	bleeding-hearts	Hearts	2014-02-15 08:27:39.540469-08	2014-03-13 21:07:17.305702-07	1	t	IP5-0007	B00IMY4FZW	799559978495 
280	Vintage World Map	Made For Me	\N	product_pictures/Vintage World Map_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	vintage-world-map	Vintage	2014-02-15 08:27:39.462501-08	2014-03-13 21:07:17.831257-07	1	t	IP5-0096	B00INQPTN6	799559979386 
286	Graffiti Covered Wall	Made For Me	\N	product_pictures/Graffiti Covered Wall_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	graffiti-covered-wall	Colorful	2014-02-15 08:27:39.481472-08	2014-03-13 21:07:17.477149-07	1	t	IP5-0036	B00INJ5QRW	799559978785 
304	Snakeskin	Made For Me	\N	product_pictures/Snakeskin_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	snakeskin	Animals	2014-02-15 08:27:39.537077-08	2014-03-13 21:07:17.721043-07	1	t	IP5-0077	B00INP53PG	799559979195 
282	Camo	Made For Me		product_pictures/Camo_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	camo	Pattern & Textures	2014-02-15 08:27:39.468881-08	2014-03-16 07:16:26.336912-07	1	t	IP5-0012	B00INI5TZM	799559978549 
311	Solid Black	Made For Me		product_pictures/Solid Black_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	solid-black	Black & White	2014-02-15 08:27:39.560088-08	2014-03-13 21:07:17.738323-07	1	t	IP5-0080	B00INPHYXA	799559979225 
297	Eye of the Tiger	Made For Me	\N	product_pictures/Eye of the Tiger_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	eye-of-the-tiger	Hottest Designs	2014-02-15 08:27:39.513998-08	2014-03-13 21:07:17.418705-07	1	t	IP5-0026	B00INIPTXY	799559978686 
283	Psychedelic Explosion	Made For Me	\N	product_pictures/Psychedelic Explosion_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	psychedelic-explosion	Hottest Designs	2014-02-15 08:27:39.471958-08	2014-03-13 21:07:17.654108-07	1	t	IP5-0066	B00INO5II4	799559979089 
295	Oriental Dragon	Made For Me	\N	product_pictures/Oriental Dragon_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	oriental-dragon	Hottest Designs	2014-02-15 08:27:39.5079-08	2014-03-13 21:07:17.599797-07	1	t	IP5-0057	B00INNITOU	799559978990 
291	Pray for Peace	Made For Me	\N	product_pictures/Pray for Peace_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	pray-for-peace	Hottest Designs	2014-02-15 08:27:39.496153-08	2014-03-13 21:07:17.648102-07	1	t	IP5-0065	B00INO2TXG	799559979072 
302	OMG	Made For Me		product_pictures/OMG_2.jpg	product_pictures/OMG_Fotor_3_1.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	omg	Hottest Designs	2014-02-15 08:27:39.530402-08	2014-03-16 08:16:42.381361-07	1	t	IP5-0055	B00INLPSGO	799559978976 
294	Samurai Warriors	Made For Me	\N	product_pictures/Samurai Warriors_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	samurai-warriors	Orient	2014-02-15 08:27:39.504974-08	2014-03-13 21:07:17.703002-07	1	t	IP5-0074	B00INOU83O	799559979164 
306	Raining Hearts	Made For Me	\N	product_pictures/Raining Hearts_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	raining-hearts	Hearts	2014-02-15 08:27:39.543803-08	2014-03-13 21:07:17.666245-07	1	t	IP5-0068	B00INOAKZA	799559979102 
279	Circuit Board	Made For Me	\N	product_pictures/Circuit Board_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	circuit-board	Hottest Designs	2014-02-15 08:27:39.459084-08	2014-03-13 21:07:17.347951-07	1	t	IP5-0014	B00INI8SNW	799559978563 
288	Hipster Doodle Monster Collage	Made For Me	\N	product_pictures/Hipster Doodle Monster Collage_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	hipster-doodle-monster-collage	Colorful	2014-02-15 08:27:39.487329-08	2014-03-13 21:07:17.50184-07	1	t	IP5-0040	B00INJCFSK	799559978822 
308	Hearts with Love	Made For Me	\N	product_pictures/Hearts with Love_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	hearts-with-love	Hearts	2014-02-15 08:27:39.550115-08	2014-03-13 21:07:17.489143-07	1	t	IP5-0038	B00INJ8UPC	799559978808 
310	Paisley Heart	Made For Me	\N	product_pictures/Paisley Heart_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	paisley-heart	Hottest Designs	2014-02-15 08:27:39.55679-08	2014-03-13 21:07:17.630286-07	1	t	IP5-0062	B00INNUUQU	799559979041 
266	Ornamental Skulls	Made For Me	\N	product_pictures/Ornamental Skulls_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	ornamental-skulls	Skulls	2014-02-15 08:27:39.417301-08	2014-03-13 21:07:17.606061-07	1	t	IP5-0058	B00INNKUDS	799559979003 
296	Yin Yang	Made For Me	\N	product_pictures/Yin Yang_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	yin-yang	Hottest Designs	2014-02-15 08:27:39.510853-08	2014-03-13 21:07:17.854705-07	1	t	IP5-0100	B00INQVVEC	799559979423 
312	Solid White	Made For Me	\N	product_pictures/Solid White_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	solid-white	Black & White	2014-02-15 08:27:39.563438-08	2014-03-13 21:07:17.744338-07	1	t	IP5-0081	B00INPN8Y4	799559979232 
252	Vintage Roses on Navy	Made For Me	\N	product_pictures/Vintage Roses on Navy_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	vintage-roses-on-navy	Flowers	2014-02-15 08:27:39.37097-08	2014-03-14 05:56:55.942993-07	1	t	IP5-0094	B00INQLOVC	799559979362 
309	Flower Tattoo	Made For Me	\N	product_pictures/Flower Tattoo_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	flower-tattoo	Flowers	2014-02-15 08:27:39.553451-08	2014-03-13 21:07:17.447918-07	1	t	IP5-0031	B00INJ1DPQ	799559978730 
300	Leopard	Made For Me		product_pictures/Leopard_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	leopard	Hottest Designs	2014-02-15 08:27:39.523754-08	2014-03-13 21:08:11.688323-07	1	t	IP5-0047	B00INJTQCS	799559978891
292	Vintage Jeans	Made For Me	\N	product_pictures/Vintage Jeans_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	vintage-jeans	Vintage	2014-02-15 08:27:39.499098-08	2014-03-13 21:07:17.810864-07	1	t	IP5-0093	B00INQJS6K	799559979355 
281	Radar Map	Made For Me	\N	product_pictures/Radar Map_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	radar-map	Urban	2014-02-15 08:27:39.465652-08	2014-03-13 21:07:17.660081-07	1	t	IP5-0067	B00INO7XFA	799559979096 
293	Over the Rainbow	Made For Me	\N	product_pictures/Over the Rainbow_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	over-the-rainbow	Abstract	2014-02-15 08:27:39.502043-08	2014-03-13 21:07:17.612626-07	1	t	IP5-0059	B00INNN23S	799559979010 
298	The King	Made For Me	\N	product_pictures/The King_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	the-king	Hottest Designs	2014-02-15 08:27:39.517303-08	2014-03-13 21:07:17.774539-07	1	t	IP5-0086	B00INQ7H0Y	799559979287 
299	Snazzy Zebra	Made For Me	\N	product_pictures/Snazzy Zebra_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	snazzy-zebra	Hottest Designs	2014-02-15 08:27:39.520633-08	2014-03-13 21:07:17.732279-07	1	t	IP5-0079	B00INPDGIW	799559979218 
332	Japanese Flower Field	Made For Me	\N	product_pictures/Japanese Flower Field_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	japanese-flower-field	Orient	2014-02-15 08:27:39.629178-08	2014-03-13 21:07:17.526873-07	1	t	IP5-0044	B00INJP8CK	799559978860 
320	Marine Stripe	Made For Me	\N	product_pictures/Marine Stripe_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	marine-stripe	Hottest Designs	2014-02-15 08:27:39.589229-08	2014-03-13 21:07:17.558281-07	1	t	IP5-0050	B00INJYJXE	799559978921 
315	Retro Camera	Made For Me	\N	product_pictures/Retro Camera_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	retro-camera	Vintage	2014-02-15 08:27:39.572957-08	2014-03-13 21:07:17.67285-07	1	t	IP5-0069	B00INODKR0	799559979119 
319	African Elephant	Made For Me	\N	product_pictures/African Elephant_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	african-elephant	Animals	2014-02-15 08:27:39.58592-08	2014-03-14 05:56:55.9524-07	1	t	IP5-0004	B00IMX75D2	799559978464 
268	Dia de los Muertes	Made For Me	\N	product_pictures/Dia de los Muertes_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	dia-de-los-muertes	Hottest Designs	2014-02-15 08:27:39.423805-08	2014-03-13 21:07:17.384019-07	1	t	IP5-0020	B00INIH52M	799559978624 
339	California Republic	Made For Me		product_pictures/Calfornia Republic_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	california-republic	New Arrivals	2014-02-15 08:27:39.650587-08	2014-03-13 21:07:17.330088-07	1	t	IP5-0011	B00INI45WA	799559978532 
313	Danger Zone	Made For Me	\N	product_pictures/Danger Zone_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	danger-zone	Urban	2014-02-15 08:27:39.566612-08	2014-03-13 21:07:17.37214-07	1	t	IP5-0018	B00INIEHTQ	799559978600 
321	Sailor Royalty	Made For Me	\N	product_pictures/Sailor Royalty_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	sailor-royalty	Hottest Designs	2014-02-15 08:27:39.592552-08	2014-03-13 21:07:17.696933-07	1	t	IP5-0073	B00INORP3U	799559979157 
340	Skull Republic	Made For Me	\N	product_pictures/Skull Republic_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	skull-republic	Skulls	2014-02-15 08:27:39.653907-08	2014-03-13 21:07:17.709112-07	1	t	IP5-0075	B00INOWU2G	799559979171 
336	I LOVE USA	Made For Me	\N	product_pictures/I LOVE USA_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	i-love-usa	Hottest Designs	2014-02-15 08:27:39.640971-08	2014-03-13 21:07:17.520535-07	1	t	IP5-0043	B00INJO2T0	799559978853 
323	Hippie Flowers	Made For Me	\N	product_pictures/Hippie Flowers_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	hippie-flowers	Flowers	2014-02-15 08:27:39.59925-08	2014-03-13 21:07:17.49556-07	1	t	IP5-0039	B00INJAQGI	799559978815 
338	I LOVE BR	Made For Me		product_pictures/I LOVE BRA_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	i-love-br	Hottest Designs	2014-02-15 08:27:39.647231-08	2014-03-13 21:07:17.508372-07	1	t	IP5-0041	B00INJLYQE	799559978839 
314	Stipe Overload	Made For Me	\N	product_pictures/Stipe Overload_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	stipe-overload	Pattern & Textures	2014-02-15 08:27:39.570002-08	2014-03-13 21:07:17.756869-07	1	t	IP5-0083	B00INPWX5Y	799559979256 
325	Mosaic	Made For Me	\N	product_pictures/Mosaic_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	mosaic	Pattern & Textures	2014-02-15 08:27:39.606006-08	2014-03-14 05:56:55.925505-07	1	t	IP5-0053	B00INLO2IE	799559978952 
316	Golden Feather	Made For Me	\N	product_pictures/Golden Feather_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	golden-feather	Colorful	2014-02-15 08:27:39.57616-08	2014-03-13 21:07:17.465408-07	1	t	IP5-0034	B00INJ3O80	799559978761 
317	Got Beer?	Made For Me		product_pictures/Got Beer_2_1_1.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	got-beer	Funny	2014-02-15 08:27:39.579246-08	2014-03-13 21:07:17.471397-07	1	t	IP5-0035	B00INJ4KI8	799559978778 
331	Gold Fish	Made For Me	\N	product_pictures/Gold Fish_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	gold-fish	Animals	2014-02-15 08:27:39.626226-08	2014-03-14 05:56:55.989797-07	1	t	IP5-0033	B00INJ2W24	799559978754 
278	Diamond Plate	Made For Me	\N	product_pictures/Diamond Plate_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	diamond-plate	Hottest Designs	2014-02-15 08:27:39.456005-08	2014-03-13 21:07:17.389862-07	1	t	IP5-0021	B00INII0N0	799559978631 
337	I LOVE UK	Made For Me	\N	product_pictures/I LOVE UK_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	i-love-uk	Hottest Designs	2014-02-15 08:27:39.643966-08	2014-03-13 21:07:17.514539-07	1	t	IP5-0042	B00INJN4AS	799559978846 
329	Union Jack	Made For Me	\N	product_pictures/Union Jack_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	union-jack	Vintage	2014-02-15 08:27:39.619649-08	2014-03-14 05:56:55.997104-07	1	t	IP5-0089	B00INQD8YI	799559979317 
330	Brasilian	Made For Me		product_pictures/Brasilian_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	brasilian	Vintage	2014-02-15 08:27:39.623129-08	2014-03-13 21:07:17.312833-07	1	t	IP5-0008	B00IMYER96	799559978501 
273	Long Live the Queen	Made For Me	\N	product_pictures/Long Live the Queen_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	long-live-the-queen	Hottest Designs	2014-02-15 08:27:39.439623-08	2014-03-13 21:07:17.546109-07	1	t	IP5-0048	B00INJVEM8	799559978907 
327	Rise Up	Made For Me	\N	product_pictures/Rise Up_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	rise-up	Hottest Designs	2014-02-15 08:27:39.612749-08	2014-03-13 21:07:17.678797-07	1	t	IP5-0070	B00INOHZOE	799559979126 
277	Studs	Made For Me	\N	product_pictures/Studs_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	studs	Hottest Designs	2014-02-15 08:27:39.452632-08	2014-03-14 05:56:55.982612-07	1	t	IP5-0084	B00INQ0SN2	799559979263 
318	Day in Egypt	Made For Me	\N	product_pictures/Day in Egypt_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone2.jpg	25	\N		t	t	day-in-egypt	Pattern & Textures	2014-02-15 08:27:39.582511-08	2014-03-13 21:07:17.378119-07	1	t	IP5-0019	B00INIFYK2	799559978617 
333	Vintange Koleidoscope	Made For Me		product_pictures/Vintange Koleidoscope_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	vintange-koleidoscope	Vintage	2014-02-15 08:27:39.632155-08	2014-03-16 07:16:45.4183-07	1	t	IP5-0097	B00INQRB32	799559979393 
328	US Flag	Made For Me	\N	product_pictures/US Flag_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	us-flag	Vintage	2014-02-15 08:27:39.61653-08	2014-03-13 21:07:17.793703-07	1	t	IP5-0090	B00INQES5Q	799559979324 
334	Faded Bouquet Print	Made For Me	\N	product_pictures/Faded Bouquet Print_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	faded-bouquet-print	Orient	2014-02-15 08:27:39.635111-08	2014-03-13 21:07:17.42453-07	1	t	IP5-0027	B00INIQOWO	799559978693 
241	Cherry Blossoms	Made For Me	\N	product_pictures/Cherry Blossoms_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	cherry-blossoms	Hottest Designs	2014-02-15 08:27:39.332765-08	2014-03-13 21:07:17.341998-07	1	t	IP5-0013	B00INI7FUY	799559978556 
322	Paisley Monochrome	Made For Me	\N	product_pictures/Paisley Monochrome_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	paisley-monochrome	Flowers	2014-02-15 08:27:39.595891-08	2014-03-13 21:07:17.63644-07	1	t	IP5-0063	B00INNXEOA	799559979058 
324	Rusty Wall	Made For Me	\N	product_pictures/Rusty Wall_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	rusty-wall	Hottest Designs	2014-02-15 08:27:39.602681-08	2014-03-13 21:07:17.691149-07	1	t	IP5-0072	B00INOOWLS	799559979140 
301	Snazzy Giraffe	Made For Me	\N	product_pictures/Snazzy Giraffe_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	snazzy-giraffe	Hottest Designs	2014-02-15 08:27:39.527146-08	2014-03-13 21:07:17.726701-07	1	t	IP5-0078	B00INP9EO2	799559979201 
289	Statue of Liberty	Made For Me	\N	product_pictures/Statue of Liberty_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	statue-of-liberty	Vintage	2014-02-15 08:27:39.490256-08	2014-03-13 21:07:17.750481-07	1	t	IP5-0082	B00INPT5ZK	799559979249 
335	The Great Wave	Made For Me	\N	product_pictures/The Great Wave_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	the-great-wave	Hottest Designs	2014-02-15 08:27:39.638047-08	2014-03-13 21:07:17.768857-07	1	t	IP5-0085	B00INQ4LB2	799559979270 
285	Don't Worry Be Happy (White)	Made For Me	\N	product_pictures/Don't Worry Be Happy (White)_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	dont-worry-be-happy-white	Hottest Designs	2014-02-15 08:27:39.478506-08	2014-03-13 21:07:17.401612-07	1	t	IP5-0023	B00INIKVPU	799559978655 
265	Flower Skull	Made For Me	\N	product_pictures/Flower Skull_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	flower-skull	Skulls	2014-02-15 08:27:39.413974-08	2014-03-13 21:07:17.44252-07	1	t	IP5-0030	B00INIV3UC	799559978723 
326	Keep Calm and Carry On	Made For Me	\N	product_pictures/Keep Calm and Carry On_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone1.jpg	25	\N		t	t	keep-calm-and-carry-on	Hottest Designs	2014-02-15 08:27:39.609353-08	2014-03-13 21:07:17.532631-07	1	t	IP5-0045	B00INJQDRO	799559978877 
253	Vintage Carnation	Made For Me	\N	product_pictures/Vintage Carnation_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	vintage-carnation	Flowers	2014-02-15 08:27:39.374272-08	2014-03-13 21:07:17.799303-07	1	t	IP5-0091	B00INQG4DU	799559979331 
249	Vintage Roses on Pink	Made For Me	\N	product_pictures/Vintage Roses on Pink_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	vintage-roses-on-pink	Flowers	2014-02-15 08:27:39.361083-08	2014-03-13 21:07:17.825247-07	1	t	IP5-0095	B00INQO59A	799559979379 
275	One Bite Leads to Another	Made For Me	\N	product_pictures/One Bite Leads to Another_2.jpg	product_pictures/iPhone2.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	one-bite-leads-to-another	Hottest Designs	2014-02-15 08:27:39.446275-08	2014-03-13 21:07:17.593998-07	1	t	IP5-0056	B00INLR6VY	799559978983 
261	Painted Leopard	Made For Me	\N	product_pictures/Painted Leopard_2.jpg	product_pictures/iPhone3.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	painted-leopard	Animals	2014-02-15 08:27:39.400438-08	2014-03-13 21:07:17.618687-07	1	t	IP5-0060	B00INNOZA2	799559979027 
341	Tribal Cross			product_pictures/Tribal Cross_2_1.jpg			25	\N	Light	f	f	tribal-cross		2014-03-13 21:12:24.588306-07	2014-03-14 05:41:06.746624-07	1	t	IP5-0087	B00INQ9X7O	799559979294
287	Abstract Flowers and Feathers	Made For Me		product_pictures/Abstract Flowers and Feathers_2.jpg	product_pictures/iPhone1.jpg	product_pictures/iPhone3.jpg	25	\N		t	t	abstract-flowers-and-feathers	Hottest Designs	2014-02-15 08:27:39.484395-08	2014-03-14 05:56:55.960158-07	1	t	IP5-0001	B00IMQKRM0	799559978433
284	Don't Worry Be Happy (Black)	Made For Me	\N	product_pictures/Don't Worry Be Happy (Black)_2.jpg	product_pictures/iPhone4.jpg	product_pictures/iPhone4.jpg	25	\N		t	t	dont-worry-be-happy-black	Hottest Designs	2014-02-15 08:27:39.475252-08	2014-03-14 05:56:56.004344-07	1	t	IP5-0022	B00INIJ8W2	799559978648 
\.


--
-- Data for Name: products_product_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_product_colors (id, product_id, color_id) FROM stdin;
92	266	82
93	268	82
95	271	82
96	274	82
97	275	82
98	284	82
99	296	82
100	298	82
101	299	82
102	303	82
103	309	82
104	315	82
105	322	82
106	336	82
107	337	82
109	248	83
110	269	83
112	301	83
113	304	83
114	318	83
115	244	84
116	250	84
117	301	84
118	313	84
119	327	84
120	331	84
121	256	85
123	285	85
125	277	86
126	278	86
127	324	86
128	265	87
129	271	87
130	272	87
131	273	87
132	276	87
133	285	87
134	296	87
135	297	87
136	299	87
137	312	87
138	319	87
139	291	88
141	246	89
142	250	89
143	253	89
145	289	89
146	320	89
147	326	89
148	328	89
149	329	89
150	340	89
151	251	90
152	252	90
153	257	90
155	260	90
156	264	90
157	279	90
158	281	90
159	289	90
160	292	90
161	320	90
162	321	90
163	328	90
164	329	90
166	335	90
167	245	92
168	332	92
169	241	93
170	249	93
171	254	93
172	306	93
173	308	93
174	310	93
175	242	94
176	247	94
179	261	94
180	262	94
181	263	94
182	280	94
183	283	94
184	286	94
186	288	94
187	293	94
188	294	94
189	295	94
191	305	94
192	307	94
193	314	94
194	316	94
195	323	94
196	325	94
197	334	94
200	311	82
203	243	93
204	243	87
209	339	82
210	338	84
211	338	85
213	317	88
215	287	94
216	330	85
217	300	83
219	341	82
220	282	85
221	333	90
222	302	94
223	255	94
224	259	94
225	258	90
226	270	82
227	267	89
\.


--
-- Name: products_product_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_product_colors_id_seq', 227, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_product_id_seq', 341, true);


--
-- Data for Name: products_product_ideas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_product_ideas (id, product_id, idea_id) FROM stdin;
596	338	90
598	317	101
603	287	96
604	287	90
605	287	91
606	287	102
608	300	95
609	300	90
610	300	99
611	300	103
613	341	90
626	282	104
627	282	99
631	302	90
632	302	101
633	302	102
634	302	103
638	259	99
639	259	93
640	259	102
641	259	95
646	270	90
647	270	92
648	270	98
649	270	94
650	270	103
342	241	90
343	246	90
344	247	90
345	250	90
346	268	90
347	269	90
349	271	90
350	272	90
351	273	90
352	274	90
353	275	90
354	276	90
355	277	90
356	278	90
357	279	90
358	283	90
359	284	90
360	285	90
363	291	90
364	295	90
365	296	90
366	297	90
367	298	90
368	299	90
370	301	90
372	303	90
373	307	90
374	310	90
375	320	90
376	321	90
377	324	90
378	326	90
379	327	90
380	335	90
381	336	90
382	337	90
384	241	91
385	242	91
387	244	91
388	245	91
389	246	91
390	247	91
391	248	91
392	249	91
393	250	91
394	251	91
395	252	91
396	253	91
397	254	91
398	256	91
400	273	91
402	322	91
403	309	91
404	323	91
405	265	92
406	266	92
408	268	92
409	269	92
411	273	92
412	340	92
416	305	93
417	306	93
418	307	93
419	308	93
420	310	93
421	242	94
422	244	94
423	249	94
424	251	94
425	252	94
426	253	94
427	254	94
428	263	94
429	269	94
431	280	94
432	289	94
433	292	94
434	315	94
435	327	94
436	328	94
437	329	94
440	340	94
442	256	95
443	257	95
446	260	95
447	261	95
448	264	95
449	295	95
450	296	95
451	297	95
452	298	95
453	299	95
455	301	95
456	304	95
457	319	95
458	331	95
459	263	96
460	283	96
462	293	96
463	299	97
464	301	97
465	265	98
466	266	98
467	268	98
469	271	98
470	274	98
471	275	98
472	276	98
473	284	98
474	296	98
475	297	98
476	298	98
477	299	98
478	303	98
480	312	98
481	322	98
482	241	99
483	242	99
484	247	99
485	248	99
486	249	99
487	250	99
488	251	99
489	252	99
491	261	99
492	262	99
493	266	99
495	277	99
496	278	99
498	284	99
499	285	99
500	293	99
501	299	99
503	301	99
504	304	99
505	305	99
506	306	99
507	307	99
508	308	99
509	314	99
510	318	99
511	319	99
512	322	99
513	325	99
515	241	100
516	294	100
517	295	100
518	296	100
519	331	100
520	332	100
521	334	100
522	335	100
523	275	101
524	276	101
525	299	101
526	301	101
529	242	102
531	244	102
532	246	102
533	247	102
534	254	102
536	256	102
537	257	102
540	261	102
541	262	102
542	263	102
543	283	102
544	286	102
546	288	102
547	293	102
548	294	102
549	295	102
551	307	102
552	314	102
553	316	102
554	323	102
555	325	102
556	332	102
557	261	103
558	265	103
559	269	103
561	271	103
562	272	103
563	273	103
564	274	103
565	275	103
566	276	103
567	277	103
568	278	103
569	279	103
570	280	103
571	281	103
572	289	103
573	297	103
574	298	103
575	299	103
577	301	103
579	303	103
580	313	103
581	314	103
582	324	103
583	326	103
585	311	98
587	243	91
588	243	102
595	339	89
607	330	94
614	325	89
615	242	89
616	252	89
617	319	89
618	287	89
621	277	89
622	331	89
623	329	89
624	284	89
625	243	89
628	333	104
629	333	99
630	333	94
635	255	93
636	255	102
637	255	95
642	258	89
643	258	93
644	258	102
645	258	95
651	267	89
652	267	91
653	267	99
654	267	92
\.


--
-- Name: products_product_ideas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_product_ideas_id_seq', 654, true);


--
-- Data for Name: products_product_related_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_product_related_products (id, from_product_id, to_product_id) FROM stdin;
\.


--
-- Name: products_product_related_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_product_related_products_id_seq', 2, true);


--
-- Data for Name: products_star; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_star (id, vote, user_id, product_id) FROM stdin;
\.


--
-- Name: products_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_star_id_seq', 9, true);


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
4	https://www.google.com/accounts/o8/ud	1.AMlYA9XzPW_2sQPWtdhbT2veobSj14vJxB0J6aBKdeeuh2V1s19L6srvpVXqNw	c2ni+5bMSOM/BcZV9AdYRH6/tTU=\n	1393335836	46800	HMAC-SHA1
\.


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('social_auth_association_id_seq', 4, true);


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
1	https://www.google.com/accounts/o8/ud	1391992423	mVhfx42UpuGCEg
2	https://www.google.com/accounts/o8/ud	1391992444	cUmyBkyU44H6Jg
3	https://www.google.com/accounts/o8/ud	1392819079	fMVIq-iUMqvSIQ
4	https://www.google.com/accounts/o8/ud	1393184001	xyWgimEsMf9bDw
5	https://www.google.com/accounts/o8/ud	1393184061	7uoOUY_In5ypVg
6	https://www.google.com/accounts/o8/ud	1393184115	8R7BnYKsGVrpTg
7	https://www.google.com/accounts/o8/ud	1393335840	FlWTQcZXi6fo3A
8	https://www.google.com/accounts/o8/ud	1393335862	B3WdsUAfoNFoTg
\.


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('social_auth_nonce_id_seq', 8, true);


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY social_auth_usersocialauth (id, user_id, provider, uid, extra_data) FROM stdin;
1	1	github	5514112	{"access_token": "47c927773a6459fbea64526cadb0ed283f56a87b", "expires": null, "id": 5514112}
2	2	google	aaron.lelevier@gmail.com	{}
3	3	twitter	624213633	{"access_token": "oauth_token_secret=modjMVOVeM98c097YUcsNJrrBhJgShxZvcUMCDitomGxj&oauth_token=624213633-aglWZALkb1UQYyNAUuh2lAYLTtEPtYV7GLnxb2yv", "id": 624213633}
5	1	github	6663069	{"access_token": "14f6bf302b669257e1119ad483ef457695f8b8bf", "expires": null, "id": 6663069}
6	18	google	aaron.y.lelevier@gmail.com	{}
4	4	facebook	100007697532252	{"access_token": "CAATnSRwE8oQBAObcpeWyPstVPiz50agLbZCEa5d2fIHn8OQ1tpLbs76yIVaYAXfjceteK5dExJHg6ltMWJM8XVfZCvc9p1ITBPGwzorUgTQhGZAOLEbhyuYZBK01PoW4tnnLFZBWxXJtLehmZBeZAPTpxRw6CXecDXZCuoBVp2Wj0btUZBk4ZA8HyE", "expires": "5183998", "id": "100007697532252"}
7	19	google	aaron.yy.lelevier@gmail.com	{}
\.


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('social_auth_usersocialauth_id_seq', 7, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	core	0001_initial	2014-02-01 11:45:47.272304-08
2	products	0001_initial	2014-02-01 11:45:54.247837-08
4	products	0002_auto__chg_field_idea_first_paragraph__chg_field_idea_second_paragraph	2014-02-07 06:12:28.801798-08
5	products	0003_auto	2014-02-07 07:02:43.479323-08
6	products	0004_auto__add_tag	2014-02-08 06:10:25.961348-08
7	products	0005_auto__add_star	2014-02-08 06:40:08.522427-08
8	social_auth	0001_initial	2014-02-08 09:12:07.238349-08
9	social_auth	0002_auto__add_unique_nonce_timestamp_salt_server_url__add_unique_associati	2014-02-08 09:12:07.264666-08
10	products	0006_auto__del_tag__del_ideadescriptor__del_style__del_field_idea_first_par	2014-02-10 06:00:34.364798-08
11	products	0007_auto__add_field_product_our_rating	2014-02-10 07:47:02.829234-08
12	core	0002_auto__add_flapster__add_newsletter	2014-02-11 07:04:39.178449-08
13	core	0003_auto__chg_field_flapster_newsletter	2014-02-12 06:12:12.685043-08
14	products	0008_auto__chg_field_product_image_one	2014-02-13 06:59:41.138526-08
15	products	0009_auto__add_field_product_available__add_field_idea_available	2014-02-14 05:57:24.22508-08
16	products	0010_auto__add_field_product_SKU__add_field_product_UPC	2014-03-07 07:20:10.104431-08
17	products	0011_auto__del_field_product_UPC__add_field_product_ASIN	2014-03-12 06:10:11.587717-07
18	products	0012_auto__add_field_product_UPC	2014-03-13 07:54:23.703133-07
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 18, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: core_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY core_contact
    ADD CONSTRAINT core_contact_pkey PRIMARY KEY (id);


--
-- Name: core_flapster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY core_flapster
    ADD CONSTRAINT core_flapster_pkey PRIMARY KEY (id);


--
-- Name: core_newsletter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY core_newsletter
    ADD CONSTRAINT core_newsletter_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: products_color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_color
    ADD CONSTRAINT products_color_pkey PRIMARY KEY (id);


--
-- Name: products_idea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_idea
    ADD CONSTRAINT products_idea_pkey PRIMARY KEY (id);


--
-- Name: products_product_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_product_colors
    ADD CONSTRAINT products_product_colors_pkey PRIMARY KEY (id);


--
-- Name: products_product_colors_product_id_2feada0438a82920_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_product_colors
    ADD CONSTRAINT products_product_colors_product_id_2feada0438a82920_uniq UNIQUE (product_id, color_id);


--
-- Name: products_product_ideas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_product_ideas
    ADD CONSTRAINT products_product_ideas_pkey PRIMARY KEY (id);


--
-- Name: products_product_ideas_product_id_f0ac9acc89112fa_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_product_ideas
    ADD CONSTRAINT products_product_ideas_product_id_f0ac9acc89112fa_uniq UNIQUE (product_id, idea_id);


--
-- Name: products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_product_related__from_product_id_21239c28dfac8ecb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_product_related_products
    ADD CONSTRAINT products_product_related__from_product_id_21239c28dfac8ecb_uniq UNIQUE (from_product_id, to_product_id);


--
-- Name: products_product_related_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_product_related_products
    ADD CONSTRAINT products_product_related_products_pkey PRIMARY KEY (id);


--
-- Name: products_star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products_star
    ADD CONSTRAINT products_star_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association_handle_693a924207fa6ae_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_handle_693a924207fa6ae_uniq UNIQUE (handle, server_url);


--
-- Name: social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_timestamp_3833ba21ef52524a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_timestamp_3833ba21ef52524a_uniq UNIQUE ("timestamp", salt, server_url);


--
-- Name: social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_provider_2f763109e2c4a1fb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_2f763109e2c4a1fb_uniq UNIQUE (provider, uid);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: core_flapster_newsletter_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX core_flapster_newsletter_id ON core_flapster USING btree (newsletter_id);


--
-- Name: core_flapster_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX core_flapster_user_id ON core_flapster USING btree (user_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: products_color_slug; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_color_slug ON products_color USING btree (slug);


--
-- Name: products_color_slug_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_color_slug_like ON products_color USING btree (slug varchar_pattern_ops);


--
-- Name: products_idea_slug; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_idea_slug ON products_idea USING btree (slug);


--
-- Name: products_idea_slug_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_idea_slug_like ON products_idea USING btree (slug varchar_pattern_ops);


--
-- Name: products_product_colors_color_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_product_colors_color_id ON products_product_colors USING btree (color_id);


--
-- Name: products_product_colors_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_product_colors_product_id ON products_product_colors USING btree (product_id);


--
-- Name: products_product_idea_one; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_product_idea_one ON products_product USING btree (idea_one);


--
-- Name: products_product_idea_one_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_product_idea_one_like ON products_product USING btree (idea_one varchar_pattern_ops);


--
-- Name: products_product_ideas_idea_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_product_ideas_idea_id ON products_product_ideas USING btree (idea_id);


--
-- Name: products_product_ideas_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_product_ideas_product_id ON products_product_ideas USING btree (product_id);


--
-- Name: products_product_related_products_from_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_product_related_products_from_product_id ON products_product_related_products USING btree (from_product_id);


--
-- Name: products_product_related_products_to_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX products_product_related_products_to_product_id ON products_product_related_products USING btree (to_product_id);


--
-- Name: social_auth_association_issued; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX social_auth_association_issued ON social_auth_association USING btree (issued);


--
-- Name: social_auth_nonce_timestamp; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX social_auth_nonce_timestamp ON social_auth_nonce USING btree ("timestamp");


--
-- Name: social_auth_usersocialauth_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX social_auth_usersocialauth_user_id ON social_auth_usersocialauth USING btree (user_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: color_id_refs_id_d00a5d3c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_product_colors
    ADD CONSTRAINT color_id_refs_id_d00a5d3c FOREIGN KEY (color_id) REFERENCES products_color(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: from_product_id_refs_id_49068fda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_product_related_products
    ADD CONSTRAINT from_product_id_refs_id_49068fda FOREIGN KEY (from_product_id) REFERENCES products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: idea_id_refs_id_b3d2adb8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_product_ideas
    ADD CONSTRAINT idea_id_refs_id_b3d2adb8 FOREIGN KEY (idea_id) REFERENCES products_idea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsletter_id_refs_id_993ea9e3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_flapster
    ADD CONSTRAINT newsletter_id_refs_id_993ea9e3 FOREIGN KEY (newsletter_id) REFERENCES core_newsletter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_id_refs_id_19eab9d3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_product_ideas
    ADD CONSTRAINT product_id_refs_id_19eab9d3 FOREIGN KEY (product_id) REFERENCES products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_id_refs_id_b0848b0b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_product_colors
    ADD CONSTRAINT product_id_refs_id_b0848b0b FOREIGN KEY (product_id) REFERENCES products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: to_product_id_refs_id_49068fda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_product_related_products
    ADD CONSTRAINT to_product_id_refs_id_49068fda FOREIGN KEY (to_product_id) REFERENCES products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c9d86e47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_flapster
    ADD CONSTRAINT user_id_refs_id_c9d86e47 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_e6cbdf29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT user_id_refs_id_e6cbdf29 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

