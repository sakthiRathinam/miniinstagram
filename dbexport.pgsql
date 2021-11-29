--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

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
-- Name: ERP_address; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_address" (
    id integer NOT NULL,
    street character varying(300),
    city character varying(100),
    state character varying(50),
    pincode integer,
    lat character varying(15),
    lon character varying(15),
    country character varying(50),
    CONSTRAINT "ERP_address_pincode_check" CHECK ((pincode >= 0))
);


ALTER TABLE public."ERP_address" OWNER TO sakthi;

--
-- Name: ERP_address_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_address_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_address_id_seq" OWNER TO sakthi;

--
-- Name: ERP_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_address_id_seq" OWNED BY public."ERP_address".id;


--
-- Name: ERP_apiusage; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_apiusage" (
    id integer NOT NULL,
    count integer NOT NULL,
    month integer NOT NULL,
    api_id integer NOT NULL,
    CONSTRAINT "ERP_apiusage_count_check" CHECK ((count >= 0)),
    CONSTRAINT "ERP_apiusage_month_check" CHECK ((month >= 0))
);


ALTER TABLE public."ERP_apiusage" OWNER TO sakthi;

--
-- Name: ERP_apiusage_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_apiusage_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_apiusage_id_seq" OWNER TO sakthi;

--
-- Name: ERP_apiusage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_apiusage_id_seq" OWNED BY public."ERP_apiusage".id;


--
-- Name: ERP_application; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_application" (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    icon character varying(200),
    "haveCss" boolean NOT NULL,
    "haveJs" boolean NOT NULL,
    "inMenu" boolean NOT NULL,
    description character varying(500) NOT NULL,
    index integer,
    "displayName" character varying(30),
    "canConfigure_id" integer,
    module_id integer,
    CONSTRAINT "ERP_application_index_check" CHECK ((index >= 0))
);


ALTER TABLE public."ERP_application" OWNER TO sakthi;

--
-- Name: ERP_application_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_application_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_application_id_seq" OWNER TO sakthi;

--
-- Name: ERP_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_application_id_seq" OWNED BY public."ERP_application".id;


--
-- Name: ERP_application_owners; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_application_owners" (
    id integer NOT NULL,
    application_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."ERP_application_owners" OWNER TO sakthi;

--
-- Name: ERP_application_owners_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_application_owners_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_application_owners_id_seq" OWNER TO sakthi;

--
-- Name: ERP_application_owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_application_owners_id_seq" OWNED BY public."ERP_application_owners".id;


--
-- Name: ERP_appsettingsfield; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_appsettingsfield" (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    flag boolean NOT NULL,
    value character varying(5000),
    description character varying(500) NOT NULL,
    "fieldType" character varying(5) NOT NULL,
    app_id integer
);


ALTER TABLE public."ERP_appsettingsfield" OWNER TO sakthi;

--
-- Name: ERP_appsettingsfield_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_appsettingsfield_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_appsettingsfield_id_seq" OWNER TO sakthi;

--
-- Name: ERP_appsettingsfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_appsettingsfield_id_seq" OWNED BY public."ERP_appsettingsfield".id;


--
-- Name: ERP_device; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_device" (
    id integer NOT NULL,
    "sshKey" character varying(500),
    created timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public."ERP_device" OWNER TO sakthi;

--
-- Name: ERP_device_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_device_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_device_id_seq" OWNER TO sakthi;

--
-- Name: ERP_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_device_id_seq" OWNED BY public."ERP_device".id;


--
-- Name: ERP_grouppermission; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_grouppermission" (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    app_id integer NOT NULL,
    "givenBy_id" integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public."ERP_grouppermission" OWNER TO sakthi;

--
-- Name: ERP_grouppermission_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_grouppermission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_grouppermission_id_seq" OWNER TO sakthi;

--
-- Name: ERP_grouppermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_grouppermission_id_seq" OWNED BY public."ERP_grouppermission".id;


--
-- Name: ERP_media; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_media" (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    link text,
    attachment character varying(100),
    "mediaType" character varying(30) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."ERP_media" OWNER TO sakthi;

--
-- Name: ERP_media_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_media_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_media_id_seq" OWNER TO sakthi;

--
-- Name: ERP_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_media_id_seq" OWNED BY public."ERP_media".id;


--
-- Name: ERP_module; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_module" (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(500) NOT NULL,
    icon character varying(20),
    "haveCss" boolean NOT NULL,
    "haveJs" boolean NOT NULL
);


ALTER TABLE public."ERP_module" OWNER TO sakthi;

--
-- Name: ERP_module_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_module_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_module_id_seq" OWNER TO sakthi;

--
-- Name: ERP_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_module_id_seq" OWNED BY public."ERP_module".id;


--
-- Name: ERP_permission; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_permission" (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    app_id integer NOT NULL,
    "givenBy_id" integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."ERP_permission" OWNER TO sakthi;

--
-- Name: ERP_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_permission_id_seq" OWNER TO sakthi;

--
-- Name: ERP_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_permission_id_seq" OWNED BY public."ERP_permission".id;


--
-- Name: ERP_profile; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_profile" (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."ERP_profile" OWNER TO sakthi;

--
-- Name: ERP_profile_devices; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_profile_devices" (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    device_id integer NOT NULL
);


ALTER TABLE public."ERP_profile_devices" OWNER TO sakthi;

--
-- Name: ERP_profile_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_profile_devices_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_profile_devices_id_seq" OWNER TO sakthi;

--
-- Name: ERP_profile_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_profile_devices_id_seq" OWNED BY public."ERP_profile_devices".id;


--
-- Name: ERP_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_profile_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_profile_id_seq" OWNER TO sakthi;

--
-- Name: ERP_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_profile_id_seq" OWNED BY public."ERP_profile".id;


--
-- Name: ERP_publicapikeys; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_publicapikeys" (
    id integer NOT NULL,
    active boolean NOT NULL,
    key character varying(30) NOT NULL,
    created timestamp with time zone NOT NULL,
    "usageRemaining" integer NOT NULL,
    admin_id integer NOT NULL,
    app_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT "ERP_publicapikeys_usageRemaining_check" CHECK (("usageRemaining" >= 0))
);


ALTER TABLE public."ERP_publicapikeys" OWNER TO sakthi;

--
-- Name: ERP_publicapikeys_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_publicapikeys_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_publicapikeys_id_seq" OWNER TO sakthi;

--
-- Name: ERP_publicapikeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_publicapikeys_id_seq" OWNED BY public."ERP_publicapikeys".id;


--
-- Name: ERP_service; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."ERP_service" (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    name character varying(100) NOT NULL,
    mobile character varying(20),
    telephone character varying(20),
    about text,
    cin character varying(100),
    tin character varying(100),
    logo character varying(200),
    web text,
    address_id integer,
    "contactPerson_id" integer,
    doc_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public."ERP_service" OWNER TO sakthi;

--
-- Name: ERP_service_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."ERP_service_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ERP_service_id_seq" OWNER TO sakthi;

--
-- Name: ERP_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."ERP_service_id_seq" OWNED BY public."ERP_service".id;


--
-- Name: PIM_settings; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."PIM_settings" (
    id integer NOT NULL,
    presence character varying(15) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."PIM_settings" OWNER TO sakthi;

--
-- Name: PIM_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."PIM_settings_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PIM_settings_id_seq" OWNER TO sakthi;

--
-- Name: PIM_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."PIM_settings_id_seq" OWNED BY public."PIM_settings".id;


--
-- Name: PIM_theme; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public."PIM_theme" (
    id integer NOT NULL,
    main character varying(10),
    highlight character varying(10),
    background character varying(10),
    "backgroundImg" character varying(100),
    parent_id integer NOT NULL
);


ALTER TABLE public."PIM_theme" OWNER TO sakthi;

--
-- Name: PIM_theme_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public."PIM_theme_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PIM_theme_id_seq" OWNER TO sakthi;

--
-- Name: PIM_theme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public."PIM_theme_id_seq" OWNED BY public."PIM_theme".id;


--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO sakthi;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO sakthi;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO sakthi;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO sakthi;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO sakthi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO sakthi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO sakthi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO sakthi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO sakthi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO sakthi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO sakthi;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO sakthi;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO sakthi;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO sakthi;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO sakthi;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO sakthi;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: corsheaders_corsmodel; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.corsheaders_corsmodel (
    id integer NOT NULL,
    cors character varying(255) NOT NULL
);


ALTER TABLE public.corsheaders_corsmodel OWNER TO sakthi;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.corsheaders_corsmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.corsheaders_corsmodel_id_seq OWNER TO sakthi;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.corsheaders_corsmodel_id_seq OWNED BY public.corsheaders_corsmodel.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sakthi
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


ALTER TABLE public.django_admin_log OWNER TO sakthi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO sakthi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO sakthi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO sakthi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO sakthi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO sakthi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO sakthi;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO sakthi;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO sakthi;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: online_users_onlineuseractivity; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.online_users_onlineuseractivity (
    id integer NOT NULL,
    last_activity timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.online_users_onlineuseractivity OWNER TO sakthi;

--
-- Name: online_users_onlineuseractivity_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.online_users_onlineuseractivity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.online_users_onlineuseractivity_id_seq OWNER TO sakthi;

--
-- Name: online_users_onlineuseractivity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.online_users_onlineuseractivity_id_seq OWNED BY public.online_users_onlineuseractivity.id;


--
-- Name: prescriptionapp_appointments; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_appointments (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    requesteddate date,
    accepteddate date,
    acceptedtime character varying(300),
    requestedtime character varying(300),
    status character varying(300) NOT NULL,
    clinic_id integer,
    doctor_id integer NOT NULL,
    requesteduser_id integer NOT NULL,
    reason text,
    "requestedTime" time without time zone
);


ALTER TABLE public.prescriptionapp_appointments OWNER TO sakthi;

--
-- Name: prescriptionapp_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_appointments_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_appointments_id_seq OWNED BY public.prescriptionapp_appointments.id;


--
-- Name: prescriptionapp_chatmessage; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_chatmessage (
    id integer NOT NULL,
    message text,
    created timestamp with time zone NOT NULL,
    "msgType" character varying(200) NOT NULL,
    attachment character varying(100),
    "fileType" character varying(200),
    "fileSize" character varying(200),
    "fileName" character varying(200),
    sender_id integer,
    "clinicThread_id" integer,
    "doctorThread_id" integer,
    is_clinic boolean NOT NULL
);


ALTER TABLE public.prescriptionapp_chatmessage OWNER TO sakthi;

--
-- Name: prescriptionapp_chatmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_chatmessage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_chatmessage_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_chatmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_chatmessage_id_seq OWNED BY public.prescriptionapp_chatmessage.id;


--
-- Name: prescriptionapp_chatmessageread; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_chatmessageread (
    id integer NOT NULL,
    read boolean NOT NULL,
    "chatMessage_id" integer,
    participant_id integer
);


ALTER TABLE public.prescriptionapp_chatmessageread OWNER TO sakthi;

--
-- Name: prescriptionapp_chatmessageread_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_chatmessageread_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_chatmessageread_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_chatmessageread_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_chatmessageread_id_seq OWNED BY public.prescriptionapp_chatmessageread.id;


--
-- Name: prescriptionapp_clinic; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_clinic (
    id integer NOT NULL,
    type character varying(300) NOT NULL,
    "displayPicture" character varying(100),
    mobile character varying(14),
    gstin character varying(25),
    "companyName" character varying(100),
    "notificationId" character varying(250),
    address character varying(200),
    pincode character varying(10),
    state character varying(10),
    city character varying(10),
    "firstEmergencyContactNo" character varying(14),
    "secondEmergencyContactNo" character varying(14),
    uniqueid character varying(200),
    lat character varying(200),
    long character varying(200),
    "isClinicVerified" boolean NOT NULL,
    startingtime time without time zone,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    owner_in boolean NOT NULL,
    closingtime time without time zone,
    owner_id integer NOT NULL,
    inventory_id integer,
    "inventoryIncluded" boolean NOT NULL,
    working_hours character varying(200)[],
    offical_email character varying(100)
);


ALTER TABLE public.prescriptionapp_clinic OWNER TO sakthi;

--
-- Name: prescriptionapp_clinic_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_clinic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_clinic_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_clinic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_clinic_id_seq OWNED BY public.prescriptionapp_clinic.id;


--
-- Name: prescriptionapp_clinicgroupthread; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_clinicgroupthread (
    id integer NOT NULL,
    uid text,
    created timestamp with time zone NOT NULL,
    clinic_id integer NOT NULL,
    "forUser_id" integer NOT NULL,
    clinictitle character varying(200),
    customertitle character varying(200)
);


ALTER TABLE public.prescriptionapp_clinicgroupthread OWNER TO sakthi;

--
-- Name: prescriptionapp_clinicgroupthread_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_clinicgroupthread_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_clinicgroupthread_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_clinicgroupthread_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_clinicgroupthread_id_seq OWNED BY public.prescriptionapp_clinicgroupthread.id;


--
-- Name: prescriptionapp_disease; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_disease (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(300),
    description text
);


ALTER TABLE public.prescriptionapp_disease OWNER TO sakthi;

--
-- Name: prescriptionapp_disease_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_disease_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_disease_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_disease_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_disease_id_seq OWNED BY public.prescriptionapp_disease.id;


--
-- Name: prescriptionapp_doctorthread; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_doctorthread (
    id integer NOT NULL,
    doctortitle character varying(200),
    customertitle character varying(200),
    uid text,
    created timestamp with time zone NOT NULL,
    doctor_id integer NOT NULL,
    "forUser_id" integer NOT NULL
);


ALTER TABLE public.prescriptionapp_doctorthread OWNER TO sakthi;

--
-- Name: prescriptionapp_doctorthread_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_doctorthread_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_doctorthread_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_doctorthread_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_doctorthread_id_seq OWNED BY public.prescriptionapp_doctorthread.id;


--
-- Name: prescriptionapp_doctortimings; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_doctortimings (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    timings character varying(200)[],
    type character varying(300),
    doctorshift_id integer NOT NULL
);


ALTER TABLE public.prescriptionapp_doctortimings OWNER TO sakthi;

--
-- Name: prescriptionapp_doctortimings_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_doctortimings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_doctortimings_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_doctortimings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_doctortimings_id_seq OWNED BY public.prescriptionapp_doctortimings.id;


--
-- Name: prescriptionapp_inventory; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_inventory (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(200)
);


ALTER TABLE public.prescriptionapp_inventory OWNER TO sakthi;

--
-- Name: prescriptionapp_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_inventory_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_inventory_id_seq OWNED BY public.prescriptionapp_inventory.id;


--
-- Name: prescriptionapp_inventorycategory; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_inventorycategory (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(500),
    inventory_id integer
);


ALTER TABLE public.prescriptionapp_inventorycategory OWNER TO sakthi;

--
-- Name: prescriptionapp_inventorycategory_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_inventorycategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_inventorycategory_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_inventorycategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_inventorycategory_id_seq OWNED BY public.prescriptionapp_inventorycategory.id;


--
-- Name: prescriptionapp_inventoryorders; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_inventoryorders (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    amount double precision NOT NULL,
    comment text,
    discount double precision NOT NULL,
    expected_arriving date,
    inventory_id integer,
    order_details text,
    status character varying(300),
    from_contact character varying(200),
    "from_contactNo" character varying(200)
);


ALTER TABLE public.prescriptionapp_inventoryorders OWNER TO sakthi;

--
-- Name: prescriptionapp_inventoryorders_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_inventoryorders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_inventoryorders_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_inventoryorders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_inventoryorders_id_seq OWNED BY public.prescriptionapp_inventoryorders.id;


--
-- Name: prescriptionapp_inventoryorders_items; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_inventoryorders_items (
    id integer NOT NULL,
    inventoryorders_id integer NOT NULL,
    subinventories_id integer NOT NULL
);


ALTER TABLE public.prescriptionapp_inventoryorders_items OWNER TO sakthi;

--
-- Name: prescriptionapp_inventoryorders_ordered_items_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_inventoryorders_ordered_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_inventoryorders_ordered_items_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_inventoryorders_ordered_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_inventoryorders_ordered_items_id_seq OWNED BY public.prescriptionapp_inventoryorders_items.id;


--
-- Name: prescriptionapp_issuedprescription; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_issuedprescription (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    issued_date date,
    clinic_id integer NOT NULL,
    prescription_id integer NOT NULL
);


ALTER TABLE public.prescriptionapp_issuedprescription OWNER TO sakthi;

--
-- Name: prescriptionapp_issuedprescription_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_issuedprescription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_issuedprescription_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_issuedprescription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_issuedprescription_id_seq OWNED BY public.prescriptionapp_issuedprescription.id;


--
-- Name: prescriptionapp_items; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_items (
    id integer NOT NULL
);


ALTER TABLE public.prescriptionapp_items OWNER TO sakthi;

--
-- Name: prescriptionapp_items_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_items_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_items_id_seq OWNED BY public.prescriptionapp_items.id;


--
-- Name: prescriptionapp_medicine; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_medicine (
    id integer NOT NULL,
    type character varying(300),
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(300),
    uses text,
    category character varying(300),
    marketprice double precision NOT NULL,
    prescription_required boolean NOT NULL,
    maxretailprice double precision NOT NULL,
    is_verified boolean NOT NULL,
    variants character varying(200)[],
    brand character varying(300)
);


ALTER TABLE public.prescriptionapp_medicine OWNER TO sakthi;

--
-- Name: prescriptionapp_medicine_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_medicine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_medicine_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_medicine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_medicine_id_seq OWNED BY public.prescriptionapp_medicine.id;


--
-- Name: prescriptionapp_medicinetimes; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_medicinetimes (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    "specifiedTime" double precision NOT NULL,
    type character varying(100),
    "fromDate" date,
    "toDate" date,
    days integer NOT NULL,
    after_food boolean NOT NULL,
    morning_count integer NOT NULL,
    afternoon_count integer NOT NULL,
    night_count integer NOT NULL,
    qty_per_time integer NOT NULL,
    total_qty integer NOT NULL,
    medicine_id integer,
    command text,
    variant character varying(300),
    CONSTRAINT prescriptionapp_medicinetimes_afternoon_count_check CHECK ((afternoon_count >= 0)),
    CONSTRAINT prescriptionapp_medicinetimes_days_check CHECK ((days >= 0)),
    CONSTRAINT prescriptionapp_medicinetimes_morning_count_check CHECK ((morning_count >= 0)),
    CONSTRAINT prescriptionapp_medicinetimes_night_count_check CHECK ((night_count >= 0)),
    CONSTRAINT prescriptionapp_medicinetimes_qty_per_time_check CHECK ((qty_per_time >= 0)),
    CONSTRAINT prescriptionapp_medicinetimes_total_qty_check CHECK ((total_qty >= 0))
);


ALTER TABLE public.prescriptionapp_medicinetimes OWNER TO sakthi;

--
-- Name: prescriptionapp_medicinetimes_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_medicinetimes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_medicinetimes_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_medicinetimes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_medicinetimes_id_seq OWNED BY public.prescriptionapp_medicinetimes.id;


--
-- Name: prescriptionapp_prescription; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_prescription (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    disease character varying(300),
    doctor_fees double precision NOT NULL,
    gst_percentage double precision NOT NULL,
    gst_required boolean NOT NULL,
    health_issues character varying(300),
    ongoing_treatment character varying(300),
    active boolean NOT NULL,
    clinic_id integer,
    doctor_id integer NOT NULL,
    "forUser_id" integer NOT NULL,
    sex character varying(100),
    age integer NOT NULL,
    appointment_id integer,
    next_visit date,
    new_disease_id integer,
    CONSTRAINT prescriptionapp_prescription_age_check CHECK ((age >= 0))
);


ALTER TABLE public.prescriptionapp_prescription OWNER TO sakthi;

--
-- Name: prescriptionapp_prescription_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_prescription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_prescription_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_prescription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_prescription_id_seq OWNED BY public.prescriptionapp_prescription.id;


--
-- Name: prescriptionapp_prescription_medicines; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_prescription_medicines (
    id integer NOT NULL,
    prescription_id integer NOT NULL,
    medicinetimes_id integer NOT NULL
);


ALTER TABLE public.prescriptionapp_prescription_medicines OWNER TO sakthi;

--
-- Name: prescriptionapp_prescription_medicines_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_prescription_medicines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_prescription_medicines_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_prescription_medicines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_prescription_medicines_id_seq OWNED BY public.prescriptionapp_prescription_medicines.id;


--
-- Name: prescriptionapp_recopinist; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_recopinist (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    clinic_id integer NOT NULL,
    user_id integer NOT NULL,
    type character varying(300) NOT NULL,
    "fromTimeStr" character varying(300),
    "toTimeStr" character varying(300)
);


ALTER TABLE public.prescriptionapp_recopinist OWNER TO sakthi;

--
-- Name: prescriptionapp_recopinist_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_recopinist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_recopinist_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_recopinist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_recopinist_id_seq OWNED BY public.prescriptionapp_recopinist.id;


--
-- Name: prescriptionapp_solditems; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_solditems (
    id integer NOT NULL,
    contact_details character varying(500),
    contact_no character varying(500),
    date date,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    total double precision NOT NULL,
    discount integer NOT NULL,
    inventory_id integer,
    CONSTRAINT prescriptionapp_solditems_discount_check CHECK ((discount >= 0))
);


ALTER TABLE public.prescriptionapp_solditems OWNER TO sakthi;

--
-- Name: prescriptionapp_solditems_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_solditems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_solditems_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_solditems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_solditems_id_seq OWNED BY public.prescriptionapp_solditems.id;


--
-- Name: prescriptionapp_solditems_items; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_solditems_items (
    id integer NOT NULL,
    solditems_id integer NOT NULL,
    soldsubs_id integer NOT NULL
);


ALTER TABLE public.prescriptionapp_solditems_items OWNER TO sakthi;

--
-- Name: prescriptionapp_solditems_items_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_solditems_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_solditems_items_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_solditems_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_solditems_items_id_seq OWNED BY public.prescriptionapp_solditems_items.id;


--
-- Name: prescriptionapp_soldsubs; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_soldsubs (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    quantity double precision NOT NULL,
    submain_id integer,
    sold_total double precision NOT NULL
);


ALTER TABLE public.prescriptionapp_soldsubs OWNER TO sakthi;

--
-- Name: prescriptionapp_soldsubs_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_soldsubs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_soldsubs_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_soldsubs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_soldsubs_id_seq OWNED BY public.prescriptionapp_soldsubs.id;


--
-- Name: prescriptionapp_subinventories; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_subinventories (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    maxretailprice double precision NOT NULL,
    quantity integer NOT NULL,
    number_of_boxes integer NOT NULL,
    number_of_medicines integer NOT NULL,
    number_of_strips integer NOT NULL,
    expiry_date date,
    type character varying(300),
    category_id integer,
    is_added boolean NOT NULL,
    CONSTRAINT prescriptionapp_subinventories_number_of_boxes_check CHECK ((number_of_boxes >= 0)),
    CONSTRAINT prescriptionapp_subinventories_number_of_medicines_check CHECK ((number_of_medicines >= 0)),
    CONSTRAINT prescriptionapp_subinventories_number_of_strips_check CHECK ((number_of_strips >= 0)),
    CONSTRAINT prescriptionapp_subinventories_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.prescriptionapp_subinventories OWNER TO sakthi;

--
-- Name: prescriptionapp_subinventories_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_subinventories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_subinventories_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_subinventories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_subinventories_id_seq OWNED BY public.prescriptionapp_subinventories.id;


--
-- Name: prescriptionapp_submain; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_submain (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(300),
    price double precision NOT NULL,
    type character varying(300),
    category_id integer,
    medicine_id integer,
    min_quantity integer NOT NULL,
    total_quantity integer NOT NULL,
    medicines_per_strips double precision NOT NULL,
    strips_per_boxes double precision NOT NULL,
    CONSTRAINT prescriptionapp_submain_min_quantity_check CHECK ((min_quantity >= 0)),
    CONSTRAINT prescriptionapp_submain_total_quantity_check CHECK ((total_quantity >= 0))
);


ALTER TABLE public.prescriptionapp_submain OWNER TO sakthi;

--
-- Name: prescriptionapp_submain_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_submain_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_submain_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_submain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_submain_id_seq OWNED BY public.prescriptionapp_submain.id;


--
-- Name: prescriptionapp_workinghours; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.prescriptionapp_workinghours (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    "fromTime" double precision NOT NULL,
    "toTime" double precision NOT NULL,
    active boolean NOT NULL,
    "fromTimeStr" character varying(300),
    "toTimeStr" character varying(300),
    clinic_id integer NOT NULL,
    doctor_id integer NOT NULL,
    "baseFees" integer NOT NULL,
    timings boolean NOT NULL,
    CONSTRAINT "prescriptionapp_workinghours_baseFees_check" CHECK (("baseFees" >= 0))
);


ALTER TABLE public.prescriptionapp_workinghours OWNER TO sakthi;

--
-- Name: prescriptionapp_workinghours_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.prescriptionapp_workinghours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptionapp_workinghours_id_seq OWNER TO sakthi;

--
-- Name: prescriptionapp_workinghours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.prescriptionapp_workinghours_id_seq OWNED BY public.prescriptionapp_workinghours.id;


--
-- Name: profiles_accountskey; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.profiles_accountskey (
    id integer NOT NULL,
    activation_key character varying(40) NOT NULL,
    key_expires timestamp with time zone NOT NULL,
    "keyType" character varying(15) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.profiles_accountskey OWNER TO sakthi;

--
-- Name: profiles_accountskey_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.profiles_accountskey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_accountskey_id_seq OWNER TO sakthi;

--
-- Name: profiles_accountskey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.profiles_accountskey_id_seq OWNED BY public.profiles_accountskey.id;


--
-- Name: profiles_payment; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.profiles_payment (
    id integer NOT NULL,
    status character varying(200),
    subscription character varying(200),
    order_id character varying(300),
    payment_mode character varying(200),
    is_received boolean NOT NULL,
    amount integer NOT NULL,
    subscription_date date,
    valid_till date,
    is_cash boolean NOT NULL,
    user_id integer,
    payment_id character varying(300),
    clinic_id integer,
    CONSTRAINT profiles_payment_amount_check CHECK ((amount >= 0))
);


ALTER TABLE public.profiles_payment OWNER TO sakthi;

--
-- Name: profiles_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.profiles_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_payment_id_seq OWNER TO sakthi;

--
-- Name: profiles_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.profiles_payment_id_seq OWNED BY public.profiles_payment.id;


--
-- Name: profiles_profile; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.profiles_profile (
    id integer NOT NULL,
    "displayPicture" character varying(100),
    mobile character varying(14),
    pan character varying(25),
    "notificationId" character varying(250),
    address character varying(200),
    pincode character varying(10),
    state character varying(10),
    city character varying(10),
    "firstEmergencyContactNo" character varying(14),
    "secondEmergencyContactNo" character varying(14),
    occupation character varying(250),
    language character varying(250),
    specialization character varying(50),
    qualification character varying(50),
    uniqueid character varying(200),
    "referralCode" character varying(300),
    "walletCreated" boolean NOT NULL,
    "clinicsHandling" integer NOT NULL,
    "isDpVerified" boolean NOT NULL,
    user_id integer NOT NULL,
    health_issues character varying(300)[],
    dob date,
    blood_group character varying(300),
    CONSTRAINT "profiles_profile_clinicsHandling_check" CHECK (("clinicsHandling" >= 0))
);


ALTER TABLE public.profiles_profile OWNER TO sakthi;

--
-- Name: profiles_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.profiles_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_profile_id_seq OWNER TO sakthi;

--
-- Name: profiles_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.profiles_profile_id_seq OWNED BY public.profiles_profile.id;


--
-- Name: profiles_wallet; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.profiles_wallet (
    id integer NOT NULL,
    total_coins integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT profiles_wallet_total_coins_check CHECK ((total_coins >= 0))
);


ALTER TABLE public.profiles_wallet OWNER TO sakthi;

--
-- Name: profiles_wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.profiles_wallet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_wallet_id_seq OWNER TO sakthi;

--
-- Name: profiles_wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.profiles_wallet_id_seq OWNED BY public.profiles_wallet.id;


--
-- Name: robots_rule; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.robots_rule (
    id integer NOT NULL,
    robot character varying(255) NOT NULL,
    crawl_delay numeric(3,1)
);


ALTER TABLE public.robots_rule OWNER TO sakthi;

--
-- Name: robots_rule_allowed; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.robots_rule_allowed (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    url_id integer NOT NULL
);


ALTER TABLE public.robots_rule_allowed OWNER TO sakthi;

--
-- Name: robots_rule_allowed_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.robots_rule_allowed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.robots_rule_allowed_id_seq OWNER TO sakthi;

--
-- Name: robots_rule_allowed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.robots_rule_allowed_id_seq OWNED BY public.robots_rule_allowed.id;


--
-- Name: robots_rule_disallowed; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.robots_rule_disallowed (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    url_id integer NOT NULL
);


ALTER TABLE public.robots_rule_disallowed OWNER TO sakthi;

--
-- Name: robots_rule_disallowed_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.robots_rule_disallowed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.robots_rule_disallowed_id_seq OWNER TO sakthi;

--
-- Name: robots_rule_disallowed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.robots_rule_disallowed_id_seq OWNED BY public.robots_rule_disallowed.id;


--
-- Name: robots_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.robots_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.robots_rule_id_seq OWNER TO sakthi;

--
-- Name: robots_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.robots_rule_id_seq OWNED BY public.robots_rule.id;


--
-- Name: robots_rule_sites; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.robots_rule_sites (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.robots_rule_sites OWNER TO sakthi;

--
-- Name: robots_rule_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.robots_rule_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.robots_rule_sites_id_seq OWNER TO sakthi;

--
-- Name: robots_rule_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.robots_rule_sites_id_seq OWNED BY public.robots_rule_sites.id;


--
-- Name: robots_url; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.robots_url (
    id integer NOT NULL,
    pattern character varying(255) NOT NULL
);


ALTER TABLE public.robots_url OWNER TO sakthi;

--
-- Name: robots_url_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.robots_url_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.robots_url_id_seq OWNER TO sakthi;

--
-- Name: robots_url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.robots_url_id_seq OWNED BY public.robots_url.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO sakthi;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO sakthi;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO sakthi;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO sakthi;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO sakthi;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO sakthi;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO sakthi;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO sakthi;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: ERP_address id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_address" ALTER COLUMN id SET DEFAULT nextval('public."ERP_address_id_seq"'::regclass);


--
-- Name: ERP_apiusage id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_apiusage" ALTER COLUMN id SET DEFAULT nextval('public."ERP_apiusage_id_seq"'::regclass);


--
-- Name: ERP_application id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_application" ALTER COLUMN id SET DEFAULT nextval('public."ERP_application_id_seq"'::regclass);


--
-- Name: ERP_application_owners id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_application_owners" ALTER COLUMN id SET DEFAULT nextval('public."ERP_application_owners_id_seq"'::regclass);


--
-- Name: ERP_appsettingsfield id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_appsettingsfield" ALTER COLUMN id SET DEFAULT nextval('public."ERP_appsettingsfield_id_seq"'::regclass);


--
-- Name: ERP_device id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_device" ALTER COLUMN id SET DEFAULT nextval('public."ERP_device_id_seq"'::regclass);


--
-- Name: ERP_grouppermission id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_grouppermission" ALTER COLUMN id SET DEFAULT nextval('public."ERP_grouppermission_id_seq"'::regclass);


--
-- Name: ERP_media id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_media" ALTER COLUMN id SET DEFAULT nextval('public."ERP_media_id_seq"'::regclass);


--
-- Name: ERP_module id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_module" ALTER COLUMN id SET DEFAULT nextval('public."ERP_module_id_seq"'::regclass);


--
-- Name: ERP_permission id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_permission" ALTER COLUMN id SET DEFAULT nextval('public."ERP_permission_id_seq"'::regclass);


--
-- Name: ERP_profile id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_profile" ALTER COLUMN id SET DEFAULT nextval('public."ERP_profile_id_seq"'::regclass);


--
-- Name: ERP_profile_devices id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_profile_devices" ALTER COLUMN id SET DEFAULT nextval('public."ERP_profile_devices_id_seq"'::regclass);


--
-- Name: ERP_publicapikeys id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_publicapikeys" ALTER COLUMN id SET DEFAULT nextval('public."ERP_publicapikeys_id_seq"'::regclass);


--
-- Name: ERP_service id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_service" ALTER COLUMN id SET DEFAULT nextval('public."ERP_service_id_seq"'::regclass);


--
-- Name: PIM_settings id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."PIM_settings" ALTER COLUMN id SET DEFAULT nextval('public."PIM_settings_id_seq"'::regclass);


--
-- Name: PIM_theme id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."PIM_theme" ALTER COLUMN id SET DEFAULT nextval('public."PIM_theme_id_seq"'::regclass);


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: corsheaders_corsmodel id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.corsheaders_corsmodel ALTER COLUMN id SET DEFAULT nextval('public.corsheaders_corsmodel_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: online_users_onlineuseractivity id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.online_users_onlineuseractivity ALTER COLUMN id SET DEFAULT nextval('public.online_users_onlineuseractivity_id_seq'::regclass);


--
-- Name: prescriptionapp_appointments id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_appointments ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_appointments_id_seq'::regclass);


--
-- Name: prescriptionapp_chatmessage id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_chatmessage ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_chatmessage_id_seq'::regclass);


--
-- Name: prescriptionapp_chatmessageread id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_chatmessageread ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_chatmessageread_id_seq'::regclass);


--
-- Name: prescriptionapp_clinic id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_clinic ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_clinic_id_seq'::regclass);


--
-- Name: prescriptionapp_clinicgroupthread id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_clinicgroupthread ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_clinicgroupthread_id_seq'::regclass);


--
-- Name: prescriptionapp_disease id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_disease ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_disease_id_seq'::regclass);


--
-- Name: prescriptionapp_doctorthread id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_doctorthread ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_doctorthread_id_seq'::regclass);


--
-- Name: prescriptionapp_doctortimings id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_doctortimings ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_doctortimings_id_seq'::regclass);


--
-- Name: prescriptionapp_inventory id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventory ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_inventory_id_seq'::regclass);


--
-- Name: prescriptionapp_inventorycategory id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventorycategory ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_inventorycategory_id_seq'::regclass);


--
-- Name: prescriptionapp_inventoryorders id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventoryorders ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_inventoryorders_id_seq'::regclass);


--
-- Name: prescriptionapp_inventoryorders_items id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventoryorders_items ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_inventoryorders_ordered_items_id_seq'::regclass);


--
-- Name: prescriptionapp_issuedprescription id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_issuedprescription ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_issuedprescription_id_seq'::regclass);


--
-- Name: prescriptionapp_items id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_items ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_items_id_seq'::regclass);


--
-- Name: prescriptionapp_medicine id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_medicine ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_medicine_id_seq'::regclass);


--
-- Name: prescriptionapp_medicinetimes id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_medicinetimes ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_medicinetimes_id_seq'::regclass);


--
-- Name: prescriptionapp_prescription id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_prescription_id_seq'::regclass);


--
-- Name: prescriptionapp_prescription_medicines id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription_medicines ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_prescription_medicines_id_seq'::regclass);


--
-- Name: prescriptionapp_recopinist id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_recopinist ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_recopinist_id_seq'::regclass);


--
-- Name: prescriptionapp_solditems id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_solditems ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_solditems_id_seq'::regclass);


--
-- Name: prescriptionapp_solditems_items id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_solditems_items ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_solditems_items_id_seq'::regclass);


--
-- Name: prescriptionapp_soldsubs id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_soldsubs ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_soldsubs_id_seq'::regclass);


--
-- Name: prescriptionapp_subinventories id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_subinventories ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_subinventories_id_seq'::regclass);


--
-- Name: prescriptionapp_submain id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_submain ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_submain_id_seq'::regclass);


--
-- Name: prescriptionapp_workinghours id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_workinghours ALTER COLUMN id SET DEFAULT nextval('public.prescriptionapp_workinghours_id_seq'::regclass);


--
-- Name: profiles_accountskey id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_accountskey ALTER COLUMN id SET DEFAULT nextval('public.profiles_accountskey_id_seq'::regclass);


--
-- Name: profiles_payment id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_payment ALTER COLUMN id SET DEFAULT nextval('public.profiles_payment_id_seq'::regclass);


--
-- Name: profiles_profile id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_profile ALTER COLUMN id SET DEFAULT nextval('public.profiles_profile_id_seq'::regclass);


--
-- Name: profiles_wallet id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_wallet ALTER COLUMN id SET DEFAULT nextval('public.profiles_wallet_id_seq'::regclass);


--
-- Name: robots_rule id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule ALTER COLUMN id SET DEFAULT nextval('public.robots_rule_id_seq'::regclass);


--
-- Name: robots_rule_allowed id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_allowed ALTER COLUMN id SET DEFAULT nextval('public.robots_rule_allowed_id_seq'::regclass);


--
-- Name: robots_rule_disallowed id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_disallowed ALTER COLUMN id SET DEFAULT nextval('public.robots_rule_disallowed_id_seq'::regclass);


--
-- Name: robots_rule_sites id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_sites ALTER COLUMN id SET DEFAULT nextval('public.robots_rule_sites_id_seq'::regclass);


--
-- Name: robots_url id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_url ALTER COLUMN id SET DEFAULT nextval('public.robots_url_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: ERP_address; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_address" (id, street, city, state, pincode, lat, lon, country) FROM stdin;
\.


--
-- Data for Name: ERP_apiusage; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_apiusage" (id, count, month, api_id) FROM stdin;
\.


--
-- Data for Name: ERP_application; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_application" (id, created, name, icon, "haveCss", "haveJs", "inMenu", description, index, "displayName", "canConfigure_id", module_id) FROM stdin;
1	2021-04-13 18:55:03+05:30	app.main	/static/images/treatment.png	f	t	t	Prescriptions	1	Prescription	\N	2
4	2021-04-13 18:55:03+05:30	app.appointments	/static/images/appointments.png	f	t	t	app.appointments	1	Appointments	\N	2
5	2021-04-13 18:55:03+05:30	app.inventory	/static/images/inventorymanagement.png	f	t	t	app.inventory	1	Inventory	\N	2
9	2021-04-13 18:55:03+05:30	app.deployment	/static/images/statss.png	f	t	t	app.deployment	1	Statistics	\N	2
6	2021-04-13 18:55:03+05:30	app.management	/static/images/handpill.png	f	t	t	app.management	1	Profile	\N	2
\.


--
-- Data for Name: ERP_application_owners; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_application_owners" (id, application_id, user_id) FROM stdin;
\.


--
-- Data for Name: ERP_appsettingsfield; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_appsettingsfield" (id, created, name, flag, value, description, "fieldType", app_id) FROM stdin;
\.


--
-- Data for Name: ERP_device; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_device" (id, "sshKey", created, name) FROM stdin;
\.


--
-- Data for Name: ERP_grouppermission; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_grouppermission" (id, created, app_id, "givenBy_id", group_id) FROM stdin;
\.


--
-- Data for Name: ERP_media; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_media" (id, created, link, attachment, "mediaType", user_id) FROM stdin;
\.


--
-- Data for Name: ERP_module; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_module" (id, created, name, description, icon, "haveCss", "haveJs") FROM stdin;
1	2021-04-08 18:53:15+05:30	admin	Administration can be performed from the apps of this module	fa-user	t	t
2	2021-04-15 18:53:52+05:30	prescription	Administration can be performed from the apps of this module	fa-user	t	t
\.


--
-- Data for Name: ERP_permission; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_permission" (id, created, app_id, "givenBy_id", user_id) FROM stdin;
\.


--
-- Data for Name: ERP_profile; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_profile" (id, user_id) FROM stdin;
\.


--
-- Data for Name: ERP_profile_devices; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_profile_devices" (id, profile_id, device_id) FROM stdin;
\.


--
-- Data for Name: ERP_publicapikeys; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_publicapikeys" (id, active, key, created, "usageRemaining", admin_id, app_id, user_id) FROM stdin;
\.


--
-- Data for Name: ERP_service; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."ERP_service" (id, created, name, mobile, telephone, about, cin, tin, logo, web, address_id, "contactPerson_id", doc_id, user_id) FROM stdin;
\.


--
-- Data for Name: PIM_settings; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."PIM_settings" (id, presence, user_id) FROM stdin;
\.


--
-- Data for Name: PIM_theme; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public."PIM_theme" (id, main, highlight, background, "backgroundImg", parent_id) FROM stdin;
\.


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sakthi
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
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add wallet	8	add_wallet
30	Can change wallet	8	change_wallet
31	Can delete wallet	8	delete_wallet
32	Can view wallet	8	view_wallet
33	Can add profile	9	add_profile
34	Can change profile	9	change_profile
35	Can delete profile	9	delete_profile
36	Can view profile	9	view_profile
37	Can add accounts key	10	add_accountskey
38	Can change accounts key	10	change_accountskey
39	Can delete accounts key	10	delete_accountskey
40	Can view accounts key	10	view_accountskey
41	Can add cors model	11	add_corsmodel
42	Can change cors model	11	change_corsmodel
43	Can delete cors model	11	delete_corsmodel
44	Can view cors model	11	view_corsmodel
45	Can add email address	12	add_emailaddress
46	Can change email address	12	change_emailaddress
47	Can delete email address	12	delete_emailaddress
48	Can view email address	12	view_emailaddress
49	Can add email confirmation	13	add_emailconfirmation
50	Can change email confirmation	13	change_emailconfirmation
51	Can delete email confirmation	13	delete_emailconfirmation
52	Can view email confirmation	13	view_emailconfirmation
53	Can add social account	14	add_socialaccount
54	Can change social account	14	change_socialaccount
55	Can delete social account	14	delete_socialaccount
56	Can view social account	14	view_socialaccount
57	Can add social application	15	add_socialapp
58	Can change social application	15	change_socialapp
59	Can delete social application	15	delete_socialapp
60	Can view social application	15	view_socialapp
61	Can add social application token	16	add_socialtoken
62	Can change social application token	16	change_socialtoken
63	Can delete social application token	16	delete_socialtoken
64	Can view social application token	16	view_socialtoken
65	Can add rule	17	add_rule
66	Can change rule	17	change_rule
67	Can delete rule	17	delete_rule
68	Can view rule	17	view_rule
69	Can add url	18	add_url
70	Can change url	18	change_url
71	Can delete url	18	delete_url
72	Can view url	18	view_url
73	Can add address	19	add_address
74	Can change address	19	change_address
75	Can delete address	19	delete_address
76	Can view address	19	view_address
77	Can add application	20	add_application
78	Can change application	20	change_application
79	Can delete application	20	delete_application
80	Can view application	20	view_application
81	Can add device	21	add_device
82	Can change device	21	change_device
83	Can delete device	21	delete_device
84	Can view device	21	view_device
85	Can add media	22	add_media
86	Can change media	22	change_media
87	Can delete media	22	delete_media
88	Can view media	22	view_media
89	Can add module	23	add_module
90	Can change module	23	change_module
91	Can delete module	23	delete_module
92	Can view module	23	view_module
93	Can add service	24	add_service
94	Can change service	24	change_service
95	Can delete service	24	delete_service
96	Can view service	24	view_service
97	Can add public api keys	25	add_publicapikeys
98	Can change public api keys	25	change_publicapikeys
99	Can delete public api keys	25	delete_publicapikeys
100	Can view public api keys	25	view_publicapikeys
101	Can add profile	26	add_profile
102	Can change profile	26	change_profile
103	Can delete profile	26	delete_profile
104	Can view profile	26	view_profile
105	Can add permission	27	add_permission
106	Can change permission	27	change_permission
107	Can delete permission	27	delete_permission
108	Can view permission	27	view_permission
109	Can add group permission	28	add_grouppermission
110	Can change group permission	28	change_grouppermission
111	Can delete group permission	28	delete_grouppermission
112	Can view group permission	28	view_grouppermission
113	Can add api usage	29	add_apiusage
114	Can change api usage	29	change_apiusage
115	Can delete api usage	29	delete_apiusage
116	Can view api usage	29	view_apiusage
117	Can add app settings field	30	add_appsettingsfield
118	Can change app settings field	30	change_appsettingsfield
119	Can delete app settings field	30	delete_appsettingsfield
120	Can view app settings field	30	view_appsettingsfield
121	Can add settings	31	add_settings
122	Can change settings	31	change_settings
123	Can delete settings	31	delete_settings
124	Can view settings	31	view_settings
125	Can add theme	32	add_theme
126	Can change theme	32	change_theme
127	Can delete theme	32	delete_theme
128	Can view theme	32	view_theme
129	Can add clinic	33	add_clinic
130	Can change clinic	33	change_clinic
131	Can delete clinic	33	delete_clinic
132	Can view clinic	33	view_clinic
133	Can add inventory	34	add_inventory
134	Can change inventory	34	change_inventory
135	Can delete inventory	34	delete_inventory
136	Can view inventory	34	view_inventory
137	Can add medicine	35	add_medicine
138	Can change medicine	35	change_medicine
139	Can delete medicine	35	delete_medicine
140	Can view medicine	35	view_medicine
141	Can add medicine times	36	add_medicinetimes
142	Can change medicine times	36	change_medicinetimes
143	Can delete medicine times	36	delete_medicinetimes
144	Can view medicine times	36	view_medicinetimes
145	Can add working hours	37	add_workinghours
146	Can change working hours	37	change_workinghours
147	Can delete working hours	37	delete_workinghours
148	Can view working hours	37	view_workinghours
149	Can add sub inventories	38	add_subinventories
150	Can change sub inventories	38	change_subinventories
151	Can delete sub inventories	38	delete_subinventories
152	Can view sub inventories	38	view_subinventories
153	Can add recopinist	39	add_recopinist
154	Can change recopinist	39	change_recopinist
155	Can delete recopinist	39	delete_recopinist
156	Can view recopinist	39	view_recopinist
157	Can add prescription	40	add_prescription
158	Can change prescription	40	change_prescription
159	Can delete prescription	40	delete_prescription
160	Can view prescription	40	view_prescription
161	Can add appointments	41	add_appointments
162	Can change appointments	41	change_appointments
163	Can delete appointments	41	delete_appointments
164	Can view appointments	41	view_appointments
165	Can add sub main	42	add_submain
166	Can change sub main	42	change_submain
167	Can delete sub main	42	delete_submain
168	Can view sub main	42	view_submain
169	Can add issued prescription	43	add_issuedprescription
170	Can change issued prescription	43	change_issuedprescription
171	Can delete issued prescription	43	delete_issuedprescription
172	Can view issued prescription	43	view_issuedprescription
173	Can add group thread	44	add_groupthread
174	Can change group thread	44	change_groupthread
175	Can delete group thread	44	delete_groupthread
176	Can view group thread	44	view_groupthread
177	Can add chat message read	45	add_chatmessageread
178	Can change chat message read	45	change_chatmessageread
179	Can delete chat message read	45	delete_chatmessageread
180	Can view chat message read	45	view_chatmessageread
181	Can add chat message	46	add_chatmessage
182	Can change chat message	46	change_chatmessage
183	Can delete chat message	46	delete_chatmessage
184	Can view chat message	46	view_chatmessage
185	Can add practice	47	add_practice
186	Can change practice	47	change_practice
187	Can delete practice	47	delete_practice
188	Can view practice	47	view_practice
189	Can add clinic group thread	48	add_clinicgroupthread
190	Can change clinic group thread	48	change_clinicgroupthread
191	Can delete clinic group thread	48	delete_clinicgroupthread
192	Can view clinic group thread	48	view_clinicgroupthread
193	Can add doctor thread	49	add_doctorthread
194	Can change doctor thread	49	change_doctorthread
195	Can delete doctor thread	49	delete_doctorthread
196	Can view doctor thread	49	view_doctorthread
197	Can add doctor timings	50	add_doctortimings
198	Can change doctor timings	50	change_doctortimings
199	Can delete doctor timings	50	delete_doctortimings
200	Can view doctor timings	50	view_doctortimings
201	Can add payment	51	add_payment
202	Can change payment	51	change_payment
203	Can delete payment	51	delete_payment
204	Can view payment	51	view_payment
205	Can add disease	52	add_disease
206	Can change disease	52	change_disease
207	Can delete disease	52	delete_disease
208	Can view disease	52	view_disease
209	Can add online user activity	53	add_onlineuseractivity
210	Can change online user activity	53	change_onlineuseractivity
211	Can delete online user activity	53	delete_onlineuseractivity
212	Can view online user activity	53	view_onlineuseractivity
213	Can add inventory orders	54	add_inventoryorders
214	Can change inventory orders	54	change_inventoryorders
215	Can delete inventory orders	54	delete_inventoryorders
216	Can view inventory orders	54	view_inventoryorders
217	Can add inventory category	55	add_inventorycategory
218	Can change inventory category	55	change_inventorycategory
219	Can delete inventory category	55	delete_inventorycategory
220	Can view inventory category	55	view_inventorycategory
221	Can add sold subs	56	add_soldsubs
222	Can change sold subs	56	change_soldsubs
223	Can delete sold subs	56	delete_soldsubs
224	Can view sold subs	56	view_soldsubs
225	Can add sold items	57	add_solditems
226	Can change sold items	57	change_solditems
227	Can delete sold items	57	delete_solditems
228	Can view sold items	57	view_solditems
229	Can add items	58	add_items
230	Can change items	58	change_items
231	Can delete items	58	delete_items
232	Can view items	58	view_items
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
35	pbkdf2_sha256$180000$hJry17jJE0rz$5LV0/KeBMrjULdz8hcnNk4Ady697KVe2uBiPRmT//pI=	\N	f	7010117137	kamaraj	Mariyappan	kamraj089@gmail.com	f	t	2021-05-19 20:12:17.499279+05:30
36	pbkdf2_sha256$180000$rm4DZAz15gvL$b5YC4Y3HOhqM2hmWx6aQGA9ba6JHxSoyYH7oWrHlZXs=	\N	f	8973591775	kamaraj	Mariyappan	kamraj089@gmail.com	f	t	2021-05-19 20:13:21.929773+05:30
37	pbkdf2_sha256$180000$DXZ8qkDe7wq7$vbzpRVHPks4ZVDl5GwammQbMsPTvo/SFW9kiGEXB+2k=	2021-05-19 20:18:09.415467+05:30	f	9585858585	kamaraj	Mariyappan	kamraj089@gmail.com	f	t	2021-05-19 20:14:05.318287+05:30
50	pbkdf2_sha256$180000$Ian1Y2sjnTIn$XFjdLfYZpOCLBJu65QBXMmoMrLGZ+ThF+p2J93FOnaE=	\N	f	awefawefff	aefawwa			f	t	2021-05-22 17:48:59.205973+05:30
8		\N	f	7010117125	Repceptionist			f	t	2021-04-27 15:53:39.918249+05:30
27	pbkdf2_sha256$180000$vrjzg2ipO9J7$4dUEN2KDwgnx8q8NlP/Ioji5aHKzS6pPcVyGSXym3Xs=	\N	f	7010117179	Rep y			f	t	2021-05-13 11:07:41.86356+05:30
9		\N	f	7010117134	Remember			f	t	2021-04-27 16:39:47.258379+05:30
10		\N	f	7010117123	Annai rep			f	t	2021-04-27 16:49:00.801427+05:30
13		\N	f	7010117180	Rep 1yuhh			f	t	2021-04-27 16:52:39.80342+05:30
14		\N	f	7010117169	Rep 1rafaf			f	t	2021-04-27 16:54:00.412076+05:30
15		\N	f	7010117196	Rep 1cvv			f	t	2021-04-27 16:56:30.064155+05:30
38	pbkdf2_sha256$180000$L2pmAwQltMOX$luEWdxs6Z6jFIJJFk4Rww2ZoWTyk/T1fokApWbKDiCY=	2021-05-19 20:24:10.179228+05:30	f	9585858586	kamaraj	Mariyappan	kamraj089@gmail.com	f	t	2021-05-19 20:23:01.409082+05:30
45	pbkdf2_sha256$180000$on94pTJu4BOw$3ishxPyzlSXIEXNHOHC8aMqC7/eOdZysyNSyIKzvUaQ=	\N	f	1234554327	ayappan	swammynaidu	wefwolf@gmail.com	f	t	2021-05-21 14:24:26.359802+05:30
53	pbkdf2_sha256$180000$xJ26clK8wAld$fSWrS5+DIMVin5KCIDr5/9yUvQE9+DuqJmikqw7XGg0=	2021-05-25 13:42:36.972812+05:30	f	3434343443	monster	corona	monster@gmail.com	f	t	2021-05-25 13:20:46.879016+05:30
16		\N	f	5858585858	Repception			f	t	2021-04-27 19:36:48.708661+05:30
55	pbkdf2_sha256$180000$Dltx0YMoKYEo$36oetRcltF52jpXaHZvt1c4ZvwUOLsl+i56WZUubZbk=	\N	f	bomm bomm	ewfdfonster corona we	awefawef	awefeawf@gmail.com	f	t	2021-05-27 17:12:13.602196+05:30
58	pbkdf2_sha256$180000$UYeBstXYmuX4$Dx8Ir2C5u90UAyPHkIWyUF2bbXaBtZUdMmGJtdZH6rM=	\N	f	9898989898	Kamaraj			f	t	2021-05-29 18:19:31.344169+05:30
17	pbkdf2_sha256$180000$4SNqOIKGNqwf$l3xe24OhSaD5b7Jlv4yZeWEwtl5c5yiZUOmFnBY46v8=	2021-04-27 19:43:09.121956+05:30	f	9393939393	Reception 2			f	t	2021-04-27 19:42:42.996007+05:30
2	pbkdf2_sha256$180000$AAWakmeY5NGm$0E3SjTSckLpuZFHE+C6s59uyt2G2wyaXH1yh4fqADGY=	2021-05-31 13:19:07.211+05:30	t	testuser			test@gmial.com	t	t	2021-04-27 11:56:22.278858+05:30
3	pbkdf2_sha256$180000$CuW3ZlHtaxri$uV8/I3aIxzXUvLujiQ9ZwzSIBenmqegEdfWwR7Ie+Kc=	\N	f	7010117133	kamaraj   213 weaw 345	asdsd	asdsad@gmail.com	f	t	2021-04-27 11:56:59.599844+05:30
31	pbkdf2_sha256$180000$Pzy4mldCeirE$n6zSB+OYVqniJLPDd3hckfGdyJPjaxta6BfJJYS5pWc=	\N	f	5565656565	New doctor			f	t	2021-05-13 14:15:10.745791+05:30
39	pbkdf2_sha256$180000$K67Al7T6dZpA$2nB1d5iq7Hki4agmQ9KOQ8j3dq1WY4XbOgZuzIrfWZ8=	\N	f	324234444	Doctor vam 	awef	awef@gmial.com	f	t	2021-05-20 19:38:16.971423+05:30
40	pbkdf2_sha256$180000$LqDOeUXsyilR$S8bseFLTfX02y3Jckx2izu1cvHm64ptNtIxWEvPm19s=	\N	f	5345354344	waefawef	awefawef	awfe@gmail.com	f	t	2021-05-20 21:36:55.743892+05:30
4	pbkdf2_sha256$180000$gxhBXQEmfLt9$b41CsMK/XGzL+SvCHVl9wOIGfdHzuRdc/1729xoh0yw=	2021-05-20 14:56:24.583014+05:30	f	7070707070	Doctor paul  awef awef	34234	23443@gmail.com	f	t	2021-04-27 11:58:44.903371+05:30
32	pbkdf2_sha256$180000$5unSytuDeV5I$GlVYyGGBiJyPYGg7e/FEQx7/mVeHHNrcfrO0MtKIR+M=	\N	f	7010117199	Abi			f	t	2021-05-13 15:03:41.140637+05:30
52	pbkdf2_sha256$180000$MPzgpdhozfkp$DGDl4hpuWu2LKnzihNMMdvZxS6JF0QAqpNe8UAqRkzE=	\N	f	2323434344	black	fungus	black@gmail.com	f	t	2021-05-25 13:19:48.216175+05:30
33	pbkdf2_sha256$180000$D7hCAshj6ydW$OpDm5OzoMq6gcX52OvWn4DWbT9HzkjJABIY/lkorexE=	2021-05-13 15:05:32.466172+05:30	f	9902299176	Abhishek			f	t	2021-05-13 15:04:17.660384+05:30
26	pbkdf2_sha256$180000$vXcZatgGoZoF$QolpTO7rla5ZT2yV1Wtr7z09mZpW9B/sqpE7yOZI8Js=	2021-05-13 16:23:27.280935+05:30	f	7010117186	Reception			f	t	2021-05-10 17:37:31.036913+05:30
34	pbkdf2_sha256$180000$QMHWdCqv4KI9$lldzUALR4eG6knt3SoHkGqQYL8WChy465yZ/3RH9WJU=	\N	f	6060606062	Pateint 			f	t	2021-05-19 19:40:59.527716+05:30
42	pbkdf2_sha256$180000$iov9plI5bFR0$uM6T/0N6LaZ0DR8u9zKJ6/hoaCnDttB9s+qLcK+6ARQ=	\N	f	3443434343	aweafew	aweaeg	awefgwage@gmail.com	f	t	2021-05-21 12:06:21.516205+05:30
41	pbkdf2_sha256$180000$lUpmbxTHdEnt$6EWpm6GU/cxfTI4eVlZFrfl1At3BDHEpjFOjIK6hpYc=	\N	f	343434333	testey	recopnisit	test@gmail.com	f	t	2021-05-21 11:54:44.664432+05:30
60	pbkdf2_sha256$180000$Hm3fjDfOQzb0$w8+fU7sMV8x2ioNQUb/gu/3VU9IonIvE+3voasbSOHM=	\N	f	9449766449	HJajh			f	t	2021-05-31 13:06:55.47229+05:30
7	pbkdf2_sha256$180000$jByQWE95bnn4$5jsmoqa/6WIRHlkz99mafvTNKijhKshe9BKav1zN5z0=	2021-05-31 13:33:06.75366+05:30	f	6060606060	Pateint			f	t	2021-04-27 12:30:12.80966+05:30
51	pbkdf2_sha256$180000$HWHx49jJD4Fh$EBOhfjMV4Cp5erbXog5yF1Xy4JZbNzL4NM4YPvpiEGo=	\N	f	23434234	32443434			f	t	2021-05-24 18:43:52.603865+05:30
56	pbkdf2_sha256$180000$dtOiPYjAoXq5$A5CV0Xt8uewwLoH/eNHBr9rtuPuQqlBexO0MTXTXQAM=	\N	f	waefaweffff	awefawef			f	t	2021-05-27 17:13:11.784537+05:30
49	pbkdf2_sha256$180000$uINOoTDpotLo$eIjKVM8uj9QMsNkpdgpc3UWYah22CFat/hJGQNy9IO0=	2021-05-25 15:41:30.108082+05:30	f	8080808080	Receptionist			f	t	2021-05-22 14:23:52.71353+05:30
57	pbkdf2_sha256$180000$GnwS7jHfwuze$0+r8pTTKZb8u+v+ih6uYUP6+AJzot89tRUAiP8Ka9Xc=	\N	f	8989898989	Muthu selvam			f	t	2021-05-28 11:09:36.099774+05:30
54	pbkdf2_sha256$180000$RZ4EmuKIeUXL$uMnopddOXnXUcioU69v7b28HlPmIhcX0qqcaiaJoRwc=	\N	f	234234232	yellow	fungus	yellow@gmail.com	f	t	2021-05-25 13:22:04.336754+05:30
20	pbkdf2_sha256$180000$geDriTuABSOo$cRId9Ze52BXi6XsNk8TaJGielUWo6vxtZb2WPaIH1vU=	2021-05-31 13:17:24.554813+05:30	f	7010117171	ClinicReception			f	t	2021-04-29 11:19:51.111769+05:30
25	pbkdf2_sha256$180000$g2urNHigOUyT$NJ92ajxUVv2v2ApbVnlYJEVtZYLMVy32zNMkXo0TAiU=	2021-05-10 16:32:28.104051+05:30	f	7010117100	Doctor vam  awef	32432	aewfaef@gmail.com	f	t	2021-05-01 18:51:01.587639+05:30
59	pbkdf2_sha256$180000$Dk8Kdpha2Jlo$zmsLhxoNiX5ZDWnFO9WR9OEUd1t9vUqt+hUu8fgi5+I=	\N	f	9464946464	NNaja			f	t	2021-05-31 13:04:54.629192+05:30
61	pbkdf2_sha256$180000$1wcZfwpRqsF2$f9Sb1OdD2jszsdZkqIyXlmWEEk8t07/vaInJ9qFBehY=	\N	f	4646464645	Svgsgsh			f	t	2021-05-31 13:10:44.833044+05:30
62	pbkdf2_sha256$180000$3sdKoP9wYvO5$N3EK56ge80fTS2CSiBH1r84jzvTu4Ji2ymhD2JDZWuY=	\N	f	3746466466	Wggwwgh			f	t	2021-05-31 13:11:52.687739+05:30
63	pbkdf2_sha256$180000$Jt3mfbh659WJ$UWzak+JWeuD/jorzaDyja0j5qQL6e5IVDuZiem2tC1M=	\N	f	7994646464	Ahahhaah			f	t	2021-05-31 13:12:47.45923+05:30
48	pbkdf2_sha256$180000$B170hW7Q7QDS$Q+aeppQ/SvVh07G8BbTbczvWBwNJpVmEZcw7/7vvhM4=	2021-05-31 13:59:58.108947+05:30	f	1010101010	Receptions			f	t	2021-05-21 16:30:59.145948+05:30
64	pbkdf2_sha256$180000$qOcajz00fwFQ$H7vtYNMb5tDVd1Sdy5RO11HzvcWyjj1/rJpAl9irF7k=	\N	f	23323232	waefawfe			f	t	2021-06-04 16:20:49.644927+05:30
1	pbkdf2_sha256$180000$pE5Sj3tLoP9j$rH0r+/TH/2+9lLRr4oGYBeV7vAjT50LHDhQdhZNlriM=	2021-06-04 17:46:32.503434+05:30	t	sakthi	murugan	tt	sakthiratnam050@gmail.com	t	t	2021-04-27 11:48:52.647714+05:30
97	pbkdf2_sha256$180000$L5vP24TEUC1H$RxJdkQGmy1McWsYb/xMmNKLo+PpMX4Xm/A9Or/uMS8E=	2021-06-04 19:44:22.454172+05:30	t	abi			abi@gmail.com	t	t	2021-06-04 19:44:16.047252+05:30
6	pbkdf2_sha256$180000$m6Fos1F7ldTD$D7NyUXhiKNhSZZdbUvHq54WsJrGl4Kc65Fy67mtf60Y=	2021-06-05 11:31:15.276733+05:30	f	7878987878	Rep 1			f	t	2021-04-27 11:59:53.69161+05:30
44	pbkdf2_sha256$180000$ulhqYIoGXcXp$bvtbXnBtHTJ2uEE9vw4zauPgC1EXM+bSKwZVOEZB6Pg=	2021-06-04 22:11:48.40957+05:30	f	4040404040	kamaraj			f	t	2021-05-21 13:38:40.575984+05:30
98	pbkdf2_sha256$180000$5uZzIQkjUl89$x55z4dQXX7bMSgRrnavV5AAdWmMbQWMXiEUlQeHE4Eg=	\N	f	32423444	awefawf			f	t	2021-06-04 22:05:12.618581+05:30
99	pbkdf2_sha256$180000$iVnzA3o35gGE$9O5jSN18ileoFtPHhEdbcy2USS1XxholrNBAkiopsd4=	\N	f	sdzvzv	3434			f	t	2021-06-05 12:26:35.519678+05:30
100	pbkdf2_sha256$180000$RRlZQrsjsWlF$egdDTRN1u1QuNSoujNiZ5ynlK/X7j/3aFh7ec6xe1n4=	\N	f	sergsrg	esrgger			f	t	2021-06-05 13:37:32.491582+05:30
101	pbkdf2_sha256$180000$V6Np7GzCPEcC$zPeJTntmja72a0x+kTtLPRDN2GddEzrnvKEcv0TGNNg=	\N	f	awefaweffffff	ewafewaf			f	t	2021-06-05 17:54:09.49171+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: corsheaders_corsmodel; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.corsheaders_corsmodel (id, cors) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-04-27 12:29:02.004831+05:30	1	Medicine object (1)	1	[{"added": {}}]	35	2
2	2021-04-27 12:29:16.901602+05:30	2	Medicine object (2)	1	[{"added": {}}]	35	2
3	2021-04-27 12:29:32.760142+05:30	3	Medicine object (3)	1	[{"added": {}}]	35	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	profiles	wallet
9	profiles	profile
10	profiles	accountskey
11	corsheaders	corsmodel
12	account	emailaddress
13	account	emailconfirmation
14	socialaccount	socialaccount
15	socialaccount	socialapp
16	socialaccount	socialtoken
17	robots	rule
18	robots	url
19	ERP	address
20	ERP	application
21	ERP	device
22	ERP	media
23	ERP	module
24	ERP	service
25	ERP	publicapikeys
26	ERP	profile
27	ERP	permission
28	ERP	grouppermission
29	ERP	apiusage
30	ERP	appsettingsfield
31	PIM	settings
32	PIM	theme
33	prescriptionapp	clinic
34	prescriptionapp	inventory
35	prescriptionapp	medicine
36	prescriptionapp	medicinetimes
37	prescriptionapp	workinghours
38	prescriptionapp	subinventories
39	prescriptionapp	recopinist
40	prescriptionapp	prescription
41	prescriptionapp	appointments
42	prescriptionapp	submain
43	prescriptionapp	issuedprescription
44	prescriptionapp	groupthread
45	prescriptionapp	chatmessageread
46	prescriptionapp	chatmessage
47	prescriptionapp	practice
48	prescriptionapp	clinicgroupthread
49	prescriptionapp	doctorthread
50	prescriptionapp	doctortimings
51	profiles	payment
52	prescriptionapp	disease
53	online_users	onlineuseractivity
54	prescriptionapp	inventoryorders
55	prescriptionapp	inventorycategory
56	prescriptionapp	soldsubs
57	prescriptionapp	solditems
58	prescriptionapp	items
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-04-27 11:23:29.488429+05:30
2	contenttypes	0002_remove_content_type_name	2021-04-27 11:23:29.540539+05:30
3	auth	0001_initial	2021-04-27 11:23:29.963557+05:30
4	auth	0002_alter_permission_name_max_length	2021-04-27 11:23:30.790379+05:30
5	auth	0003_alter_user_email_max_length	2021-04-27 11:23:30.804223+05:30
6	auth	0004_alter_user_username_opts	2021-04-27 11:23:30.813561+05:30
7	auth	0005_alter_user_last_login_null	2021-04-27 11:23:30.823281+05:30
8	auth	0006_require_contenttypes_0002	2021-04-27 11:23:30.829359+05:30
9	auth	0007_alter_validators_add_error_messages	2021-04-27 11:23:30.842915+05:30
10	auth	0008_alter_user_username_max_length	2021-04-27 11:23:30.896772+05:30
11	auth	0009_alter_user_last_name_max_length	2021-04-27 11:23:30.923392+05:30
12	auth	0010_alter_group_name_max_length	2021-04-27 11:23:30.934861+05:30
13	auth	0011_update_proxy_permissions	2021-04-27 11:23:30.946379+05:30
14	ERP	0001_initial	2021-04-27 11:23:32.510647+05:30
15	PIM	0001_initial	2021-04-27 11:23:34.204934+05:30
16	account	0001_initial	2021-04-27 11:23:34.505016+05:30
17	account	0002_email_max_length	2021-04-27 11:23:34.696673+05:30
18	account	0003_auto_20210410_0857	2021-04-27 11:23:35.207833+05:30
19	account	0004_auto_20210414_1240	2021-04-27 11:23:35.914062+05:30
20	admin	0001_initial	2021-04-27 11:23:36.1164+05:30
21	admin	0002_logentry_remove_auto_add	2021-04-27 11:23:36.283714+05:30
22	admin	0003_logentry_add_action_flag_choices	2021-04-27 11:23:36.304585+05:30
23	corsheaders	0001_initial	2021-04-27 11:23:36.399122+05:30
24	corsheaders	0002_alter_corsmodel_id	2021-04-27 11:23:36.469098+05:30
25	corsheaders	0003_auto_20210414_1240	2021-04-27 11:23:36.540083+05:30
26	prescriptionapp	0001_initial	2021-04-27 11:23:37.465732+05:30
27	profiles	0001_initial	2021-04-27 11:23:38.574219+05:30
28	sites	0001_initial	2021-04-27 11:23:38.737997+05:30
29	robots	0001_initial	2021-04-27 11:23:39.100725+05:30
30	robots	0002_auto_20210410_0857	2021-04-27 11:23:40.642159+05:30
31	robots	0003_auto_20210414_1240	2021-04-27 11:23:41.891114+05:30
32	sessions	0001_initial	2021-04-27 11:23:42.059437+05:30
33	sites	0002_alter_domain_unique	2021-04-27 11:23:42.263004+05:30
34	socialaccount	0001_initial	2021-04-27 11:23:42.786401+05:30
35	socialaccount	0002_token_max_lengths	2021-04-27 11:23:43.160801+05:30
36	socialaccount	0003_extra_data_default_dict	2021-04-27 11:23:43.200751+05:30
37	socialaccount	0004_auto_20210410_0857	2021-04-27 11:23:44.676345+05:30
38	socialaccount	0005_auto_20210414_1240	2021-04-27 11:23:45.975822+05:30
39	profiles	0002_auto_20210427_1104	2021-04-27 16:34:37.464201+05:30
40	prescriptionapp	0002_recopinist_type	2021-04-27 16:45:13.454757+05:30
41	profiles	0003_auto_20210427_1115	2021-04-27 16:45:13.482606+05:30
42	prescriptionapp	0003_submain	2021-04-27 16:54:30.184299+05:30
43	prescriptionapp	0004_auto_20210427_1349	2021-04-27 19:20:03.898949+05:30
44	prescriptionapp	0005_auto_20210427_1444	2021-04-27 20:14:10.988009+05:30
45	prescriptionapp	0006_auto_20210428_0658	2021-04-28 12:28:23.734638+05:30
46	prescriptionapp	0007_issuedprescription	2021-04-28 14:17:00.306767+05:30
47	prescriptionapp	0008_auto_20210428_0855	2021-04-28 14:25:43.001344+05:30
48	prescriptionapp	0009_auto_20210429_0718	2021-04-29 12:48:27.13853+05:30
49	prescriptionapp	0010_practice	2021-04-29 16:40:27.878149+05:30
50	prescriptionapp	0011_auto_20210429_1113	2021-04-29 16:43:46.289725+05:30
51	prescriptionapp	0011_delete_practice	2021-04-29 17:07:08.555042+05:30
52	prescriptionapp	0012_clinic_working_hours	2021-04-29 18:46:51.547497+05:30
53	prescriptionapp	0013_auto_20210430_1411	2021-04-30 19:41:18.14537+05:30
54	prescriptionapp	0014_auto_20210430_1411	2021-04-30 19:41:51.168417+05:30
55	prescriptionapp	0015_auto_20210501_0547	2021-05-01 11:18:06.788375+05:30
56	prescriptionapp	0016_auto_20210501_0627	2021-05-01 11:58:14.801227+05:30
57	prescriptionapp	0017_delete_groupthread	2021-05-01 11:58:27.013436+05:30
58	prescriptionapp	0018_medicine_variants	2021-05-04 11:58:58.456883+05:30
59	prescriptionapp	0019_auto_20210504_0816	2021-05-04 13:47:08.645292+05:30
60	prescriptionapp	0020_medicine_brand	2021-05-04 18:26:54.754246+05:30
61	prescriptionapp	0021_auto_20210505_1407	2021-05-05 19:37:25.948828+05:30
62	profiles	0004_profile_health_issues	2021-05-06 11:30:29.839086+05:30
63	prescriptionapp	0022_prescription_age	2021-05-06 11:34:53.678333+05:30
64	prescriptionapp	0023_medicinetimes_variant	2021-05-06 11:50:09.725871+05:30
65	prescriptionapp	0024_auto_20210506_1306	2021-05-06 18:36:41.219943+05:30
66	prescriptionapp	0025_doctortimings	2021-05-08 16:11:16.678428+05:30
67	prescriptionapp	0026_prescription_appointment	2021-05-08 17:27:53.547378+05:30
68	prescriptionapp	0027_appointments_reason	2021-05-10 11:25:05.654932+05:30
69	prescriptionapp	0028_auto_20210510_0702	2021-05-10 12:32:15.716112+05:30
70	prescriptionapp	0029_prescription_next_visit	2021-05-10 12:51:56.034574+05:30
71	prescriptionapp	0030_auto_20210510_0811	2021-05-10 13:41:23.013328+05:30
72	prescriptionapp	0031_chatmessage_is_clinic	2021-05-11 18:27:31.738323+05:30
73	profiles	0005_payment	2021-05-14 12:30:11.425726+05:30
74	profiles	0006_auto_20210514_0819	2021-05-14 13:49:56.748532+05:30
75	profiles	0007_payment_clinic	2021-05-14 16:41:30.051114+05:30
76	prescriptionapp	0032_auto_20210518_1221	2021-05-18 17:51:55.112179+05:30
77	profiles	0008_profile_dob	2021-05-19 16:06:57.757979+05:30
78	prescriptionapp	0033_auto_20210519_1431	2021-05-19 20:01:30.952388+05:30
79	profiles	0009_profile_blood_group	2021-05-19 20:01:31.011558+05:30
80	prescriptionapp	0034_workinghours_basefees	2021-05-20 10:40:05.782872+05:30
81	prescriptionapp	0035_workinghours_timings	2021-05-20 19:06:04.548809+05:30
82	prescriptionapp	0036_auto_20210520_1607	2021-05-20 21:37:41.290831+05:30
83	online_users	0001_initial	2021-05-22 17:00:49.97256+05:30
84	prescriptionapp	0037_clinic_offical_email	2021-05-24 16:49:05.29361+05:30
85	prescriptionapp	0038_appointments_requestedtime	2021-05-25 13:59:58.911305+05:30
86	prescriptionapp	0039_auto_20210525_0829	2021-05-25 13:59:58.981044+05:30
87	prescriptionapp	0040_auto_20210527_1451	2021-05-27 20:21:15.354854+05:30
88	prescriptionapp	0041_remove_submain_inventory	2021-05-28 13:35:45.409222+05:30
89	prescriptionapp	0042_auto_20210528_1053	2021-05-28 16:24:03.673454+05:30
90	prescriptionapp	0043_subinventories_type	2021-05-28 17:44:19.160466+05:30
91	prescriptionapp	0044_auto_20210528_1256	2021-05-28 18:27:06.353734+05:30
92	prescriptionapp	0045_auto_20210529_0635	2021-05-29 12:05:49.090707+05:30
93	prescriptionapp	0046_auto_20210531_0651	2021-05-31 12:21:31.155513+05:30
94	prescriptionapp	0047_submain_min_quantity	2021-05-31 13:39:25.620282+05:30
95	prescriptionapp	0048_submain_total_quantity	2021-05-31 13:55:25.273831+05:30
96	prescriptionapp	0049_auto_20210531_1045	2021-05-31 16:15:29.157212+05:30
97	prescriptionapp	0050_auto_20210531_1103	2021-05-31 16:33:25.529316+05:30
98	prescriptionapp	0051_auto_20210531_1116	2021-05-31 16:46:52.05763+05:30
99	prescriptionapp	0052_auto_20210603_0609	2021-06-03 11:39:45.041673+05:30
100	prescriptionapp	0053_auto_20210603_0811	2021-06-03 13:41:04.206906+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
74qltvghd6n9awtbeo6aphfgfq5dut99	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-11 11:49:11.697613+05:30
ei3hk9l1odmy1l99hjblnwhb94rvefb2	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-18 18:58:01.461452+05:30
0xw1dj17uq7qqflg3vha500tmnurhk66	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-05-11 12:26:54.132097+05:30
vo50c5rz6noc3bpj63cls38rxoxflflm	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-18 19:30:10.989176+05:30
di8cj3sd8e7furbpgc2las1cz1m8m23t	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-19 14:11:07.929432+05:30
zlx13xfns05jt6juh2my40ja63q2zb6i	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-19 16:51:07.366078+05:30
gjmxv6tjj5e0crznfym1q1f9136orjt8	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-20 14:46:44.254053+05:30
debupzsb937jpue1a5k8svq10yfzxz9f	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-05-13 17:12:27.146969+05:30
w1qcty7gqi9rowl01ier09unhfutysda	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-05-14 16:22:20.336801+05:30
kuke45f68x3bk8f0iirovxlxqufvupia	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-15 15:41:21.361707+05:30
89mameo8s12osgzo7mxcnd5zdl2f4o7c	ZDM5NzJjMjBmMWVkMmRkNzU1NzgzZjM1YTZhZjY3NjNhZDg2YTdjOTp7Il9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQyZmNmMjEzMTYyYjY5YTdlMDlmMDI3MzU3NTA4MGIwOGJiNDdiMjYifQ==	2021-05-15 17:18:46.599538+05:30
c9vgneksgwie6riez17zl2apjjp0ndlj	ZDM5NzJjMjBmMWVkMmRkNzU1NzgzZjM1YTZhZjY3NjNhZDg2YTdjOTp7Il9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQyZmNmMjEzMTYyYjY5YTdlMDlmMDI3MzU3NTA4MGIwOGJiNDdiMjYifQ==	2021-05-15 17:26:38.506521+05:30
aua68c0qi6ecij6ly1yjtuyr34530sb9	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-05-15 18:49:55.870368+05:30
7j5bo4fhlceyyikrxr6g7yhozai8ueu1	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-05-22 15:47:27.138801+05:30
1toijfjfao4k0fjviwjvj27xjglkqhub	YWZkMWE0MDYxNDJjM2FjM2EzNmUyYWIzZTQ4YzBlMDJjZjIyZGExNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2I5YjFiNjc2M2FiYmQ5NzQzNjY4OWNkNjc0MTVlMzZmYzU3MmI0OCJ9	2021-05-17 15:23:43.609838+05:30
jjzxjsswvigygbn5v6qbconurdd60jyy	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-05-24 16:29:07.697481+05:30
mz6km89iyk8gnjt3kpbpf5wlyyqas2zv	YWZkMWE0MDYxNDJjM2FjM2EzNmUyYWIzZTQ4YzBlMDJjZjIyZGExNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2I5YjFiNjc2M2FiYmQ5NzQzNjY4OWNkNjc0MTVlMzZmYzU3MmI0OCJ9	2021-05-24 19:44:31.742077+05:30
ipfna72x39j2dlbl8u8bmd56zxrpcvhb	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-05-24 21:19:17.428278+05:30
fmxu5ryqdjf23pt80ngycbpj6y0wx8ok	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-24 21:24:52.619233+05:30
nxm2o7amrf8eornpyyxy727qoiw91d24	ZGNhNmFhZWRmY2ViNjQzYTc5OGMzYjQ4MjI5OTc3MGUzZDBkYTY5YTp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjAyNWYwMzM4NjMxMGNkZmQwOTYyNmNkMjJjYWMxZTU1NjU4ZTI4ZiJ9	2021-05-25 13:36:42.729913+05:30
ioshcaeq8q7j28ezwm51uuru5qwls8ek	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-25 16:08:51.87655+05:30
kx21hl3uolgmxaokvsxtuap44sqfm9yk	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-25 18:40:58.599861+05:30
6ta34t1yqbbf4f59eqw6mpdkp43jenkl	YWZkMWE0MDYxNDJjM2FjM2EzNmUyYWIzZTQ4YzBlMDJjZjIyZGExNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2I5YjFiNjc2M2FiYmQ5NzQzNjY4OWNkNjc0MTVlMzZmYzU3MmI0OCJ9	2021-05-25 16:53:36.642187+05:30
an7w9a6h7cprp6guask87vz29bwfxk2g	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 16:26:44.732537+05:30
0lza5dy43s70zfz2d5kp1anrsmyyl0np	ZGNhNmFhZWRmY2ViNjQzYTc5OGMzYjQ4MjI5OTc3MGUzZDBkYTY5YTp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjAyNWYwMzM4NjMxMGNkZmQwOTYyNmNkMjJjYWMxZTU1NjU4ZTI4ZiJ9	2021-05-25 18:47:58.007042+05:30
b54vlrlpr8ucx04wkzs73a4rb29mc6xq	ZGNhNmFhZWRmY2ViNjQzYTc5OGMzYjQ4MjI5OTc3MGUzZDBkYTY5YTp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjAyNWYwMzM4NjMxMGNkZmQwOTYyNmNkMjJjYWMxZTU1NjU4ZTI4ZiJ9	2021-06-18 12:23:38.993015+05:30
c6r7bvnqxmch0o333vjrbgssp4abmn6d	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-14 11:20:07.220685+05:30
vbhas1yk1cil7e196lopewy2rweuxaz2	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-25 19:03:37.002632+05:30
dkwjphvsewm900prszoot09jrs1jwl2o	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 16:30:10.706601+05:30
9oohmst5xc15ejdtn1wl8g6y3ruq64ld	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-07 19:37:10.820346+05:30
i2n4wdw5kex6yevhctyzn1sgjhqw47px	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-09 13:37:28.464726+05:30
qidh79swkbqe0e44wwu1zk05jaganuj4	ZmI4NzI1NTRmZmQzZGI3NGViYzEwM2FkMDFmMzM5N2NhZjU1OGViNDp7Il9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM4MDc0Zjc4ZWU0YzZmYTdhMzFlZjJhMjZjMjFhMjliMWRkYmI5NGIifQ==	2021-06-18 19:45:12.038098+05:30
dsl0qdhgg9ett4dyprgwmwavamzrh61u	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-09 13:42:11.127069+05:30
m3dxikh3nllbw8mv4kroziq6f0jggytl	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-05 17:05:04.661716+05:30
zmihihpbhw62jva8im9r89g95tgm0oqj	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-26 12:18:11.951255+05:30
xyv1im88lm6t4nzzdyira1l7j61vxrdk	ZGNhNmFhZWRmY2ViNjQzYTc5OGMzYjQ4MjI5OTc3MGUzZDBkYTY5YTp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjAyNWYwMzM4NjMxMGNkZmQwOTYyNmNkMjJjYWMxZTU1NjU4ZTI4ZiJ9	2021-06-19 11:31:15.288135+05:30
ujtpyd590b38m5jt3sh7c8lxfg3qsc23	YWZkMWE0MDYxNDJjM2FjM2EzNmUyYWIzZTQ4YzBlMDJjZjIyZGExNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2I5YjFiNjc2M2FiYmQ5NzQzNjY4OWNkNjc0MTVlMzZmYzU3MmI0OCJ9	2021-06-07 20:33:25.949807+05:30
c99uqf04mw5bti6zaxcmsj2dkfc8enoc	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-09 15:35:49.432619+05:30
elrhkr44uy94a17obgxo5i92uc4uqaf5	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-06-11 20:06:22.405037+05:30
sxp7frbowm3gmtnfemk425vgxa1913p3	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-26 19:06:30.884403+05:30
8elcp6qhk5vvavc4lp5fxmd2u8yyiz60	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-26 21:06:13.656426+05:30
qf4re6cfpql55rb6ehqlmfj2pogooay9	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-26 21:10:15.43292+05:30
i93g1p2g3z5gal7zqq70kg3ff4ytbbf3	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-13 14:25:17.004341+05:30
nc1kvbcyqdrb08b0dykhpca2humznu3v	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-26 21:14:31.208638+05:30
jojsohqwvtpfdjkteymk1t62l7p4ff0p	YWZkMWE0MDYxNDJjM2FjM2EzNmUyYWIzZTQ4YzBlMDJjZjIyZGExNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2I5YjFiNjc2M2FiYmQ5NzQzNjY4OWNkNjc0MTVlMzZmYzU3MmI0OCJ9	2021-05-26 21:54:18.675638+05:30
g1o52guy7frtuvmgmni2bgtosovmml6u	YWZkMWE0MDYxNDJjM2FjM2EzNmUyYWIzZTQ4YzBlMDJjZjIyZGExNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2I5YjFiNjc2M2FiYmQ5NzQzNjY4OWNkNjc0MTVlMzZmYzU3MmI0OCJ9	2021-05-26 21:54:18.89722+05:30
w61qohbq2dz1ai1avcch8lg2g6262kiy	YWZkMWE0MDYxNDJjM2FjM2EzNmUyYWIzZTQ4YzBlMDJjZjIyZGExNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2I5YjFiNjc2M2FiYmQ5NzQzNjY4OWNkNjc0MTVlMzZmYzU3MmI0OCJ9	2021-05-26 21:54:18.907724+05:30
5ahmkbj7jpki6duqa7owr6kcosuzo5hc	YWZkMWE0MDYxNDJjM2FjM2EzNmUyYWIzZTQ4YzBlMDJjZjIyZGExNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2I5YjFiNjc2M2FiYmQ5NzQzNjY4OWNkNjc0MTVlMzZmYzU3MmI0OCJ9	2021-05-26 21:54:19.457288+05:30
luz7h1ks8c5mc3ptt952hunkj0jdyp1b	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-26 22:04:35.091465+05:30
6z5a1s3qvzb58v6ssjsqk77rvvyslhnn	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-26 22:09:10.750095+05:30
gztq0t2mb47yx99eqpmkuq7tfqh9buns	YWZkMWE0MDYxNDJjM2FjM2EzNmUyYWIzZTQ4YzBlMDJjZjIyZGExNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2I5YjFiNjc2M2FiYmQ5NzQzNjY4OWNkNjc0MTVlMzZmYzU3MmI0OCJ9	2021-05-26 22:13:25.791648+05:30
ii75ec6ssm0vh90c0fzl0xjozwplj9lr	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-27 00:41:24.71181+05:30
t5f0qyzlfo58r2b3zx9y00eo39tl8641	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-27 00:58:21.03117+05:30
s8hp7wmxke2yse7ltcztrioc2c1176g7	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-05-27 10:59:42.606895+05:30
2oo816ov1zcc067o8g5oa61ri8znyrzu	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-05-27 11:05:56.151682+05:30
kp7br81tznp2mrwvmpzxmj0bgtav8d31	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-27 11:16:25.148764+05:30
ikhs3sx4l03juupn2xqe0yh63owywhm6	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-27 12:32:23.713147+05:30
4bc6nvb95k5lfhpb0capi9t0ffhun2lj	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-27 13:03:08.137273+05:30
f7widkxcf9qqbd760dqnqt8ej9xpfhj0	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-05-27 13:39:26.962804+05:30
qbrz94a81rlxpqysxvr4u9zo3z617ukt	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-27 14:21:16.371292+05:30
bll7epf6etlezxbh27aw9wccsg0wdzme	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-27 14:28:28.813302+05:30
sfwn829226d2nze8ragwawukl5huzb6f	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-27 14:31:22.07288+05:30
hl6pc0k2rtft02en7ylmfh6abxejkt0c	YzE5OTFlNDhkZjdlNTljNWFmZDIxMzVjYWQ1YTEwY2NiOThjMGQ2MDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzNhMTg2ZmY5MGE2YjMwY2Q2YTljNmY5NDdmOWM2OTM1MzEyZDhkMiJ9	2021-05-27 14:36:12.837092+05:30
mf1kbxue7x3ipck6lk8w1zpkidmi87k3	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-27 14:38:19.324338+05:30
x7tifbb2hwv3wcuwgdn4e3ixcsvo3ibr	NTU2NjVhZjBjZjAyMTEwMWVhNDQ2YWEwYTA2MjQxZjA2NmI2NTgwNTp7Il9hdXRoX3VzZXJfaWQiOiIzMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjUzYTI1NjQ5OGY2YzkwMzEwYWEzNTU5MDIzNDIyNzgxODFhYThmNjAifQ==	2021-05-27 15:05:32.484237+05:30
ud2f41cdewszarmg5owko7x3vajezc7k	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-29 17:38:19.54422+05:30
b3i53748p2sjefaox5rkhc40p5iooyml	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-30 16:26:53.274438+05:30
rk1i4qczwl0cqh7qoyerh26hbpbov624	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-30 17:22:31.76768+05:30
7q8hydw1bviljxeok5b9ep3417jiq0wv	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-05-31 18:13:47.263308+05:30
xouomdq2sb2wy8i462p2s9ntai3xfjcp	NGM1Yjc0YmVjYTZhNTdlZTFiNzA3ZTQ5ZDM5ZGRhZjllYTA4MzI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1YmJlMTk3MjBiMGY5NmExNzAzZDUzMjE5YmU2YmE1MDI4MDNhNCJ9	2021-06-01 18:40:57.69901+05:30
w5p7kf5isv7rskxa16oe68c83e0c1rdb	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 12:33:09.908969+05:30
j41k7ytk90ltnbjb8xvjenqgsbuj15vm	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 12:43:28.339616+05:30
16q51opm4z76318lcc91ah0dg8ycn2jy	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 12:46:44.130012+05:30
7oi9kpwrbaqv7cjwbaroyjussfps8wvp	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 12:48:37.424811+05:30
764ri325su4fw2ty7yml6tm6i7uciz0t	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 12:50:09.644741+05:30
alzvie1z7gpyuhm7we9vhgzv1dax41cq	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 12:51:15.967185+05:30
x6v11rwoqrlfsxvteqbvp44ri13a5u8w	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 12:51:22.243622+05:30
oktu2to281gs2iy3523iykzlv70r977c	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 12:53:23.439951+05:30
wa6gy0hzua35hvmbmne0t3x6cors0p05	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 12:54:54.805771+05:30
k8u41yw3af7954i2nv306aa2qyimw56j	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 12:56:31.967959+05:30
wuquw63ztywz5pzqmuigrsoiojch1065	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 13:03:44.860886+05:30
bnkxgm9kriav3y8mclok5oria2fzp1pj	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 13:04:28.123309+05:30
k9daqns27bhwc6qmjqkxht2ngkenc3ya	Y2VjMmRhZjgyM2M1ZTA0OTNjMjE2ZGEwOGM3M2U4MTBmN2NiMzRhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGY1ZjI1YjNlNzkxMGUyYWMzOTdjMTEzN2U1YjQ2Mzk5YzM0ZDBiZCJ9	2021-06-04 13:05:31.708153+05:30
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: online_users_onlineuseractivity; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.online_users_onlineuseractivity (id, last_activity, user_id) FROM stdin;
\.


--
-- Data for Name: prescriptionapp_appointments; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_appointments (id, created, updated, requesteddate, accepteddate, acceptedtime, requestedtime, status, clinic_id, doctor_id, requesteduser_id, reason, "requestedTime") FROM stdin;
38	2021-05-29 17:13:09.378102+05:30	2021-05-29 17:13:09.378115+05:30	2021-05-30	\N	\N	5:12 PM	Pending	1	45	34	fever	05:12:00
4	2021-05-03 12:36:11.313912+05:30	2021-05-04 17:13:27.136396+05:30	2021-05-10	2021-05-18	06:13 pm	07:36 pm	Completed	1	4	7	\N	08:29:14.384185
37	2021-05-28 11:09:36.626304+05:30	2021-05-29 18:25:03.23511+05:30	2021-05-28	2021-05-28	11:08 am	11:08 am	Declined	42	44	57	Fever	11:08:00
36	2021-05-27 17:24:04.63056+05:30	2021-05-29 18:25:09.509951+05:30	2021-05-27	2021-05-27	05:23 pm	05:23 pm	Declined	42	44	7	Ahhaha	17:23:00
39	2021-05-31 13:52:07.499937+05:30	2021-05-31 13:52:20.082722+05:30	2021-05-31	\N	\N	01:51 pm	Declined	42	44	44	Ahahah	13:51:00
5	2021-05-05 17:29:47.931882+05:30	2021-05-07 16:12:50.680869+05:30	2021-05-05	2021-05-05	05:29 pm	05:29 pm	Completed	1	4	7	\N	08:29:14.384185
8	2021-05-10 11:26:48.530076+05:30	2021-05-10 11:26:48.530089+05:30	2021-05-11	\N	\N	11:26 am	Pending	43	25	7	Anannaaabb	08:29:14.384185
7	2021-05-10 11:19:50.336729+05:30	2021-05-10 13:04:51.216756+05:30	2021-05-10	\N	\N	11:18 am	Completed	43	25	7	\N	08:29:14.384185
9	2021-05-10 21:36:17.188963+05:30	2021-05-10 21:36:17.188976+05:30	2021-05-10	\N	\N	09:36 pm	Pending	43	25	4	Xydhdficj	08:29:14.384185
6	2021-05-07 14:48:54.508769+05:30	2021-05-12 14:13:52.541881+05:30	2021-05-08	2021-05-08	05:48 pm	05:48 pm	Completed	43	4	7	\N	08:29:14.384185
10	2021-05-12 14:21:05.425394+05:30	2021-05-12 14:21:05.425408+05:30	2021-05-12	\N	\N	02:20 pm	Pending	43	25	7	JJaajaj	08:29:14.384185
11	2021-05-12 14:21:57.239913+05:30	2021-05-12 14:21:57.239928+05:30	2021-05-13	\N	\N	02:21 pm	Pending	43	25	7	Fever	08:29:14.384185
12	2021-05-12 14:22:26.561624+05:30	2021-05-12 14:22:26.561636+05:30	2021-05-28	\N	\N	02:22 pm	Pending	43	25	7	Fever	08:29:14.384185
13	2021-05-13 13:33:41.703762+05:30	2021-05-13 13:33:41.703792+05:30	2021-05-29	\N	\N	01:18 pm	Pending	43	25	4	HJaahhaah	08:29:14.384185
2	2021-05-03 12:35:49.123866+05:30	2021-05-18 09:14:31.539158+05:30	2021-05-03	2021-05-21	5.00 pm	12:35 pm	Declined	1	4	7	\N	08:29:14.384185
14	2021-05-19 20:26:16.549503+05:30	2021-05-19 20:26:16.549515+05:30	2021-05-20	\N	\N	07:43 pm	Pending	43	25	38	Severe headeache	08:29:14.384185
3	2021-05-03 12:36:00.887688+05:30	2021-05-19 20:54:40.297546+05:30	2021-05-09	2021-05-05	5.00 pm	12:35 pm	Completed	1	4	7	\N	08:29:14.384185
1	2021-05-03 11:55:29.818464+05:30	2021-05-20 11:41:38.604027+05:30	2021-05-03	2021-05-03	11:55 am	11:55 am	Completed	1	4	7	\N	08:29:14.384185
34	2021-05-26 11:26:06.413612+05:30	2021-05-31 14:01:10.117655+05:30	2021-05-27	2021-05-27	11:21 am	11:21 am	Completed	42	52	7	Malwl	11:21:00
33	2021-05-26 11:25:27.05364+05:30	2021-05-31 14:01:15.520082+05:30	2021-05-27	\N	\N	11:21 am	Declined	42	53	7	Joajaj	11:21:00
15	2021-05-20 11:56:18.091397+05:30	2021-05-20 12:41:54.089387+05:30	2021-05-20	2021-05-20	12:54 am	11:54 am	Completed	43	4	7	Nnnnn	08:29:14.384185
17	2021-05-22 17:46:53.655807+05:30	2021-05-22 17:46:53.655833+05:30	2021-05-22	\N	\N	7:46 PM	Pending	1	45	38	asdasdads	08:29:14.384185
18	2021-05-22 17:48:59.326695+05:30	2021-05-22 17:48:59.326713+05:30	2021-05-22	\N	\N	7:47 PM	Pending	1	45	50	awefawfaf	08:29:14.384185
16	2021-05-21 14:02:43.463754+05:30	2021-05-23 13:07:55.652074+05:30	2021-05-21	2021-05-21	02:01 pm	02:01 pm	Completed	42	44	7	Nsjasjnsn	08:29:14.384185
40	2021-05-31 14:09:41.062921+05:30	2021-05-31 14:09:48.646356+05:30	2021-05-31	2021-05-31	02:09 pm	02:09 pm	Completed	42	44	7	Vwavhw	14:09:00
41	2021-05-31 14:12:46.154816+05:30	2021-05-31 14:19:14.540527+05:30	2021-05-31	2021-05-31	02:12 pm	02:12 pm	Accepted	42	44	7	Abbab	14:12:00
20	2021-05-23 13:17:01.17501+05:30	2021-05-24 13:30:37.98472+05:30	2021-05-25	2021-05-25	01:15 pm	01:15 pm	Declined	42	44	7	Poor	08:29:14.384185
19	2021-05-23 13:16:44.974954+05:30	2021-05-24 13:34:30.55504+05:30	2021-05-23	2021-05-25	12:10 pm	01:15 pm	Declined	42	44	7	Fever	08:29:14.384185
22	2021-05-24 13:40:19.589423+05:30	2021-05-24 13:48:37.631659+05:30	2021-05-25	2021-05-25	01:38 pm	01:38 pm	Declined	42	44	7	Ppp	08:29:14.384185
21	2021-05-24 13:39:55.693088+05:30	2021-05-24 16:03:12.015506+05:30	2021-05-24	\N	\N	01:38 pm	Completed	42	44	7	Hiyu	08:29:14.384185
23	2021-05-24 18:43:52.72275+05:30	2021-05-24 18:43:52.722764+05:30	2021-05-24	\N	\N	7:42 PM	Pending	1	45	51	waerfaweffew	08:29:14.384185
24	2021-05-25 14:04:01.329671+05:30	2021-05-25 14:04:01.329684+05:30	2021-05-25	\N	\N	12:03 AM	Pending	1	45	51	1233	12:03:00
25	2021-05-26 00:39:01.98696+05:30	2021-05-26 00:39:01.986977+05:30	2021-05-26	\N	\N	12:38 AM	Pending	1	45	51	weaawffa	12:38:00
26	2021-05-26 00:41:30.992518+05:30	2021-05-26 00:41:30.992532+05:30	2021-05-26	\N	\N	1:41 AM	Pending	1	45	38	asdadddd	01:41:00
27	2021-05-26 00:46:15.714421+05:30	2021-05-26 00:46:15.714435+05:30	2021-05-26	\N	\N	12:46 AM	Pending	1	45	51	awefwaef	12:46:00
28	2021-05-26 00:48:49.928725+05:30	2021-05-26 00:48:49.928739+05:30	2021-05-26	\N	\N	12:47 AM	Pending	1	45	38	asd	23:47:00
29	2021-05-26 11:20:25.494917+05:30	2021-05-26 11:20:25.494932+05:30	2021-05-26	\N	\N	1:20 AM	Pending	1	45	50	awefafewaf	01:20:00
30	2021-05-26 11:20:34.729135+05:30	2021-05-26 11:20:34.729148+05:30	2021-05-26	\N	\N	11:20 AM	Pending	1	45	38	34	11:20:00
31	2021-05-26 11:20:47.34232+05:30	2021-05-26 11:20:47.342335+05:30	2021-05-26	\N	\N	10:20 AM	Pending	1	45	38	34	10:20:00
32	2021-05-26 11:21:49.936681+05:30	2021-05-26 11:21:49.936736+05:30	2021-05-26	\N	\N	12:21 AM	Pending	1	45	38	awefewfa	00:21:00
35	2021-05-27 17:13:11.946983+05:30	2021-05-27 17:13:11.946997+05:30	2021-05-27	\N	\N	5:13 PM	Pending	2	55	56	aewfaw	05:13:00
\.


--
-- Data for Name: prescriptionapp_chatmessage; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_chatmessage (id, message, created, "msgType", attachment, "fileType", "fileSize", "fileName", sender_id, "clinicThread_id", "doctorThread_id", is_clinic) FROM stdin;
194	\N	2021-05-15 12:57:38.736667+05:30	voice	chat/images/DP/1621063658_736689_recording-8dc3c850-d3ec-4ceb-b72f-7ac4d248dc04.m4a	\N	0.024066925048828125	recording-8dc3c850-d3ec-4ceb-b72f-7ac4d248dc04.m4a	4	\N	2	t
174	Ok	2021-05-13 17:21:56.707008+05:30	text		\N	\N	\N	26	3	\N	t
175	Hi	2021-05-14 11:15:20.359174+05:30	text		\N	\N	\N	7	1	\N	f
177	Yes	2021-05-14 11:37:36.630899+05:30	text		\N	\N	\N	7	2	\N	f
183	\N	2021-05-15 12:47:13.876157+05:30	voice	chat/images/DP/1621063033_8762639_recording-8adeaf18-f8b1-4f12-a5fc-eb9b3d9daa15.m4a	\N	0.027787208557128906	recording-8adeaf18-f8b1-4f12-a5fc-eb9b3d9daa15.m4a	4	\N	1	t
171	Po	2021-05-11 18:49:11.020989+05:30	text		\N	\N	\N	6	3	\N	t
169	Yes	2021-05-11 18:44:23.644815+05:30	text		\N	\N	\N	26	3	\N	t
167	And clinic	2021-05-11 18:39:15.679295+05:30	text		\N	\N	\N	26	3	\N	t
189	Dftt₹! ₹((₹(₹(₹	2021-05-15 12:51:15.595066+05:30	text		\N	\N	\N	4	\N	2	t
173	Kkk	2021-05-11 18:51:48.903689+05:30	text		\N	\N	\N	6	3	\N	t
191	Jsejejddsieheeje	2021-05-15 12:51:56.809985+05:30	text		\N	\N	\N	4	\N	2	f
193	Shsheushehehjddjdjdj	2021-05-15 12:54:25.625186+05:30	text		\N	\N	\N	4	\N	2	t
196	\N	2021-05-15 13:30:03.951692+05:30	voice	chat/images/DP/1621065603_9517376_recording-cbe5e511-14e1-4a8d-9626-2b1c52c9478b.m4a	\N	0.026458740234375	recording-cbe5e511-14e1-4a8d-9626-2b1c52c9478b.m4a	4	\N	2	t
187	Nddjdjdksks	2021-05-15 12:48:37.165797+05:30	text		\N	\N	\N	4	\N	1	t
198	\N	2021-05-15 14:36:30.063811+05:30	voice	chat/images/DP/1621069590_0639255_recording-7fb17ff4-1684-4ed2-a60d-21b21159955e.m4a	\N	0.06259822845458984	recording-7fb17ff4-1684-4ed2-a60d-21b21159955e.m4a	4	\N	1	t
200	Oo	2021-05-15 18:07:03.613587+05:30	text		\N	\N	\N	4	\N	2	t
179	Yes	2021-05-15 12:20:14.669672+05:30	text		\N	\N	\N	4	\N	1	t
202	Pp	2021-05-15 18:10:54.746779+05:30	text		\N	\N	\N	4	\N	2	t
204	Vbh	2021-05-15 18:11:57.604141+05:30	image	chat/images/DP/1621082517_604162_3a77bc62-49d0-431a-a12f-1df4b32d7d76.jpg	\N	0.057274818420410156	3a77bc62-49d0-431a-a12f-1df4b32d7d76.jpg	4	\N	2	t
206	Bn	2021-05-15 19:03:28.979239+05:30	image	chat/images/DP/1621085608_9792628_905695e1-e543-49a0-8c62-ffc0e52ee6ff.jpg	\N	0.581730842590332	905695e1-e543-49a0-8c62-ffc0e52ee6ff.jpg	4	\N	2	t
208	Kl	2021-05-15 19:07:03.427661+05:30	image	chat/images/DP/1621085823_4276843_aab0076f-0a3d-4af5-865e-576d76dd7fd3.jpg	\N	0.06155109405517578	aab0076f-0a3d-4af5-865e-576d76dd7fd3.jpg	4	\N	2	t
210	Po	2021-05-15 19:32:04.093255+05:30	text		\N	\N	\N	4	\N	2	t
213	Please	2021-05-20 19:06:48.829911+05:30	text		\N	\N	\N	20	1	\N	t
215	Ok	2021-05-21 18:18:23.058906+05:30	text		\N	\N	\N	7	1	\N	f
217	Kk	2021-05-22 10:47:11.363277+05:30	image	chat/images/DP/1621660631_3633013_fc78bcd8-4478-48f8-b66b-cb1d2f50aba6.jpg	\N	0.42112159729003906	fc78bcd8-4478-48f8-b66b-cb1d2f50aba6.jpg	44	\N	4	t
219	Hi	2021-05-22 18:48:05.747019+05:30	text		\N	\N	\N	7	\N	3	f
221	Ok	2021-05-22 18:48:24.909003+05:30	text		\N	\N	\N	7	\N	3	f
223	Hi	2021-05-23 13:32:04.960452+05:30	text		\N	\N	\N	7	4	\N	f
181	Cvh	2021-05-15 12:43:59.227185+05:30	text		\N	\N	\N	4	\N	1	t
225	\N	2021-05-24 12:19:04.697575+05:30	voice	chat/images/DP/1621838944_6976_recording-001261f3-4983-451d-94f1-a689e55c0d7e.m4a	\N	0.03363323211669922	recording-001261f3-4983-451d-94f1-a689e55c0d7e.m4a	44	\N	4	t
227	Hi	2021-05-24 13:37:27.137166+05:30	text		\N	\N	\N	7	\N	\N	f
229	K	2021-05-24 13:37:57.451481+05:30	text		\N	\N	\N	7	1	\N	f
231	Ok	2021-05-24 13:38:44.864538+05:30	text		\N	\N	\N	7	2	\N	f
233	Pp	2021-05-24 13:39:08.199379+05:30	text		\N	\N	\N	7	1	\N	f
235	Tt	2021-05-24 13:59:13.292911+05:30	text		\N	\N	\N	44	\N	4	t
237	hi	2021-05-24 14:01:23.56451+05:30	text		\N	\N	\N	44	\N	4	t
239	Ol	2021-05-24 16:18:45.244801+05:30	text		\N	\N	\N	7	1	\N	f
241	Yes	2021-05-24 16:35:08.378259+05:30	text		\N	\N	\N	7	2	\N	f
243	Ok	2021-05-24 19:18:45.188111+05:30	text		\N	\N	\N	7	2	\N	f
245	Hi	2021-05-25 15:42:04.629743+05:30	text		\N	\N	\N	49	4	\N	t
247	Ok	2021-05-25 15:42:31.120575+05:30	text		\N	\N	\N	49	5	\N	t
249	Ok	2021-05-25 15:57:00.912237+05:30	text		\N	\N	\N	49	5	\N	t
252	Hi	2021-05-27 10:57:19.006397+05:30	text		\N	\N	\N	7	\N	5	f
254	Hh	2021-05-29 10:47:31.125855+05:30	text		\N	\N	\N	7	1	\N	f
256	Ok	2021-05-29 17:15:03.565414+05:30	text		\N	\N	\N	7	4	\N	f
258	Pp	2021-05-29 17:15:09.018454+05:30	text		\N	\N	\N	7	4	\N	f
260	Nk	2021-05-31 11:16:42.53687+05:30	image	chat/images/DP/1622440002_536897_7f70bfbb-0849-4301-a6a7-1722747b32a1.jpg	\N	0.08806133270263672	7f70bfbb-0849-4301-a6a7-1722747b32a1.jpg	7	\N	\N	f
262	\N	2021-05-31 11:21:13.238576+05:30	voice	chat/images/DP/1622440273_2386076_recording-047c6786-769e-44e4-8097-f086f3b39ad7.m4a	\N	0.028318405151367188	recording-047c6786-769e-44e4-8097-f086f3b39ad7.m4a	7	2	\N	f
185	Nddjdjdksks	2021-05-15 12:47:58.919285+05:30	text		\N	\N	\N	4	\N	1	t
176	Ok	2021-05-14 11:37:33.206267+05:30	text		\N	\N	\N	7	2	\N	f
178	Oo	2021-05-14 11:37:54.619773+05:30	text		\N	\N	\N	7	1	\N	f
190	Dftt₹! ₹((₹(₹(₹_(₹(3(3(2929229383837₹82(9	2021-05-15 12:51:51.506186+05:30	text		\N	\N	\N	4	\N	2	f
168	Hj	2021-05-11 18:39:32.072101+05:30	text		\N	\N	\N	26	3	\N	t
195	\N	2021-05-15 13:29:58.686001+05:30	voice	chat/images/DP/1621065598_686115_recording-16d81725-f9af-4aef-ad00-2962388e75a0.m4a	\N	0.025130271911621094	recording-16d81725-f9af-4aef-ad00-2962388e75a0.m4a	4	\N	2	t
197	\N	2021-05-15 13:30:31.116552+05:30	voice	chat/images/DP/1621065631_1166668_recording-1d9d0c4c-41cb-4c22-869a-1c946dfc6481.m4a	\N	0.028217315673828125	recording-1d9d0c4c-41cb-4c22-869a-1c946dfc6481.m4a	4	\N	2	t
199	Oi	2021-05-15 15:41:33.485384+05:30	image	chat/images/DP/1621073493_4855006_86df76db-ee11-4936-8be5-d1cd8d76a619.jpg	\N	0.16265010833740234	86df76db-ee11-4936-8be5-d1cd8d76a619.jpg	4	\N	2	t
201	Ohi	2021-05-15 18:08:09.318145+05:30	image	chat/images/DP/1621082289_3181682_c8129206-50a1-4353-84a7-aa8c11ea7f6b.jpg	\N	0.19754409790039062	c8129206-50a1-4353-84a7-aa8c11ea7f6b.jpg	4	\N	2	t
203	Pp	2021-05-15 18:11:46.316927+05:30	text		\N	\N	\N	4	\N	2	t
205	Test	2021-05-15 18:59:43.795006+05:30	image	chat/images/DP/1621085383_7950282_1cd6beae-127f-4e4f-a7bd-7274ff046163.jpg	\N	0.19762039184570312	1cd6beae-127f-4e4f-a7bd-7274ff046163.jpg	4	\N	2	t
207	Pj	2021-05-15 19:05:01.463137+05:30	image	chat/images/DP/1621085701_4631605_67edfdfc-f40b-49c0-87cd-e48dbd8d9cab.jpg	\N	0.05890655517578125	67edfdfc-f40b-49c0-87cd-e48dbd8d9cab.jpg	4	\N	2	t
182	Jkk	2021-05-15 12:44:49.093846+05:30	text		\N	\N	\N	4	\N	1	t
209	Nkk	2021-05-15 19:10:32.160652+05:30	image	chat/images/DP/1621086032_1606743_963659e6-3dbb-47e3-9f0d-862ef3c0d345.jpg	\N	0.09320354461669922	963659e6-3dbb-47e3-9f0d-862ef3c0d345.jpg	4	\N	2	t
211	Ok	2021-05-19 17:16:04.073641+05:30	text		\N	\N	\N	4	\N	2	t
212	Ok	2021-05-20 19:06:38.476823+05:30	text		\N	\N	\N	20	1	\N	t
214	Ghgbgbyb	2021-05-21 16:10:20.88257+05:30	text		\N	\N	\N	44	\N	4	t
216	Hi	2021-05-22 10:46:29.497538+05:30	text		\N	\N	\N	44	\N	4	t
218	Po	2021-05-22 18:28:43.657331+05:30	text		\N	\N	\N	7	2	\N	f
220	Pp	2021-05-22 18:48:08.749952+05:30	text		\N	\N	\N	7	\N	3	f
186	Nddjdjdksks	2021-05-15 12:48:04.403324+05:30	text		\N	\N	\N	4	\N	1	t
222	Hi	2021-05-23 13:13:44.443019+05:30	text		\N	\N	\N	7	\N	3	f
224	Jdjduddi	2021-05-24 12:18:53.459415+05:30	text		\N	\N	\N	44	\N	4	t
180	\N	2021-05-15 12:33:50.891616+05:30	voice	chat/images/DP/1621062230_8916407_recording-cd30b77e-d9b1-4f6c-932d-bd7480b7acdd.m4a	\N	0.020877838134765625	recording-cd30b77e-d9b1-4f6c-932d-bd7480b7acdd.m4a	4	\N	1	t
226	Hi	2021-05-24 13:37:14.760628+05:30	text		\N	\N	\N	7	\N	\N	f
170	Owner	2021-05-11 18:48:48.03266+05:30	text		\N	\N	\N	6	3	\N	t
228	Yes	2021-05-24 13:37:48.447047+05:30	text		\N	\N	\N	7	\N	\N	f
230	Hi	2021-05-24 13:38:35.347172+05:30	text		\N	\N	\N	7	1	\N	f
232	Hi	2021-05-24 13:38:59.889578+05:30	text		\N	\N	\N	7	\N	\N	f
234	ok	2021-05-24 13:58:42.868657+05:30	text		\N	\N	\N	44	\N	4	t
236	Pp	2021-05-24 14:00:09.82422+05:30	text		\N	\N	\N	44	\N	4	t
238	Ok	2021-05-24 16:17:32.094902+05:30	text		\N	\N	\N	7	1	\N	f
240	Hi	2021-05-24 16:19:06.918292+05:30	text		\N	\N	\N	7	4	\N	f
242	Ok	2021-05-24 17:19:28.511131+05:30	text		\N	\N	\N	7	2	\N	f
244	Ii	2021-05-24 19:18:49.338938+05:30	text		\N	\N	\N	7	2	\N	f
246	Hi	2021-05-25 15:42:11.410346+05:30	text		\N	\N	\N	49	5	\N	t
248	Pp	2021-05-25 15:42:34.661328+05:30	text		\N	\N	\N	49	5	\N	t
250	Pppp	2021-05-25 15:57:09.013486+05:30	text		\N	\N	\N	49	5	\N	t
172	Po	2021-05-11 18:51:44.23113+05:30	text		\N	\N	\N	6	3	\N	t
251	Ok	2021-05-26 11:22:13.857553+05:30	text		\N	\N	\N	7	4	\N	f
253	Ok	2021-05-28 11:10:22.290392+05:30	text		\N	\N	\N	44	\N	4	t
255	Jjk	2021-05-29 10:47:35.44962+05:30	text		\N	\N	\N	7	1	\N	f
257	Ok	2021-05-29 17:15:07.11725+05:30	text		\N	\N	\N	7	4	\N	f
259	Jxdjdj	2021-05-31 11:16:05.716477+05:30	image	chat/images/DP/1622439965_7165012_02a0c195-befa-401c-af92-31b384dea4aa.jpg	\N	0.08806133270263672	02a0c195-befa-401c-af92-31b384dea4aa.jpg	7	\N	\N	f
261	Nk	2021-05-31 11:17:30.235356+05:30	image	chat/images/DP/1622440050_2353787_4aa358b1-cb1e-40a2-8e44-1cd1b97d4d03.jpg	\N	0.08806133270263672	4aa358b1-cb1e-40a2-8e44-1cd1b97d4d03.jpg	7	2	\N	f
164	Hi	2021-05-11 18:29:45.185975+05:30	text		\N	\N	\N	7	3	\N	f
165	Ok	2021-05-11 18:29:48.428684+05:30	text		\N	\N	\N	7	3	\N	f
184	Nddjdjdksks	2021-05-15 12:47:33.876602+05:30	text		\N	\N	\N	4	\N	1	t
188	Dftt	2021-05-15 12:49:40.703256+05:30	text		\N	\N	\N	4	\N	2	t
192	Shsheusheheh	2021-05-15 12:54:11.80003+05:30	text		\N	\N	\N	4	\N	2	t
166	Ok	2021-05-11 18:30:23.606724+05:30	text		\N	\N	\N	26	3	\N	t
\.


--
-- Data for Name: prescriptionapp_chatmessageread; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_chatmessageread (id, read, "chatMessage_id", participant_id) FROM stdin;
\.


--
-- Data for Name: prescriptionapp_clinic; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_clinic (id, type, "displayPicture", mobile, gstin, "companyName", "notificationId", address, pincode, state, city, "firstEmergencyContactNo", "secondEmergencyContactNo", uniqueid, lat, long, "isClinicVerified", startingtime, created, updated, owner_in, closingtime, owner_id, inventory_id, "inventoryIncluded", working_hours, offical_email) FROM stdin;
4	MedicalStore	clinic/images/DP/1619532349_7548056_7878987878_a4104527-9b89-4949-b3bf-961c431cbbe5.jpg	7878987878	gytyg4565456	Test clinic	\N	5/3278 Adaiyar	786656	Karnataka	Bengaluru	9869669867	9778776767	\N	13.0714633	77.5352236	f	06:23:00	2021-04-27 19:35:49.755062+05:30	2021-04-27 19:35:49.801794+05:30	f	17:23:00	6	1	t	\N	\N
1	Clinic		7878787878	gytyg4565456	Sri Devi Clinic	\N	5/3278 Adaiyar	786656	Karnataka	Bengaluru	9869669867	9778776767	\N	66688	896788	f	11:57:00	2021-04-27 11:57:51.802501+05:30	2021-05-27 12:58:11.57889+05:30	f	11:57:00	3	7	t	\N	deviclinic@128@gmail.com
3	MedicalStore		7878987878	gytyg4565456	Sri Annai Medicals 2	\N	5/3278 Adaiyar	786656	Karnataka	Bengaluru	9869669867	9778776767	\N	13.0714655	77.5352203	f	07:02:00	2021-04-27 16:03:28.961633+05:30	2021-05-27 20:41:56.247507+05:30	f	22:02:00	6	8	f	\N	\N
2	MedicalStore	clinic/images/DP/1619505333_5374444_7878987878_cea95e2b-8d15-4297-a931-d1b3e582830e.jpg	7878987878	gytyg4565456	Sri Annai Medicals	\N	5/3278 Adaiyar	786656	Karnataka	Bengaluru	9869669867	9778776767	\N	13.0714307	77.5351488	f	12:02:00	2021-04-27 12:05:33.537825+05:30	2021-05-28 12:26:22.442487+05:30	f	17:02:00	6	10	f	\N	\N
5	Clinic		7878787878	gytyg4565456	Sri Devi Clinic	\N	5/3278 Adaiyar	786656	Karnataka	Bengaluru	9869669867	9778776767	\N	13.0714423	77.53514	f	\N	2021-04-29 18:49:27.342651+05:30	2021-05-28 12:48:15.364864+05:30	f	\N	3	13	f	{{"6:45 pm","6:45 pm",0},{"6:45 pm","6:45 pm",1},{"6:45 pm","6:45 pm",2},{"6:45 pm","6:45 pm",3},{"6:45 pm","6:45 pm",4},{"6:45 pm","6:45 pm",5},{"6:45 pm","6:45 pm",6}}	\N
47	Clinic	clinic/images/DP/1620372051_0804646_7070707070_9b2c4680-1b70-4c8e-975b-87d45d6ad364.jpg	9060606060	adadad	Madiwala	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	12.92273	77.63299	f	\N	2021-05-07 12:50:51.080901+05:30	2021-05-29 12:56:52.865101+05:30	f	\N	4	17	f	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:00 pm",3},{"6:00 am","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
46	Clinic	clinic/images/DP/1620367644_621792_7070707070_35764f62-6635-422a-853a-114bd64bdeb5.jpg	9060606060	adadad	Garden singapura	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.07449	77.53465	f	\N	2021-05-07 11:37:24.622096+05:30	2021-05-28 12:48:26.493703+05:30	f	\N	4	15	f	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:00 pm",3},{"6:00 am","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
42	Clinic	clinic/images/DP/1620367214_6554885_7070707070_023a2feb-511d-40e5-8a97-d41645f4a84c.jpg	9060606060	adadad	Kammagondahalli	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.05914	77.53459	f	\N	2021-05-07 11:30:14.656117+05:30	2021-05-29 08:26:59.466383+05:30	f	\N	4	16	f	{{"12:10 am","7:00 pm",0},{"6:00 am","7:00 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:00 pm",3},{"6:00 am","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
44	Clinic	clinic/images/DP/1620367476_8949633_7070707070_36116608-bb4b-471f-88aa-0d7fe5e39a85.jpg	9060606060	adadad	Prakriya hospital	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.04846	77.51922	f	\N	2021-05-07 11:34:36.895445+05:30	2021-05-28 12:41:29.302893+05:30	f	\N	4	12	f	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:00 pm",3},{"6:00 am","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
51	Clinic	clinic/images/DP/1620893460_3532004_7010117100_3f3e07b6-cf3d-4d00-b4ea-dd65148ce285.jpg	9060606060	adadad	new clinic	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.0714471	77.5351429	f	\N	2021-05-13 13:41:00.353431+05:30	2021-05-29 12:56:52.885128+05:30	f	\N	25	18	f	{{"2:15 pm","9:15 pm",0},{"4:40 pm","6:40 pm",1},{"10:40 pm","6:40 pm",2},{"9:40 pm","1:40 pm",3},{"9:40 pm","3:40 pm",4},{"9:40 pm","4:40 pm",5},{"8:40 pm","4:40 pm",6}}	\N
49	MedicalStore	clinic/images/DP/1620648186_578308_7878987878_9afe9a0a-85f1-4ffd-97ea-cba180c049a0.jpg	9060606060	adadad	Muthu clinic	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.0715731	77.5348552	f	\N	2021-05-10 17:33:06.578785+05:30	2021-05-10 17:33:09.392073+05:30	f	\N	6	3	t	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:00 pm",3},{"6:00 am","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
48	MedicalStore	clinic/images/DP/1620647827_6182168_7878987878_d94670eb-f5c6-465e-a1f2-734e6ee773ea.jpg	9060606060	adadad	new clinic	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.0715823	77.5348563	f	\N	2021-05-10 17:27:07.618499+05:30	2021-05-10 17:28:38.845958+05:30	f	\N	6	2	t	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:00 pm",3},{"6:00 am","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
50	MedicalStore	clinic/images/DP/1620884298_1547716_7010117179_0c69fbca-111f-4ad3-809c-4eb43ce9e67a.jpg	9060606060	adadad	new clinic	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.0716134	77.5348929	f	\N	2021-05-13 11:08:18.155813+05:30	2021-05-13 11:08:23.848318+05:30	f	\N	27	4	t	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:00 pm",3},{"6:00 am","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
54	Clinic		9060606060	adadad	new clinic	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.0714591	77.5350946	f	\N	2021-05-31 11:35:43.105398+05:30	2021-05-31 11:35:43.151803+05:30	f	\N	31	19	t	\N	\N
52	MedicalStore	clinic/images/DP/1620895569_8681424_7878987878_804b600e-4789-40b3-998a-5b64174b09b6.jpg	9060606060	adadad	new Medical	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.0714686	77.5351025	f	\N	2021-05-13 14:16:09.868361+05:30	2021-05-13 14:16:29.397544+05:30	f	\N	6	5	t	{{"3:13 pm","7:00 pm",0},{"6:00 am","7:00 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:13 pm",3},{"6:13 pm","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
53	MedicalStore	clinic/images/DP/1620898505_489093_9902299176_a9e83e7d-d63e-4424-98a6-3ce146b25831.jpg	9060606060	adadad	Abi Medical	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.0730746	77.5339804	f	\N	2021-05-13 15:05:05.489476+05:30	2021-05-13 15:05:08.786681+05:30	f	\N	33	6	t	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:00 pm",3},{"6:00 am","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
43	Clinic	clinic/images/DP/1621423193_1188118_7010117100_944265f9-efbc-43cf-b0da-47e15492caee.jpg	3636363636	adadad	Jallahalli east	\N	Your	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.07080	77.54513	f	\N	2021-05-07 11:33:29.545469+05:30	2021-05-28 12:48:22.403419+05:30	f	\N	25	14	f	{{"8:08 am","7:00 pm",0},{"4:08 am","2:08 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:00 pm",3},{"6:00 am","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
45	Clinic	clinic/images/DP/1620367564_9746182_7070707070_f7cf5a86-1a97-418f-9fbf-38fd3d71999a.jpg	9060606060	adadad	National clinic	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.07506	77.53535	f	\N	2021-05-07 11:36:04.974777+05:30	2021-05-28 12:41:27.33768+05:30	f	\N	4	11	f	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:00 pm",3},{"6:00 am","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
61	Clinic	clinic/images/DP/1622442087_4410877_7070707070_2a048a33-e845-41a4-98e3-a2fbfb9a1a67.jpg	9060606060	adadad	new clinic	\N	sdddkgkfjskfka	465482	karnataka	bengaluru	9698564241	9568659596	\N	13.071458	77.5350884	f	\N	2021-05-31 11:51:27.441414+05:30	2021-05-31 11:51:37.096553+05:30	f	\N	4	26	t	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",1},{"6:00 am","7:00 pm",2},{"6:00 am","7:00 pm",3},{"6:00 am","7:00 pm",4},{"6:00 am","7:00 pm",5},{"6:00 am","7:00 pm",6}}	\N
\.


--
-- Data for Name: prescriptionapp_clinicgroupthread; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_clinicgroupthread (id, uid, created, clinic_id, "forUser_id", clinictitle, customertitle) FROM stdin;
1	4b91f0a6-aa49-11eb-9494-c38ab5d326aa	2021-05-01 12:18:54.190714+05:30	1	7	Sri Devi Clinic	Patient Pateint 
2	92f96614-af16-11eb-9ff6-eb7a86173272	2021-05-07 14:58:25.378688+05:30	43	7	Jallahalli east	Patient Pateint 
3	54fe51d8-b18e-11eb-ab87-7fe0a1d7d93a	2021-05-10 18:20:43.330456+05:30	49	7	Muthu clinic	Patient Pateint 
4	261ad242-bb9d-11eb-a10b-71f41898745e	2021-05-23 13:31:58.818031+05:30	42	7	Kammagondahalli	Patient Pateint 
5	8a81321a-bc62-11eb-a10b-71f41898745e	2021-05-24 13:04:58.124673+05:30	42	44	Kammagondahalli	Patient kamaraj 
\.


--
-- Data for Name: prescriptionapp_disease; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_disease (id, created, updated, title, description) FROM stdin;
1	2021-05-19 16:21:23.945652+05:30	2021-05-19 16:21:23.945727+05:30	disease0	\N
2	2021-05-19 16:21:23.995619+05:30	2021-05-19 16:21:23.995631+05:30	disease1	\N
3	2021-05-19 16:21:24.005587+05:30	2021-05-19 16:21:24.005596+05:30	disease2	\N
4	2021-05-19 20:37:41.143209+05:30	2021-05-19 20:37:41.143261+05:30	Fever	\N
5	2021-05-20 17:25:49.938695+05:30	2021-05-20 17:25:49.938742+05:30	ss|	\N
6	2021-05-27 13:16:21.38746+05:30	2021-05-27 13:16:21.387514+05:30		\N
7	2021-05-29 17:07:38.251459+05:30	2021-05-29 17:07:38.251487+05:30	cancer	\N
\.


--
-- Data for Name: prescriptionapp_doctorthread; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_doctorthread (id, doctortitle, customertitle, uid, created, doctor_id, "forUser_id") FROM stdin;
1	Doctor Doctor paul 	Patient Pateint 	d4c9cdd4-ac02-11eb-a08d-b7b7cdb1ee71	2021-05-03 16:59:32.386034+05:30	4	7
2	Doctor Doctor paul 	Patient Doctor paul 	588c262c-adc9-11eb-b784-ed6b6c8dff34	2021-05-05 23:13:04.969534+05:30	4	4
3	Doctor Doctor vam  awef	Patient Pateint 	e58ce0bc-ba0c-11eb-a10b-71f41898745e	2021-05-21 13:46:51.770503+05:30	25	7
4	Doctor kamaraj 	Patient Pateint 	ebb7f4d6-ba20-11eb-a10b-71f41898745e	2021-05-21 16:10:12.125011+05:30	44	7
5	Doctor monster corona	Patient Pateint 	30fc28fc-beac-11eb-9b61-cd8f0d169fad	2021-05-27 10:57:12.938958+05:30	53	7
\.


--
-- Data for Name: prescriptionapp_doctortimings; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_doctortimings (id, created, updated, timings, type, doctorshift_id) FROM stdin;
127	2021-05-25 13:19:48.399756+05:30	2021-05-25 13:19:48.477527+05:30	{{"1:18 PM","1:18 PM"}}	Monday	22
128	2021-05-25 13:19:48.399802+05:30	2021-05-25 13:19:48.498997+05:30	{{"1:18 PM","1:18 PM"}}	Tuesday	22
129	2021-05-25 13:19:48.399828+05:30	2021-05-25 13:19:48.506596+05:30	{{"1:18 PM","1:18 PM"}}	Wednesday	22
130	2021-05-25 13:19:48.399849+05:30	2021-05-25 13:19:48.516146+05:30	{{"1:18 PM","1:18 PM"}}	Thursday	22
131	2021-05-25 13:19:48.399868+05:30	2021-05-25 13:19:48.526161+05:30	{{"1:18 PM","1:18 PM"},{"1:18 PM","1:18 PM"}}	Friday	22
132	2021-05-25 13:19:48.399888+05:30	2021-05-25 13:19:48.535277+05:30	{{"1:18 PM","1:18 PM"}}	Saturday	22
133	2021-05-25 13:19:48.399907+05:30	2021-05-25 13:19:48.545299+05:30	{{"1:18 PM","1:18 PM"}}	Sunday	22
134	2021-05-25 13:20:47.021845+05:30	2021-05-25 13:20:47.099185+05:30	{{"1:19 PM","1:19 PM"}}	Monday	23
135	2021-05-25 13:20:47.021984+05:30	2021-05-25 13:20:47.106847+05:30	{{"1:19 PM","1:19 PM"}}	Tuesday	23
136	2021-05-25 13:20:47.022062+05:30	2021-05-25 13:20:47.116794+05:30	{{"1:19 PM","1:19 PM"}}	Wednesday	23
137	2021-05-25 13:20:47.022125+05:30	2021-05-25 13:20:47.126893+05:30	{{"1:19 PM","1:19 PM"}}	Thursday	23
138	2021-05-25 13:20:47.022185+05:30	2021-05-25 13:20:47.13689+05:30	{{"1:19 PM","1:19 PM"}}	Friday	23
139	2021-05-25 13:20:47.022244+05:30	2021-05-25 13:20:47.146826+05:30	{{"1:19 PM","1:19 PM"}}	Saturday	23
140	2021-05-25 13:20:47.0223+05:30	2021-05-25 13:20:47.156839+05:30	{{"1:19 PM","1:19 PM"}}	Sunday	23
141	2021-05-25 13:22:04.46897+05:30	2021-05-25 13:22:04.547765+05:30	{{"1:21 PM","1:21 PM"}}	Monday	24
142	2021-05-25 13:22:04.468992+05:30	2021-05-25 13:22:04.560051+05:30	{{"1:21 PM","1:21 PM"}}	Tuesday	24
143	2021-05-25 13:22:04.469005+05:30	2021-05-25 13:22:04.569973+05:30	{{"1:21 PM","1:21 PM"}}	Wednesday	24
144	2021-05-25 13:22:04.469016+05:30	2021-05-25 13:22:04.580024+05:30	{{"1:21 PM","1:21 PM"}}	Thursday	24
145	2021-05-25 13:22:04.469026+05:30	2021-05-25 13:22:04.590244+05:30	{{"1:21 PM","1:21 PM"}}	Friday	24
146	2021-05-25 13:22:04.469036+05:30	2021-05-25 13:22:04.599578+05:30	{{"1:21 PM","1:21 PM"}}	Saturday	24
99	2021-05-21 14:01:52.266598+05:30	2021-05-24 14:22:37.171064+05:30	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",1}}	Monday	18
100	2021-05-21 14:01:52.266792+05:30	2021-05-24 14:22:37.212147+05:30	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",2}}	Tuesday	18
101	2021-05-21 14:01:52.266878+05:30	2021-05-24 14:22:37.237136+05:30	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",3}}	Wednesday	18
102	2021-05-21 14:01:52.266952+05:30	2021-05-24 14:22:37.247188+05:30	{{"6:00 am","7:00 pm",0}}	Thursday	18
103	2021-05-21 14:01:52.267018+05:30	2021-05-24 14:22:37.260478+05:30	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",5}}	Friday	18
104	2021-05-21 14:01:52.26708+05:30	2021-05-24 14:22:37.270226+05:30	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",6}}	Saturday	18
105	2021-05-21 14:01:52.267162+05:30	2021-05-24 14:22:37.280341+05:30	{{"6:00 am","7:00 pm",0},{"6:00 am","7:00 pm",0}}	Sunday	18
120	2021-05-21 14:24:26.47867+05:30	2021-05-24 18:56:06.568995+05:30	{{"2:23 PM","2:23 PM"},{"2:23 PM","3:23 PM"},{"2:23 PM","3:23 PM"}}	Monday	21
121	2021-05-21 14:24:26.478693+05:30	2021-05-24 18:56:06.593766+05:30	{{"2:23 PM","4:23 PM"},{"1:13 PM","2:13 PM"}}	Tuesday	21
122	2021-05-21 14:24:26.47871+05:30	2021-05-24 18:56:06.603503+05:30	{{"2:23 PM","4:23 PM"}}	Wednesday	21
123	2021-05-21 14:24:26.478722+05:30	2021-05-24 18:56:06.61362+05:30	{{"2:23 PM","2:23 PM"}}	Thursday	21
124	2021-05-21 14:24:26.478733+05:30	2021-05-24 18:56:06.623679+05:30	{{"2:23 PM","4:23 PM"}}	Friday	21
125	2021-05-21 14:24:26.478742+05:30	2021-05-24 18:56:06.6336+05:30	{{"2:23 PM","5:23 PM"}}	Saturday	21
126	2021-05-21 14:24:26.478752+05:30	2021-05-24 18:56:06.64362+05:30	{{"4:23 PM","2:23 PM"}}	Sunday	21
147	2021-05-25 13:22:04.469046+05:30	2021-05-25 13:22:04.608197+05:30	{{"1:21 PM","1:21 PM"}}	Sunday	24
148	2021-05-27 17:12:13.773378+05:30	2021-05-27 17:12:13.837371+05:30	{{"4:41 PM","5:11 PM"}}	Monday	25
149	2021-05-27 17:12:13.773408+05:30	2021-05-27 17:12:13.844366+05:30	{{"5:11 PM","5:11 PM"}}	Tuesday	25
150	2021-05-27 17:12:13.773423+05:30	2021-05-27 17:12:13.854776+05:30	{{"5:11 PM","5:11 PM"}}	Wednesday	25
151	2021-05-27 17:12:13.773435+05:30	2021-05-27 17:12:13.865288+05:30	{{"5:11 PM","5:11 PM"}}	Thursday	25
152	2021-05-27 17:12:13.773446+05:30	2021-05-27 17:12:13.922001+05:30	{{"5:11 PM","5:11 PM"}}	Friday	25
153	2021-05-27 17:12:13.773457+05:30	2021-05-27 17:12:13.934071+05:30	{{"5:11 PM","5:11 PM"}}	Saturday	25
154	2021-05-27 17:12:13.773468+05:30	2021-05-27 17:12:13.944158+05:30	{}	Sunday	25
155	2021-05-30 14:11:54.192463+05:30	2021-05-30 14:11:54.312322+05:30	{{"2:11 PM","2:11 PM"}}	Monday	26
156	2021-05-30 14:11:54.192494+05:30	2021-05-30 14:11:54.316305+05:30	{{"2:11 PM","12:11 PM"}}	Tuesday	26
157	2021-05-30 14:11:54.192511+05:30	2021-05-30 14:11:54.326318+05:30	{{"2:11 PM","2:11 PM"}}	Wednesday	26
158	2021-05-30 14:11:54.192524+05:30	2021-05-30 14:11:54.336261+05:30	{{"2:11 PM","2:11 PM"}}	Thursday	26
159	2021-05-30 14:11:54.192538+05:30	2021-05-30 14:11:54.346321+05:30	{{"2:11 PM","2:11 PM"}}	Friday	26
160	2021-05-30 14:11:54.192551+05:30	2021-05-30 14:11:54.356338+05:30	{{"2:11 PM","2:11 PM"}}	Saturday	26
161	2021-05-30 14:11:54.192563+05:30	2021-05-30 14:11:54.366394+05:30	{{"2:11 PM","2:11 PM"}}	Sunday	26
162	2021-05-30 14:15:39.099929+05:30	2021-05-30 14:15:39.139085+05:30	{{"2:15 PM","2:15 PM"}}	Monday	27
163	2021-05-30 14:15:39.099951+05:30	2021-05-30 14:15:39.148399+05:30	{{"2:15 PM","2:15 PM"}}	Tuesday	27
164	2021-05-30 14:15:39.099963+05:30	2021-05-30 14:15:39.157743+05:30	{}	Wednesday	27
165	2021-05-30 14:15:39.099974+05:30	2021-05-30 14:15:39.167855+05:30	{}	Thursday	27
166	2021-05-30 14:15:39.099983+05:30	2021-05-30 14:15:39.177829+05:30	{}	Friday	27
167	2021-05-30 14:15:39.099993+05:30	2021-05-30 14:15:39.187839+05:30	{}	Saturday	27
168	2021-05-30 14:15:39.100002+05:30	2021-05-30 14:15:39.198+05:30	{}	Sunday	27
\.


--
-- Data for Name: prescriptionapp_inventory; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_inventory (id, created, updated, title) FROM stdin;
1	2021-04-27 19:35:49.792035+05:30	2021-04-27 19:35:49.792049+05:30	Test clinic
2	2021-05-10 17:27:07.67974+05:30	2021-05-10 17:27:07.679767+05:30	new clinic
3	2021-05-10 17:33:06.60138+05:30	2021-05-10 17:33:06.601389+05:30	Muthu clinic
4	2021-05-13 11:08:18.201063+05:30	2021-05-13 11:08:18.201115+05:30	new clinic
5	2021-05-13 14:16:09.885077+05:30	2021-05-13 14:16:09.885092+05:30	new Medical
6	2021-05-13 15:05:05.516355+05:30	2021-05-13 15:05:05.516379+05:30	Abi Medical
7	2021-05-27 12:58:11.539651+05:30	2021-05-27 12:58:11.539662+05:30	Sri Devi Clinic
8	2021-05-27 20:41:40.128486+05:30	2021-05-27 20:41:40.128562+05:30	sridevi
9	2021-05-28 12:25:55.991958+05:30	2021-05-28 12:25:55.99197+05:30	Sri Annai Medicals
10	2021-05-28 12:26:22.42511+05:30	2021-05-28 12:26:22.425122+05:30	Sri Annai Medicals
11	2021-05-28 12:41:27.319523+05:30	2021-05-28 12:41:27.319537+05:30	National clinic
12	2021-05-28 12:41:29.270838+05:30	2021-05-28 12:41:29.270853+05:30	Prakriya hospital
13	2021-05-28 12:48:15.347035+05:30	2021-05-28 12:48:15.347049+05:30	Sri Devi Clinic
14	2021-05-28 12:48:22.360165+05:30	2021-05-28 12:48:22.360179+05:30	Jallahalli east
15	2021-05-28 12:48:26.48753+05:30	2021-05-28 12:48:26.48755+05:30	Garden singapura
16	2021-05-29 08:26:59.442797+05:30	2021-05-29 08:26:59.442809+05:30	Kammagondahalli
17	2021-05-29 12:56:52.841442+05:30	2021-05-29 12:56:52.841458+05:30	Madiwala
18	2021-05-29 12:56:52.876825+05:30	2021-05-29 12:56:52.876833+05:30	new clinic
19	2021-05-31 11:35:43.142341+05:30	2021-05-31 11:35:43.142393+05:30	new clinic
20	2021-05-31 11:38:25.94378+05:30	2021-05-31 11:38:25.943792+05:30	new clinic
21	2021-05-31 11:39:25.357886+05:30	2021-05-31 11:39:25.357899+05:30	new clinic
22	2021-05-31 11:40:46.649507+05:30	2021-05-31 11:40:46.649557+05:30	new clinic
23	2021-05-31 11:41:50.895566+05:30	2021-05-31 11:41:50.895579+05:30	new clinic
24	2021-05-31 11:45:22.692358+05:30	2021-05-31 11:45:22.692412+05:30	new clinicpoo
25	2021-05-31 11:46:43.580354+05:30	2021-05-31 11:46:43.580365+05:30	new clinicppp
26	2021-05-31 11:51:27.494927+05:30	2021-05-31 11:51:27.494981+05:30	new clinic
\.


--
-- Data for Name: prescriptionapp_inventorycategory; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_inventorycategory (id, created, updated, title, inventory_id) FROM stdin;
1	2021-05-28 12:26:22.462601+05:30	2021-05-28 12:26:22.462613+05:30	first	10
14	2021-06-02 11:25:57.307727+05:30	2021-06-02 11:25:57.307738+05:30	main	7
15	2021-06-02 20:20:43.530502+05:30	2021-06-02 20:20:43.530515+05:30	test	8
16	2021-06-02 21:27:00.951456+05:30	2021-06-02 21:27:00.951467+05:30	cxvczxvcxzvx	8
17	2021-06-02 21:31:00.63092+05:30	2021-06-02 21:31:00.630931+05:30	test	13
18	2021-06-03 13:31:35.879716+05:30	2021-06-03 13:31:35.879729+05:30	TEST	17
21	2021-06-04 16:07:18.407497+05:30	2021-06-04 16:07:18.407507+05:30	Test	1
22	2021-06-04 17:14:17.005323+05:30	2021-06-04 17:14:17.005334+05:30	Neww	3
23	2021-06-04 19:48:25.496545+05:30	2021-06-04 19:48:25.496556+05:30	test	16
24	2021-06-05 17:47:22.230995+05:30	2021-06-05 17:47:22.231006+05:30	tm	16
\.


--
-- Data for Name: prescriptionapp_inventoryorders; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_inventoryorders (id, created, updated, amount, comment, discount, expected_arriving, inventory_id, order_details, status, from_contact, "from_contactNo") FROM stdin;
26	2021-06-05 18:16:58.384198+05:30	2021-06-05 18:16:58.477885+05:30	866	\N	0	2021-06-05	1	Check h h h 	Pending	 Bhgd	969696969696
24	2021-06-05 17:08:48.292523+05:30	2021-06-05 19:26:04.512936+05:30	6	\N	9	2021-06-05	1	Shhssh	Received	Posjk	8973591876
25	2021-06-05 17:26:13.26804+05:30	2021-06-05 19:35:35.71923+05:30	8776	\N	0	2021-06-05	1	Zggsshvv	Received	Edited	8973591775
10	2021-05-29 14:09:23.873331+05:30	2021-05-29 14:16:11.983816+05:30	100	\N	101	2021-05-19	1	sharma	Received	\N	\N
13	2021-06-02 11:59:50.417333+05:30	2021-06-02 12:14:49.719806+05:30	2220	\N	220	2021-06-02	7	ewfwaefew	Received	asdasd	aasddd
14	2021-06-02 21:21:43.160162+05:30	2021-06-02 21:23:05.251882+05:30	100	\N	10	2021-06-02	8	aweffaf	Received	Abhishek	9902299176
16	2021-06-03 18:34:57.064141+05:30	2021-06-03 18:35:14.25575+05:30	10	\N	0	2021-06-03	3	eawfawfawef	Received	wer3ewr	werwr
18	2021-06-03 19:00:49.687981+05:30	2021-06-03 19:03:07.248845+05:30	0	\N	0	2021-06-03	3	sadsadasd	Received	asdsad	asdsda
19	2021-06-04 19:17:49.250081+05:30	2021-06-04 19:18:42.3959+05:30	1000	\N	4	2021-06-04	1	base	Received	kamaraj	8973591175
21	2021-06-04 20:06:04.072846+05:30	2021-06-04 20:06:04.078629+05:30	0	\N	0	2021-06-04	16		Pending	\N	\N
20	2021-06-04 20:06:01.063214+05:30	2021-06-04 20:06:38.417595+05:30	0	\N	0	2021-06-04	16		Received	\N	
22	2021-06-05 16:58:20.301885+05:30	2021-06-05 16:58:20.301895+05:30	36	\N	3	2021-06-05	1	Shha	Pending	Nssjjs	8973591778
\.


--
-- Data for Name: prescriptionapp_inventoryorders_items; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_inventoryorders_items (id, inventoryorders_id, subinventories_id) FROM stdin;
3	13	76
4	13	77
5	14	80
6	14	81
7	14	82
16	19	103
17	19	104
18	20	106
20	24	108
21	25	109
22	26	111
\.


--
-- Data for Name: prescriptionapp_issuedprescription; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_issuedprescription (id, created, updated, issued_date, clinic_id, prescription_id) FROM stdin;
1	2021-04-28 14:26:37.77544+05:30	2021-04-28 14:26:37.775452+05:30	\N	4	1
2	2021-04-28 14:27:30.683927+05:30	2021-04-28 14:27:30.683937+05:30	\N	4	1
3	2021-05-11 16:29:26.379603+05:30	2021-05-11 16:29:26.379613+05:30	\N	49	65
4	2021-05-13 17:09:20.719381+05:30	2021-05-13 17:09:20.719392+05:30	\N	49	68
5	2021-05-13 17:13:07.19039+05:30	2021-05-13 17:13:07.190402+05:30	\N	49	68
6	2021-05-27 12:28:27.074958+05:30	2021-05-27 12:28:27.074969+05:30	\N	4	84
7	2021-05-27 12:29:23.728144+05:30	2021-05-27 12:29:23.728155+05:30	\N	4	84
8	2021-05-27 12:30:23.264348+05:30	2021-05-27 12:30:23.264359+05:30	\N	4	84
9	2021-06-05 13:33:49.795446+05:30	2021-06-05 13:33:49.795459+05:30	\N	42	192
10	2021-06-05 13:34:06.571245+05:30	2021-06-05 13:34:06.571261+05:30	\N	42	192
11	2021-06-05 13:34:14.633311+05:30	2021-06-05 13:34:14.633322+05:30	\N	42	192
12	2021-06-05 18:53:10.28746+05:30	2021-06-05 18:53:10.287469+05:30	\N	42	194
13	2021-06-05 20:03:59.789292+05:30	2021-06-05 20:03:59.789303+05:30	\N	42	194
14	2021-06-05 20:04:08.094364+05:30	2021-06-05 20:04:08.094437+05:30	\N	42	194
\.


--
-- Data for Name: prescriptionapp_items; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_items (id) FROM stdin;
\.


--
-- Data for Name: prescriptionapp_medicine; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_medicine (id, type, created, updated, title, uses, category, marketprice, prescription_required, maxretailprice, is_verified, variants, brand) FROM stdin;
61	Liquid	2021-06-04 17:20:14.798808+05:30	2021-06-04 17:20:14.816718+05:30	liqour	\N	\N	0	f	0	f	\N	\N
2	Others	2021-04-27 12:29:16.901035+05:30	2021-05-26 21:43:54.603586+05:30	utrera	afqf	GeneralSalesList	3	t	3	t	\N	\N
3	Drops	2021-04-27 12:29:32.759505+05:30	2021-05-26 21:43:54.653035+05:30	trexf	sfvsvs	PharmacyMedicines.	3	t	4	t	\N	\N
4	Inhalers	2021-04-28 12:28:31.428789+05:30	2021-05-26 21:43:54.663048+05:30	Uuu	\N	\N	0	f	85	f	\N	\N
5	Liquid	2021-05-04 13:04:46.707768+05:30	2021-05-26 21:43:54.673+05:30	Cipla	\N	\N	0	f	58	f	{"500 mg","110 mg"}	\N
6	Capsules	2021-05-04 13:07:43.010974+05:30	2021-05-26 21:43:54.683181+05:30	Syrup	\N	\N	0	f	100	f	{"100 ml "}	\N
7	Liquid	2021-05-04 13:08:42.585495+05:30	2021-05-26 21:43:54.693214+05:30	Bandage	\N	\N	0	f	50	f	{}	\N
8	Suppositories	2021-05-04 14:00:09.647735+05:30	2021-05-26 21:43:54.703165+05:30	Testosterone	\N	\N	0	f	45	f	{"100 mg"}	\N
9	Injections	2021-05-04 14:18:53.622947+05:30	2021-05-26 21:43:54.713589+05:30	Messi	\N	\N	0	f	56	f	{"100 mg"}	\N
10	Capsules	2021-05-04 14:20:45.51252+05:30	2021-05-26 21:43:54.723617+05:30	Mein	\N	\N	0	f	5	f	{"100 mg"}	\N
11	Suppositories	2021-05-04 14:26:07.042838+05:30	2021-05-26 21:43:54.73366+05:30	Ajja	\N	\N	0	f	616	f	{"100 ml"}	\N
12	Cream	2021-05-04 15:06:04.18493+05:30	2021-05-26 21:43:54.743663+05:30	Syrupp	\N	\N	0	f	2	f	{"100 mg"}	\N
13	Inhalers	2021-05-04 15:06:37.100979+05:30	2021-05-26 21:43:54.753706+05:30	Tablet	\N	\N	0	f	6	f	{"100 mg"}	\N
45	Suppositories	2021-05-04 16:13:45.83508+05:30	2021-05-26 21:43:54.763724+05:30	Capsules	\N	\N	0	f	6	f	{"100 mg"}	\N
46	Drops	2021-05-04 16:14:16.669039+05:30	2021-05-26 21:43:54.773741+05:30	Oinment	\N	\N	0	f	2	f	{"100 mg"}	\N
47	Capsules	2021-05-06 19:41:53.243891+05:30	2021-05-26 21:43:54.783778+05:30	Injection	\N	\N	0	f	36	f	{60mg}	\N
48	Cream	2021-05-06 19:42:26.239881+05:30	2021-05-26 21:43:54.793803+05:30	Drops	\N	\N	0	f	53	f	{60mg}	\N
49	Suppositories	2021-05-06 19:43:05.117547+05:30	2021-05-26 21:43:54.803803+05:30	Inhalers	\N	\N	0	f	65	f	{60mg}	\N
50	Capsules	2021-05-06 19:43:35.552443+05:30	2021-05-26 21:43:54.81387+05:30	Suppositories	\N	\N	0	f	6	f	{60mg}	\N
51	Tablet	2021-05-19 19:39:05.059704+05:30	2021-05-26 21:43:54.823885+05:30	awefafawf	\N	\N	0	f	0	t	\N	\N
52	Capsules	2021-05-27 13:16:21.355759+05:30	2021-05-27 13:16:21.355785+05:30	1	\N	\N	0	f	0	t	\N	\N
53	Liquid	2021-05-27 15:48:12.50574+05:30	2021-05-27 15:48:12.505752+05:30	awefaweffeff	\N	\N	0	f	0	t	\N	\N
54	Tablet	2021-05-27 15:55:58.628161+05:30	2021-05-27 15:55:58.628212+05:30	Dolomites	\N	\N	0	f	0	t	\N	\N
55	Cream	2021-05-29 17:07:38.193507+05:30	2021-05-29 17:07:38.193557+05:30	Ajja	\N	\N	0	f	0	t	\N	\N
1	Inhalers	2021-04-27 12:29:02.004154+05:30	2021-05-29 17:32:03.954037+05:30	paracetamol	dwfwfvsavsav	GeneralSalesList	6	t	3	t	\N	\N
56	Liquid	2021-05-31 13:24:05.885445+05:30	2021-05-31 13:24:05.925271+05:30	utrera	\N	\N	0	f	0	f	\N	\N
57	Drops	2021-05-31 13:24:25.217898+05:30	2021-05-31 13:24:25.235414+05:30	medito	\N	\N	0	f	0	f	\N	\N
58	Liquid	2021-05-31 16:55:00.125485+05:30	2021-05-31 16:55:00.145324+05:30	paracetamol	\N	\N	0	f	0	f	\N	\N
59	Drops	2021-06-04 16:09:21.340167+05:30	2021-06-04 16:09:21.367681+05:30	Testliquid	\N	\N	0	f	0	f	\N	\N
60	Liquid	2021-06-04 17:19:18.748711+05:30	2021-06-04 17:19:18.781202+05:30	aaxaxax	\N	\N	0	f	0	f	\N	\N
62	Tablet	2021-06-04 19:51:13.808198+05:30	2021-06-04 19:51:13.825135+05:30	paracetamola	\N	\N	0	f	0	f	\N	\N
63	Liquid	2021-06-04 20:03:30.17421+05:30	2021-06-04 20:03:30.190762+05:30	paracetomola	\N	\N	0	f	0	f	\N	\N
64	Liquid	2021-06-04 22:05:12.755073+05:30	2021-06-04 22:05:12.755081+05:30	testliquid	\N	\N	0	f	0	t	\N	\N
65	Capsules	2021-06-04 22:13:27.527004+05:30	2021-06-04 22:13:27.536284+05:30	awefawefffffffff	\N	\N	0	f	0	f	\N	\N
66	Liquid	2021-06-05 12:26:35.653404+05:30	2021-06-05 12:26:35.653412+05:30	ewaf	\N	\N	0	f	0	t	\N	\N
\.


--
-- Data for Name: prescriptionapp_medicinetimes; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_medicinetimes (id, created, updated, "specifiedTime", type, "fromDate", "toDate", days, after_food, morning_count, afternoon_count, night_count, qty_per_time, total_qty, medicine_id, command, variant) FROM stdin;
1	2021-04-27 12:30:12.94807+05:30	2021-04-27 12:30:12.948083+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	1	\N	\N
2	2021-04-27 12:30:12.967887+05:30	2021-04-27 12:30:12.967902+05:30	0	\N	\N	\N	3	f	0	1	0	0	2	2	\N	\N
3	2021-04-29 11:26:56.058107+05:30	2021-04-29 11:26:56.058118+05:30	0	\N	\N	\N	6	f	0	1	0	0	3	1	\N	\N
4	2021-05-04 16:42:26.958366+05:30	2021-05-04 16:42:26.958418+05:30	0	\N	\N	\N	0	f	100	100	100	0	0	12	\N	\N
5	2021-05-04 17:52:53.880475+05:30	2021-05-04 17:52:53.880529+05:30	0	\N	\N	\N	0	f	1	0	0	0	0	1	\N	\N
6	2021-05-04 17:52:53.89984+05:30	2021-05-04 17:52:53.899894+05:30	0	\N	\N	\N	6	f	1	0	0	0	0	5	\N	\N
7	2021-05-04 17:52:53.919872+05:30	2021-05-04 17:52:53.919924+05:30	0	\N	\N	\N	0	f	1	0	0	0	0	6	\N	\N
8	2021-05-05 13:43:17.079332+05:30	2021-05-05 13:43:17.079385+05:30	0	\N	\N	\N	0	f	0	0	0	0	0	1	\N	\N
9	2021-05-06 11:37:04.818357+05:30	2021-05-06 11:37:04.818381+05:30	0	\N	\N	\N	10	f	1	0	0	0	0	13	\N	\N
10	2021-05-06 11:45:31.4094+05:30	2021-05-06 11:45:31.409413+05:30	0	\N	\N	\N	2	f	1	0	0	0	0	13	\N	\N
11	2021-05-06 11:50:35.321091+05:30	2021-05-06 11:50:35.321144+05:30	0	\N	\N	\N	3	f	1	0	0	0	0	13	Udiduduxu	100 mg
12	2021-05-06 11:54:42.080308+05:30	2021-05-06 11:54:42.080359+05:30	0	\N	\N	\N	80	f	0	1	0	0	0	5	Hvhcggjj	500 mg
13	2021-05-06 12:07:19.311417+05:30	2021-05-06 12:07:19.311469+05:30	0	\N	\N	\N	5	f	1	0	0	0	0	13	Anmkabba	100 mg
14	2021-05-10 13:00:22.1331+05:30	2021-05-10 13:00:22.133153+05:30	0	\N	\N	\N	0	f	1	0	0	0	0	13	Jajaj	\N
15	2021-05-10 13:04:03.486642+05:30	2021-05-10 13:04:03.486696+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	13	Znznsjj	\N
16	2021-05-10 13:04:51.190171+05:30	2021-05-10 13:04:51.190228+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	13	Zbzjjsj	\N
17	2021-05-10 21:35:05.012975+05:30	2021-05-10 21:35:05.012989+05:30	0	\N	\N	\N	1	f	1	0	0	0	1	13	Abajajabna	\N
18	2021-05-10 22:55:05.185354+05:30	2021-05-10 22:55:05.185366+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	13	Jciccc	\N
51	2021-05-11 11:14:21.513872+05:30	2021-05-11 11:14:21.513926+05:30	0	\N	\N	\N	2	f	0	0	0	0	0	12	Sjsjsj	\N
52	2021-05-11 11:17:16.743473+05:30	2021-05-11 11:17:16.743482+05:30	0	\N	\N	\N	2	f	0	0	0	0	0	12	Sjsjsj	\N
53	2021-05-11 11:19:16.005454+05:30	2021-05-11 11:19:16.005511+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	12	Sjsjsj	\N
54	2021-05-11 11:19:20.576871+05:30	2021-05-11 11:19:20.576922+05:30	0	\N	\N	\N	2	f	0	0	0	0	0	12	Sjsjsj	\N
55	2021-05-11 11:23:37.333079+05:30	2021-05-11 11:23:37.333091+05:30	0	\N	\N	\N	2	f	1	1	1	0	6	12	Abajabsb	\N
56	2021-05-11 12:11:26.555876+05:30	2021-05-11 12:11:26.555886+05:30	0	\N	\N	\N	10	f	1	0	0	0	10	13	Vhahshsh	\N
57	2021-05-11 12:11:26.576119+05:30	2021-05-11 12:11:26.57613+05:30	0	\N	\N	\N	10	f	1	1	0	0	10	12	Whehevsh	\N
58	2021-05-11 12:11:26.59617+05:30	2021-05-11 12:11:26.596183+05:30	0	\N	\N	\N	0	f	0	0	0	0	0	7	Svshshbs	\N
59	2021-05-11 12:23:16.729397+05:30	2021-05-11 12:23:16.729448+05:30	0	\N	\N	\N	0	f	1	0	0	0	0	13	Abahah	\N
60	2021-05-11 12:23:16.748991+05:30	2021-05-11 12:23:16.749063+05:30	0	\N	\N	\N	2	f	1	0	0	0	10	12	AhHHH	\N
61	2021-05-11 12:23:16.766021+05:30	2021-05-11 12:23:16.766031+05:30	0	\N	\N	\N	0	f	1	0	0	0	1	46	Ahah	\N
62	2021-05-12 14:07:22.317648+05:30	2021-05-12 14:07:22.317659+05:30	0	\N	\N	\N	25	f	1	0	0	0	25	13	Abahahh	\N
63	2021-05-12 14:08:13.533673+05:30	2021-05-12 14:08:13.533725+05:30	0	\N	\N	\N	25	f	1	0	0	0	25	13	Qbhqqh	\N
64	2021-05-12 21:12:26.036436+05:30	2021-05-12 21:12:26.036486+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	13	Whahwh	\N
65	2021-05-12 21:15:31.945931+05:30	2021-05-12 21:15:31.94594+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	13	Sbahsjsjj	\N
66	2021-05-16 16:56:33.754109+05:30	2021-05-16 16:56:33.754169+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	13	Hahaha	\N
67	2021-05-17 13:51:31.759502+05:30	2021-05-17 13:51:31.759512+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	13	Aggaqggq	\N
68	2021-05-17 13:52:24.088921+05:30	2021-05-17 13:52:24.088985+05:30	0	\N	\N	\N	362	f	1	1	0	0	25	12	Qhahah	\N
69	2021-05-17 13:53:08.580603+05:30	2021-05-17 13:53:08.580612+05:30	0	\N	\N	\N	42	f	0	1	0	0	42	45	Agagg	\N
70	2021-05-17 13:53:46.622903+05:30	2021-05-17 13:53:46.622956+05:30	0	\N	\N	\N	36	f	1	0	0	0	36	5	Ahahhah	\N
71	2021-05-17 13:54:28.218014+05:30	2021-05-17 13:54:28.218031+05:30	0	\N	\N	\N	25	f	1	0	0	0	25	5	Ddhdhd	\N
72	2021-05-17 13:55:29.750779+05:30	2021-05-17 13:55:29.750856+05:30	0	\N	\N	\N	0	f	0	0	0	0	0	7	Sbahh	\N
73	2021-05-17 13:56:08.441199+05:30	2021-05-17 13:56:08.441266+05:30	0	\N	\N	\N	25	f	1	0	0	0	25	8	Snanskkw	\N
74	2021-05-17 13:56:49.026609+05:30	2021-05-17 13:56:49.026663+05:30	0	\N	\N	\N	0	f	0	0	0	0	0	7	Hsaiaiah	\N
75	2021-05-17 13:59:02.901142+05:30	2021-05-17 13:59:02.901155+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
76	2021-05-17 13:59:07.215291+05:30	2021-05-17 13:59:07.215331+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
77	2021-05-17 13:59:09.067133+05:30	2021-05-17 13:59:09.067144+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
78	2021-05-17 13:59:10.450925+05:30	2021-05-17 13:59:10.450938+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
79	2021-05-17 13:59:11.416664+05:30	2021-05-17 13:59:11.416718+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
80	2021-05-17 13:59:13.087916+05:30	2021-05-17 13:59:13.087929+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
81	2021-05-17 13:59:15.41401+05:30	2021-05-17 13:59:15.414025+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
82	2021-05-17 13:59:17.308579+05:30	2021-05-17 13:59:17.308589+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
83	2021-05-17 13:59:18.555178+05:30	2021-05-17 13:59:18.55523+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
84	2021-05-17 13:59:19.625585+05:30	2021-05-17 13:59:19.625659+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
85	2021-05-17 13:59:20.319884+05:30	2021-05-17 13:59:20.319936+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
86	2021-05-17 13:59:21.389488+05:30	2021-05-17 13:59:21.389503+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
87	2021-05-17 13:59:22.202552+05:30	2021-05-17 13:59:22.20258+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
88	2021-05-17 13:59:22.963348+05:30	2021-05-17 13:59:22.96336+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	5	Aghaah	\N
89	2021-05-17 16:36:14.837626+05:30	2021-05-17 16:36:14.837677+05:30	0	\N	\N	\N	25	f	1	0	0	0	25	13	Vhvhj	\N
90	2021-05-18 18:05:24.080789+05:30	2021-05-18 18:05:24.080838+05:30	0	\N	\N	\N	25	f	1	1	1	0	75	13	Ok take care	\N
91	2021-05-18 18:05:24.129936+05:30	2021-05-18 18:05:24.129984+05:30	0	\N	\N	\N	2	f	1	0	0	0	25	12	Svwgh	\N
92	2021-05-18 18:05:24.149917+05:30	2021-05-18 18:05:24.149966+05:30	0	\N	\N	\N	0	f	0	0	0	0	0	7	Hssjjsj	\N
93	2021-05-18 18:11:13.503106+05:30	2021-05-18 18:11:13.503117+05:30	0	\N	\N	\N	36	f	1	0	0	0	25	12	Wjwjj	\N
94	2021-05-19 18:32:53.42979+05:30	2021-05-19 18:32:53.429799+05:30	0	\N	\N	\N	34	f	20	20	20	0	20	2	waef	\N
95	2021-05-19 18:35:20.832617+05:30	2021-05-19 18:35:20.832626+05:30	0	\N	\N	\N	3	f	30	30	30	0	30	2	ewa	\N
96	2021-05-19 18:36:46.958072+05:30	2021-05-19 18:36:46.958115+05:30	0	\N	\N	\N	3423	f	0	0	0	0	0	2	awawf	\N
97	2021-05-19 19:32:48.955483+05:30	2021-05-19 19:32:48.955492+05:30	0	\N	\N	\N	1	f	1	0	0	0	1	13	cscscs	\N
98	2021-05-19 19:35:55.919872+05:30	2021-05-19 19:35:55.919882+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	13	xa	\N
99	2021-05-19 19:36:01.875401+05:30	2021-05-19 19:36:01.875411+05:30	0	\N	\N	\N	3	f	30	30	30	0	30	2	wae	\N
100	2021-05-19 19:36:01.895383+05:30	2021-05-19 19:36:01.895396+05:30	0	\N	\N	\N	3	f	10	10	10	0	10	2	aafew	\N
101	2021-05-19 19:37:02.575837+05:30	2021-05-19 19:37:02.575888+05:30	0	\N	\N	\N	5	f	1	0	0	0	5	13	fsfsf	\N
102	2021-05-19 19:39:05.020232+05:30	2021-05-19 19:39:05.020242+05:30	0	\N	\N	\N	3	f	30	30	30	0	30	2	wae	\N
103	2021-05-19 19:39:05.040272+05:30	2021-05-19 19:39:05.040283+05:30	0	\N	\N	\N	3	f	10	10	10	0	10	2	aafew	\N
104	2021-05-19 19:39:05.099839+05:30	2021-05-19 19:39:05.099849+05:30	0	\N	\N	\N	2	f	20	30	10	0	10	51	aweaef	\N
105	2021-05-19 19:40:55.741106+05:30	2021-05-19 19:40:55.741162+05:30	0	\N	\N	\N	13	f	1	0	0	0	34	12	sfsfefefef	\N
106	2021-05-19 19:40:59.751541+05:30	2021-05-19 19:40:59.751594+05:30	0	\N	\N	\N	34	f	30	30	230	0	20	6	waef	\N
107	2021-05-19 19:42:03.867841+05:30	2021-05-19 19:42:03.867893+05:30	0	\N	\N	\N	0	f	0	0	0	0	0	7	sfsfs	\N
108	2021-05-19 20:30:36.961762+05:30	2021-05-19 20:30:36.961777+05:30	0	\N	\N	\N	23	f	10	10	10	0	10	2	awefeawf	\N
109	2021-05-19 20:37:41.103375+05:30	2021-05-19 20:37:41.103429+05:30	0	\N	\N	\N	3	f	1	1	1	0	9	13	Eat only after	\N
110	2021-05-19 20:37:41.122827+05:30	2021-05-19 20:37:41.12288+05:30	0	\N	\N	\N	3	f	1	0	0	0	50	12	Ok 	\N
111	2021-05-19 20:47:40.74692+05:30	2021-05-19 20:47:40.746975+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	13	Shan	\N
112	2021-05-19 20:51:26.693881+05:30	2021-05-19 20:51:26.693934+05:30	0	\N	\N	\N	25	f	1	0	0	0	25	13	Chchcjhc	\N
113	2021-05-20 12:41:53.450239+05:30	2021-05-20 12:41:53.450292+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	13	Qhhqy	\N
114	2021-05-20 12:46:50.959224+05:30	2021-05-20 12:46:50.959238+05:30	0	\N	\N	\N	0	f	0	0	0	0	0	7	Gwahahh	\N
115	2021-05-20 12:56:24.859552+05:30	2021-05-20 12:56:24.859606+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	13	Eueigssgh	\N
116	2021-05-20 17:24:18.412523+05:30	2021-05-20 17:24:18.412544+05:30	0	\N	\N	\N	5	f	1	0	0	0	5	13	ffffefe	\N
117	2021-05-21 17:57:02.718246+05:30	2021-05-21 17:57:02.718261+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	13	Gahajaj	\N
118	2021-05-22 11:14:24.179815+05:30	2021-05-22 11:14:24.179827+05:30	0	\N	\N	\N	10	f	1	0	0	0	10	13	Hajaja	\N
119	2021-05-22 11:14:24.199832+05:30	2021-05-22 11:14:24.199842+05:30	0	\N	\N	\N	0	f	0	0	0	0	0	7	Sbahha	\N
120	2021-05-23 13:09:51.271449+05:30	2021-05-23 13:09:51.271504+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	13	Shahhasv	\N
121	2021-05-24 16:03:11.918855+05:30	2021-05-24 16:03:11.918907+05:30	0	\N	\N	\N	2	f	1	1	0	0	4	13	Vhhh	\N
122	2021-05-24 16:03:11.938117+05:30	2021-05-24 16:03:11.938169+05:30	0	\N	\N	\N	3	f	1	1	1	0	9	13	Gauuqg	\N
123	2021-05-24 16:03:11.958027+05:30	2021-05-24 16:03:11.958077+05:30	0	\N	\N	\N	5	f	1	0	0	0	25	12	Dyyfhjj	\N
124	2021-05-24 16:03:11.978545+05:30	2021-05-24 16:03:11.978601+05:30	0	\N	\N	\N	3	f	1	1	1	0	9	13	Ajajajaj	\N
125	2021-05-25 13:17:46.343991+05:30	2021-05-25 13:17:46.344048+05:30	0	\N	\N	\N	10	f	1	0	0	0	10	13	Ghuu	\N
126	2021-05-25 13:43:23.848327+05:30	2021-05-25 13:43:23.848339+05:30	0	\N	\N	\N	10	f	1	0	0	0	10	13	Heheheh	\N
130	2021-05-27 11:58:56.681329+05:30	2021-05-27 11:58:56.681339+05:30	0	\N	\N	\N	10	f	10	10	10	0	300	5	waefwaf	\N
131	2021-05-27 11:58:56.741512+05:30	2021-05-27 11:58:56.741524+05:30	0	\N	\N	\N	10	f	10	10	10	0	300	7	waefaef	\N
132	2021-05-27 13:16:21.364065+05:30	2021-05-27 13:16:21.3641+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	52	Fb cssg	\N
133	2021-05-27 13:53:49.154288+05:30	2021-05-27 13:53:49.154305+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	52	Vshshs	\N
134	2021-05-27 13:55:13.372476+05:30	2021-05-27 13:55:13.372492+05:30	0	\N	\N	\N	2	f	1	0	0	0	25	5	Njejwj	\N
135	2021-05-27 14:14:49.238544+05:30	2021-05-27 14:14:49.238563+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	1	Gzga	\N
136	2021-05-27 15:18:15.582946+05:30	2021-05-27 15:18:15.582999+05:30	0	\N	\N	\N	2	f	1	0	0	0	2	1	Guii	\N
137	2021-05-27 15:48:12.514926+05:30	2021-05-27 15:48:12.51494+05:30	0	\N	\N	\N	10	f	10	10	0	0	200	53	awefwafe	\N
138	2021-05-27 16:02:52.447177+05:30	2021-05-27 16:02:52.447188+05:30	0	\N	\N	\N	2	f	1	1	1	0	2	54	F r the t	\N
139	2021-05-27 16:03:50.628243+05:30	2021-05-27 16:03:50.628257+05:30	0	\N	\N	\N	30	f	10	0	10	0	600	1	erasgewsarg	\N
140	2021-05-27 16:03:50.64829+05:30	2021-05-27 16:03:50.648303+05:30	0	\N	\N	\N	10	f	1	10	10	0	210	5	awefeawf	\N
141	2021-05-27 16:03:50.668414+05:30	2021-05-27 16:03:50.668429+05:30	0	\N	\N	\N	10	f	0	0	10	0	100	11	awefawef	\N
142	2021-05-29 17:07:38.140569+05:30	2021-05-29 17:07:38.140585+05:30	0	\N	\N	\N	10	f	1	0	1	0	20	5	jgdsf	\N
143	2021-05-29 17:07:38.229909+05:30	2021-05-29 17:07:38.229938+05:30	0	\N	\N	\N	3	f	1	0	2	0	9	55	s	\N
144	2021-05-29 18:19:31.483784+05:30	2021-05-29 18:19:31.483821+05:30	0	\N	\N	\N	0	f	0	0	0	0	0	13	Wuwuwuu	\N
145	2021-05-31 13:03:56.038514+05:30	2021-05-31 13:03:56.038529+05:30	0	\N	\N	\N	3	f	1	0	0	0	2	53	Qjjqjq	\N
146	2021-05-31 13:04:54.830677+05:30	2021-05-31 13:04:54.83069+05:30	0	\N	\N	\N	0	f	0	0	0	0	0	1	Wbhwhw	\N
147	2021-05-31 13:06:55.583898+05:30	2021-05-31 13:06:55.583907+05:30	0	\N	\N	\N	3	f	1	0	0	0	3	54	Ebebeb	\N
148	2021-05-31 13:10:45.019015+05:30	2021-05-31 13:10:45.019027+05:30	0	\N	\N	\N	2	f	1	1	0	0	3	53	Shshh	\N
149	2021-05-31 13:11:52.815166+05:30	2021-05-31 13:11:52.815176+05:30	0	\N	\N	\N	0	f	0	0	0	0	0	1	Wgwyyy	\N
150	2021-05-31 13:12:47.587552+05:30	2021-05-31 13:12:47.587561+05:30	0	\N	\N	\N	3	f	1	1	0	0	3	51	Jsejjej	\N
151	2021-06-04 16:20:49.899457+05:30	2021-06-04 16:20:49.899468+05:30	0	\N	\N	\N	10	f	10	10	10	0	300	2	awefawef	\N
152	2021-06-04 16:20:49.922829+05:30	2021-06-04 16:20:49.922883+05:30	0	\N	\N	\N	10	f	10	10	0	0	200	54	awefaef	\N
184	2021-06-04 19:47:21.956289+05:30	2021-06-04 19:47:21.956307+05:30	0	\N	\N	\N	20	f	1	0	1	0	40	1	daily	\N
185	2021-06-04 22:05:12.764422+05:30	2021-06-04 22:05:12.764431+05:30	0	\N	\N	\N	10	f	10	10	10	0	300	64	awefaewf	\N
186	2021-06-05 12:17:09.761417+05:30	2021-06-05 12:17:09.76147+05:30	0	\N	\N	\N	10	f	10	10	10	0	300	1	awefaf	\N
187	2021-06-05 12:26:35.662767+05:30	2021-06-05 12:26:35.662777+05:30	0	\N	\N	\N	30	f	30	30	30	0	2700	66	awefawef	\N
188	2021-06-05 13:37:32.613087+05:30	2021-06-05 13:37:32.613098+05:30	0	\N	\N	\N	20	f	20	20	0	0	800	54	serg	\N
189	2021-06-05 13:37:32.633363+05:30	2021-06-05 13:37:32.633376+05:30	0	\N	\N	\N	30	f	120	0	0	0	3600	64	sergsge	\N
190	2021-06-05 17:54:09.62278+05:30	2021-06-05 17:54:09.622792+05:30	0	\N	\N	\N	3	f	0	10	0	0	30	54		\N
191	2021-06-05 20:08:58.745439+05:30	2021-06-05 20:08:58.745449+05:30	0	\N	\N	\N	1	f	0	0	1	0	1	1	df	\N
192	2021-06-05 20:08:58.765691+05:30	2021-06-05 20:08:58.765706+05:30	0	\N	\N	\N	2	f	0	0	2	0	4	3	fd	\N
193	2021-06-05 20:11:10.480405+05:30	2021-06-05 20:11:10.480462+05:30	0	\N	\N	\N	10	f	3	0	0	0	30	54	ewr34re	\N
\.


--
-- Data for Name: prescriptionapp_prescription; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_prescription (id, created, updated, disease, doctor_fees, gst_percentage, gst_required, health_issues, ongoing_treatment, active, clinic_id, doctor_id, "forUser_id", sex, age, appointment_id, next_visit, new_disease_id) FROM stdin;
1	2021-04-27 12:30:12.928644+05:30	2021-04-27 12:30:12.987196+05:30	\N	258	0	f	Hahaj	\N	t	1	4	7	\N	0	\N	\N	\N
2	2021-04-29 11:26:56.00733+05:30	2021-04-29 11:26:56.197461+05:30	\N	67	0	f	Bab	\N	t	1	4	7	\N	0	\N	\N	\N
3	2021-05-04 16:42:26.895178+05:30	2021-05-04 16:42:27.08479+05:30	\N	80	0	f	Jaaj	\N	t	1	4	7	\N	0	\N	\N	\N
4	2021-05-04 17:52:53.85398+05:30	2021-05-04 17:52:53.937199+05:30	\N	26	0	f	Kgofi	\N	t	1	4	7	\N	0	\N	\N	\N
5	2021-05-05 13:43:17.035171+05:30	2021-05-05 13:43:17.195707+05:30	\N	96	0	f	Zjajaj	\N	t	1	4	7	\N	0	\N	\N	\N
6	2021-05-06 11:37:04.779302+05:30	2021-05-06 11:37:04.836821+05:30	\N	10	0	f	['Sugar', 'Bp']	\N	t	1	4	7	\N	0	\N	\N	\N
7	2021-05-06 11:45:31.389011+05:30	2021-05-06 11:45:31.428659+05:30	\N	80	0	f	['Sugar', 'Bb']	\N	t	1	4	7	\N	0	\N	\N	\N
8	2021-05-06 11:50:35.29299+05:30	2021-05-06 11:50:35.336116+05:30	\N	69	0	f	['Sh']	\N	t	1	4	7	Male	58	\N	\N	\N
9	2021-05-06 11:54:42.067866+05:30	2021-05-06 11:54:42.096032+05:30	\N	36	0	f	['Sugar']	\N	t	1	4	7	Male	80	\N	\N	\N
10	2021-05-06 12:07:19.298583+05:30	2021-05-06 12:07:19.327866+05:30	\N	96	0	f	['Sugar', 'Bp']	\N	t	1	4	7	Male	25	\N	\N	\N
11	2021-05-10 12:59:46.507966+05:30	2021-05-10 12:59:46.508024+05:30	\N	65	0	f	['Sugar', 'Bp']	\N	t	43	25	7	\N	0	\N	\N	\N
12	2021-05-10 13:00:22.121868+05:30	2021-05-10 13:00:22.121887+05:30	\N	65	0	f	['Sugar', 'Bp']	\N	t	43	25	7	\N	0	\N	\N	\N
13	2021-05-10 13:04:03.474271+05:30	2021-05-10 13:04:03.474285+05:30	\N	6	0	f	['Sugar', 'Bp']	\N	t	43	25	7	\N	0	\N	\N	\N
14	2021-05-10 13:04:51.17741+05:30	2021-05-10 13:04:51.209908+05:30	\N	36	0	f	['Sugar', 'Bp']	\N	t	43	25	7	Male	25	7	2021-05-10	\N
15	2021-05-10 21:28:08.735561+05:30	2021-05-10 21:28:08.735577+05:30	\N	100	0	f	[]	\N	t	1	4	7	\N	0	\N	\N	\N
16	2021-05-10 21:28:11.462248+05:30	2021-05-10 21:28:11.462261+05:30	\N	100	0	f	[]	\N	t	1	4	7	\N	0	\N	\N	\N
17	2021-05-10 21:28:13.208069+05:30	2021-05-10 21:28:13.208084+05:30	\N	100	0	f	[]	\N	t	1	4	7	\N	0	\N	\N	\N
18	2021-05-10 21:28:17.478146+05:30	2021-05-10 21:28:17.478159+05:30	\N	100	0	f	[]	\N	t	1	4	7	\N	0	\N	\N	\N
19	2021-05-10 21:28:18.651084+05:30	2021-05-10 21:28:18.651097+05:30	\N	100	0	f	[]	\N	t	1	4	7	\N	0	\N	\N	\N
20	2021-05-10 21:28:33.819828+05:30	2021-05-10 21:28:33.819887+05:30	\N	100	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
21	2021-05-10 21:28:44.307641+05:30	2021-05-10 21:28:44.307654+05:30	\N	100	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
22	2021-05-10 21:28:53.831837+05:30	2021-05-10 21:28:53.831848+05:30	\N	100	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
23	2021-05-10 21:29:00.588911+05:30	2021-05-10 21:29:00.588971+05:30	\N	100	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
24	2021-05-10 21:29:13.974339+05:30	2021-05-10 21:29:13.974351+05:30	\N	100	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
25	2021-05-10 21:29:22.140765+05:30	2021-05-10 21:29:22.140777+05:30	\N	100	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
26	2021-05-10 21:35:04.994201+05:30	2021-05-10 21:35:04.994215+05:30	\N	25	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
27	2021-05-10 22:55:05.176951+05:30	2021-05-10 22:55:05.176964+05:30	\N	25	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
60	2021-05-11 11:14:21.440944+05:30	2021-05-11 11:14:21.441002+05:30	\N	25	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
61	2021-05-11 11:17:16.734557+05:30	2021-05-11 11:17:16.734568+05:30	\N	25	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
62	2021-05-11 11:19:15.993188+05:30	2021-05-11 11:19:15.993201+05:30	\N	25	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
63	2021-05-11 11:19:20.563945+05:30	2021-05-11 11:19:20.564002+05:30	\N	25	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
64	2021-05-11 11:23:37.319592+05:30	2021-05-11 11:23:37.319606+05:30	\N	25	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
65	2021-05-11 12:11:26.54738+05:30	2021-05-11 12:11:26.547394+05:30	\N	10	0	f	['Dheheu']	\N	t	1	4	7	\N	0	\N	\N	\N
66	2021-05-11 12:23:16.71645+05:30	2021-05-11 12:23:16.78551+05:30	\N	644646	0	f	['Dheheu']	\N	t	1	4	7	Male	25	\N	2021-05-19	\N
67	2021-05-12 14:07:22.310176+05:30	2021-05-12 14:07:22.336782+05:30	\N	25	0	f	['Dheheu']	\N	t	1	4	7	Male	25	\N	2021-05-13	\N
68	2021-05-12 14:08:13.520339+05:30	2021-05-12 14:08:13.549948+05:30	\N	25	0	f	['Dheheu']	\N	t	1	4	7	Male	25	\N	2021-05-13	\N
69	2021-05-12 21:12:25.974561+05:30	2021-05-12 21:12:26.082704+05:30	\N	25	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	25	\N	2021-05-13	\N
70	2021-05-12 21:15:31.937537+05:30	2021-05-12 21:15:31.965456+05:30	\N	25	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	25	\N	2021-05-12	\N
71	2021-05-16 16:56:33.651104+05:30	2021-05-16 16:56:34.060071+05:30	\N	25	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	25	\N	2021-05-17	\N
72	2021-05-17 13:51:31.75078+05:30	2021-05-17 13:51:31.778963+05:30	\N	25	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	25	\N	2021-05-18	\N
73	2021-05-17 13:52:24.075718+05:30	2021-05-17 13:52:24.10463+05:30	\N	25	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	25	\N	2021-05-18	\N
74	2021-05-17 13:53:08.571971+05:30	2021-05-17 13:53:08.600516+05:30	\N	46	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	46	\N	2021-05-19	\N
75	2021-05-17 13:53:46.610034+05:30	2021-05-17 13:53:46.638731+05:30	\N	25	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	25	\N	2021-05-18	\N
76	2021-05-17 13:54:28.211229+05:30	2021-05-17 13:54:28.236887+05:30	\N	25	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	25	\N	2021-05-18	\N
77	2021-05-17 13:55:29.717819+05:30	2021-05-17 13:55:29.767127+05:30	\N	25	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	25	\N	2021-05-18	\N
78	2021-05-17 13:56:08.428296+05:30	2021-05-17 13:56:08.457621+05:30	\N	10	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-18	\N
79	2021-05-17 13:56:49.013983+05:30	2021-05-17 13:56:49.04311+05:30	\N	256	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	25	\N	2021-05-18	\N
80	2021-05-17 13:59:02.893129+05:30	2021-05-17 13:59:02.920424+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
81	2021-05-17 13:59:07.203143+05:30	2021-05-17 13:59:07.231684+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
82	2021-05-17 13:59:09.058619+05:30	2021-05-17 13:59:09.086756+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
83	2021-05-17 13:59:10.442269+05:30	2021-05-17 13:59:10.470109+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
84	2021-05-17 13:59:11.404082+05:30	2021-05-17 13:59:11.433043+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
85	2021-05-17 13:59:13.077436+05:30	2021-05-17 13:59:13.106984+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
86	2021-05-17 13:59:15.405797+05:30	2021-05-17 13:59:15.43311+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
87	2021-05-17 13:59:17.296815+05:30	2021-05-17 13:59:17.32796+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
88	2021-05-17 13:59:18.542332+05:30	2021-05-17 13:59:18.57165+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
89	2021-05-17 13:59:19.59567+05:30	2021-05-17 13:59:19.664495+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
90	2021-05-17 13:59:20.307228+05:30	2021-05-17 13:59:20.336269+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
91	2021-05-17 13:59:21.381041+05:30	2021-05-17 13:59:21.408697+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
92	2021-05-17 13:59:22.196191+05:30	2021-05-17 13:59:22.22073+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
93	2021-05-17 13:59:22.954607+05:30	2021-05-17 13:59:22.98265+05:30	\N	36	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-19	\N
94	2021-05-17 16:36:14.816265+05:30	2021-05-17 16:36:14.854156+05:30	\N	161	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	25	\N	2021-05-18	\N
95	2021-05-18 18:05:24.039223+05:30	2021-05-18 18:05:24.167114+05:30	\N	25	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	25	\N	2021-05-19	\N
96	2021-05-18 18:11:13.493899+05:30	2021-05-18 18:11:13.522424+05:30	\N	25	0	f	['Dheheu', 'Avagg']	\N	t	1	4	7	Male	36	\N	2021-05-18	\N
97	2021-05-19 18:27:43.768532+05:30	2021-05-19 18:27:43.768547+05:30	\N	34	0	f	['Dheheu', 'Avagg']	\N	t	1	1	7	\N	0	\N	\N	\N
98	2021-05-19 18:27:45.224007+05:30	2021-05-19 18:27:45.224066+05:30	\N	34	0	f	['Dheheu', 'Avagg']	\N	t	1	1	7	\N	0	\N	\N	\N
99	2021-05-19 18:27:45.562008+05:30	2021-05-19 18:27:45.562064+05:30	\N	34	0	f	['Dheheu', 'Avagg']	\N	t	1	1	7	\N	0	\N	\N	\N
100	2021-05-19 18:28:38.74093+05:30	2021-05-19 18:28:38.740944+05:30	\N	34	0	f	['Dheheu', 'Avagg']	\N	t	1	1	7	\N	0	\N	\N	\N
101	2021-05-19 18:30:25.577183+05:30	2021-05-19 18:30:25.577241+05:30	\N	324324	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	1	1	7	\N	0	\N	\N	\N
102	2021-05-19 18:31:57.496217+05:30	2021-05-19 18:31:57.496231+05:30	\N	3434	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	1	1	7	\N	0	\N	\N	\N
103	2021-05-19 18:32:53.421109+05:30	2021-05-19 18:32:53.421121+05:30	\N	324	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	1	1	7	\N	0	\N	\N	\N
104	2021-05-19 18:35:20.823961+05:30	2021-05-19 18:35:20.823974+05:30	\N	1234	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	1	1	7	\N	0	\N	\N	\N
105	2021-05-19 18:36:46.950714+05:30	2021-05-19 18:36:46.985209+05:30	\N	3244	0	f	DheheuAvaggzz	342	t	1	1	7	Male	24	\N	2021-05-19	1
106	2021-05-19 19:31:28.333049+05:30	2021-05-19 19:31:28.333108+05:30	\N	35	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	1	4	7	\N	0	\N	\N	\N
107	2021-05-19 19:32:48.947243+05:30	2021-05-19 19:32:48.947256+05:30	\N	35	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	1	4	7	\N	0	\N	\N	\N
108	2021-05-19 19:35:55.911113+05:30	2021-05-19 19:35:55.940867+05:30	\N	34	0	f	DheheuAvaggzz	grgrg	t	1	4	7	Male	23	\N	2021-05-20	1
109	2021-05-19 19:36:01.866996+05:30	2021-05-19 19:36:01.867009+05:30	\N	342	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	1	1	7	\N	0	\N	\N	\N
110	2021-05-19 19:37:02.563038+05:30	2021-05-19 19:37:02.60076+05:30	\N	45	0	f	DheheuAvaggzz	ggg	t	1	4	7	Male	23	\N	2021-05-20	2
111	2021-05-19 19:39:05.011743+05:30	2021-05-19 19:39:05.12176+05:30	\N	342	0	f	DheheuAvaggzz	weafefaw	t	1	1	7	Male	23	\N	2021-05-19	1
112	2021-05-19 19:40:55.714639+05:30	2021-05-19 19:40:55.76605+05:30	\N	34	0	f	DheheuAvaggzz	ggrgg	t	1	4	7	Male	23	\N	2021-05-20	2
113	2021-05-19 19:40:59.736243+05:30	2021-05-19 19:40:59.776525+05:30	\N	23	0	f	DheheuAvaggzz	awef	t	1	1	34	Male	23	\N	2021-05-19	1
114	2021-05-19 19:42:03.855124+05:30	2021-05-19 19:42:03.892733+05:30	\N	45	0	f	DheheuAvaggzz	newr	t	1	4	7	Male	23	\N	2021-05-19	2
115	2021-05-19 20:30:36.952907+05:30	2021-05-19 20:30:36.98307+05:30	\N	231	0	f	DheheuAvaggzz	awe	t	1	1	7	Male	23	\N	2021-05-19	2
116	2021-05-19 20:37:41.090404+05:30	2021-05-19 20:37:41.185883+05:30	\N	100	0	f	DheheuAvaggzz	Fever	t	1	4	7	Male	23	\N	2021-05-20	4
117	2021-05-19 20:47:40.734101+05:30	2021-05-19 20:47:40.772052+05:30	\N	78	0	f	DheheuAvaggzz	HHH	t	1	4	7	Male	23	\N	2021-05-20	1
118	2021-05-19 20:51:26.681175+05:30	2021-05-19 20:51:26.718996+05:30	\N	25	0	f	DheheuAvaggzz	Chchcj	t	1	4	7	Male	23	\N	2021-05-28	1
119	2021-05-20 12:41:53.418628+05:30	2021-05-20 12:41:53.488793+05:30	\N	25	0	f	DheheuAvaggzz	Nnnnn	t	43	4	7	Male	23	15	2021-05-21	2
120	2021-05-20 12:46:50.950645+05:30	2021-05-20 12:46:50.982671+05:30	\N	36	0	f	DheheuAvaggzz	Najaja	t	1	4	7	Male	23	\N	2021-05-20	2
121	2021-05-20 12:56:24.84662+05:30	2021-05-20 12:56:24.884464+05:30	\N	200	0	f	DheheuAvaggzz	NJKkK	t	1	4	7	Male	23	\N	2021-05-20	1
122	2021-05-20 17:24:18.358885+05:30	2021-05-20 17:24:18.45275+05:30	\N	25	0	f	DheheuAvaggzz	wfwfwfwf	t	1	4	7	Male	23	\N	2021-05-21	1
124	2021-05-22 11:14:24.171518+05:30	2021-05-22 13:56:08.885301+05:30	\N	25	0	f	DheheuAvaggzz	Sjsjkssh	f	42	44	7	Male	23	\N	2021-05-22	2
123	2021-05-21 17:57:02.709703+05:30	2021-05-23 13:07:55.618798+05:30	\N	25	0	f	DheheuAvaggzz	Nsjasjnsn	f	42	44	7	Male	23	16	2021-05-21	1
125	2021-05-23 13:09:51.258728+05:30	2021-05-23 13:11:50.504874+05:30	\N	25	0	f	DheheuAvaggzz	Annaajja	f	42	44	7	Male	23	\N	2021-05-24	1
126	2021-05-24 16:03:11.905942+05:30	2021-05-24 16:03:12.001443+05:30	\N	25	0	f	DheheuAvaggzz	Hiyu	t	42	44	7	Male	23	21	2021-05-26	1
127	2021-05-25 13:17:46.321563+05:30	2021-05-25 13:17:46.368969+05:30	\N	1000	0	f	DheheuAvaggzz	Ajajjaaj	t	42	44	7	Male	23	\N	2021-05-26	1
128	2021-05-25 13:43:23.829793+05:30	2021-05-25 13:43:23.869232+05:30	\N	2000	0	f	DheheuAvaggzz	Ananakan	t	42	53	7	Male	23	\N	2021-05-26	1
129	2021-05-26 15:16:53.150353+05:30	2021-05-26 15:16:53.150365+05:30	\N	250	0	f	[]	\N	t	1	1	33	\N	0	\N	\N	\N
130	2021-05-26 15:16:55.546702+05:30	2021-05-26 15:16:55.546714+05:30	\N	250	0	f	[]	\N	t	1	1	33	\N	0	\N	\N	\N
131	2021-05-26 15:17:03.657775+05:30	2021-05-26 15:17:03.657789+05:30	\N	250	0	f	[]	\N	t	1	1	33	\N	0	\N	\N	\N
132	2021-05-27 11:28:25.014769+05:30	2021-05-27 11:28:25.014784+05:30	\N	324	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	1	1	7	\N	0	\N	\N	\N
133	2021-05-27 11:58:21.461189+05:30	2021-05-27 11:58:21.461204+05:30	\N	324	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	1	1	7	\N	0	\N	\N	\N
134	2021-05-27 11:58:56.673604+05:30	2021-05-27 11:58:56.762644+05:30	\N	324	0	f	DheheuAvaggzz	awer	t	1	1	7	Male	23	\N	2021-05-27	2
135	2021-05-27 13:16:21.336619+05:30	2021-05-27 13:16:21.430233+05:30	\N	25	0	f	DheheuAvaggzz	Vrvebh	t	42	44	7	Male	23	\N	2021-05-27	6
136	2021-05-27 13:53:49.135422+05:30	2021-05-27 13:53:49.182373+05:30	\N	25	0	f	DheheuAvaggzz	Bsbshaah	t	42	44	7	Male	23	\N	2021-05-27	6
137	2021-05-27 13:55:13.363913+05:30	2021-05-27 13:55:13.396065+05:30	\N	25	0	f	DheheuAvaggzz	Nkk	t	42	44	7	Male	23	\N	2021-05-27	6
138	2021-05-27 14:14:49.10448+05:30	2021-05-27 14:14:49.259596+05:30	\N	28	0	f	DheheuAvaggzz	Nanna	t	42	44	7	Male	23	\N	2021-05-27	6
139	2021-05-27 15:15:24.556682+05:30	2021-05-27 15:15:24.574621+05:30	\N	36	0	f	DheheuAvaggzz	BbB	t	42	44	7	Male	23	\N	2021-05-28	6
140	2021-05-27 15:18:15.570039+05:30	2021-05-27 15:18:15.607677+05:30	\N	25	0	f	DheheuAvaggzz	Ghuu	t	42	44	7	Male	23	\N	2021-05-28	6
141	2021-05-27 15:43:06.554453+05:30	2021-05-27 15:43:06.575125+05:30	\N	36	0	f	DheheuAvaggzz	Jkkk	t	42	44	7	Male	23	\N	2021-05-28	6
142	2021-05-27 15:48:12.487192+05:30	2021-05-27 15:48:12.537075+05:30	\N	34	0	f	DheheuAvaggzz	aawefewfaf	t	2	1	7	Male	23	\N	2021-05-27	2
143	2021-05-27 15:55:58.58523+05:30	2021-05-27 15:55:58.58529+05:30	\N	1000	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	42	44	7	\N	0	\N	\N	\N
144	2021-05-27 15:57:53.434101+05:30	2021-05-27 15:57:53.434116+05:30	\N	1000	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	42	44	7	\N	0	\N	\N	\N
145	2021-05-27 15:58:58.301734+05:30	2021-05-27 15:58:58.30175+05:30	\N	1000	0	f	['Dheheu', 'Avagg', 'zz']	\N	t	42	44	7	\N	0	\N	\N	\N
146	2021-05-27 16:02:52.378427+05:30	2021-05-27 16:02:52.476113+05:30	\N	1000	0	f	DheheuAvaggzz	Bshja	t	42	44	7	Male	23	\N	2021-05-29	6
147	2021-05-27 16:03:50.609367+05:30	2021-05-27 16:03:50.6922+05:30	\N	324	0	f	DheheuAvaggzz	awef	t	2	1	7	Male	23	\N	2021-05-27	2
148	2021-05-29 17:07:38.09121+05:30	2021-05-29 17:07:38.29634+05:30	\N	222	0	f		health	t	4	1	33	Male	23	\N	2021-05-29	7
149	2021-05-29 18:19:31.466666+05:30	2021-05-29 18:19:31.507445+05:30	\N	123	0	f	Sugar	Whaywu	t	42	44	58	Male	25	\N	2021-05-29	6
150	2021-05-31 13:03:55.978877+05:30	2021-05-31 13:03:56.173474+05:30	\N	360	0	f	DheheuAvaggzz	Bzbzhzhz	t	42	44	7	Male	23	\N	2021-05-31	6
151	2021-05-31 13:04:54.821884+05:30	2021-05-31 13:04:54.862027+05:30	\N	911661	0	f	Hwh	Hsshah	t	42	44	59	Male	36	\N	2021-05-31	6
152	2021-05-31 13:06:55.574425+05:30	2021-05-31 13:06:55.604985+05:30	\N	36	0	f	H	Sgahsys	t	42	44	60	Male	39	\N	2021-05-27	6
153	2021-05-31 13:10:45.009782+05:30	2021-05-31 13:10:45.040113+05:30	\N	36	0	f	Vwwv	Ssggsgs	t	42	44	61	Male	49	\N	2021-05-31	6
154	2021-05-31 13:11:52.805943+05:30	2021-05-31 13:11:52.836389+05:30	\N	36	0	f	Whhe	Sbshehh	t	42	44	62	Male	61	\N	2021-06-15	6
155	2021-05-31 13:12:47.578091+05:30	2021-05-31 13:12:47.608608+05:30	\N	36	0	f	Ahha	Nzjzzhh	t	42	44	63	Male	36	\N	2021-05-28	6
156	2021-06-04 16:20:49.860037+05:30	2021-06-04 16:20:49.945702+05:30	\N	34	0	f	awefaw	awefawef	t	42	44	64	Male	23	\N	2021-06-04	\N
189	2021-06-04 19:47:21.907004+05:30	2021-06-04 19:47:22.001585+05:30	\N	200	0	f		fever	t	42	44	33	Male	23	\N	2021-06-04	\N
190	2021-06-04 22:05:12.74557+05:30	2021-06-04 22:05:12.785877+05:30	\N	34	0	f	awef	awefawef	t	42	44	98	Male	34	\N	2021-06-04	\N
191	2021-06-05 12:17:09.748374+05:30	2021-06-05 12:23:34.752507+05:30	\N	23	0	f	awef	awefawef	f	42	44	98	Male	23	\N	2021-06-05	\N
192	2021-06-05 12:26:35.644129+05:30	2021-06-05 12:26:41.264246+05:30	\N	231	0	f	waef	awefewf	f	42	44	99	Male	23	\N	2021-06-05	\N
193	2021-06-05 13:37:32.603786+05:30	2021-06-05 13:37:47.191622+05:30	\N	45	0	f	esrg	serg	f	42	44	100	Male	45	\N	2021-06-05	\N
194	2021-06-05 17:54:09.613331+05:30	2021-06-05 17:54:09.643438+05:30	\N	234	0	f	waeff	awefawfe	t	42	44	101	Male	43	\N	2021-06-05	\N
195	2021-06-05 20:08:58.732035+05:30	2021-06-05 20:08:58.787141+05:30	\N	789	0	f	chilkl	oiwyfedg	t	42	44	33	Male	23	\N	2021-06-05	\N
196	2021-06-05 20:11:10.468747+05:30	2021-06-05 20:11:10.496932+05:30	\N	23	0	f	erg	ergyt	t	42	44	33	Male	23	\N	2021-06-05	\N
\.


--
-- Data for Name: prescriptionapp_prescription_medicines; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_prescription_medicines (id, prescription_id, medicinetimes_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	3	4
5	4	5
6	4	6
7	4	7
8	5	8
9	6	9
10	7	10
11	8	11
12	9	12
13	10	13
14	12	14
15	13	15
16	14	16
17	26	17
18	27	18
51	60	51
52	61	52
53	62	53
54	63	54
55	64	55
56	65	56
57	65	57
58	65	58
59	66	59
60	66	60
61	66	61
62	67	62
63	68	63
64	69	64
65	70	65
66	71	66
67	72	67
68	73	68
69	74	69
70	75	70
71	76	71
72	77	72
73	78	73
74	79	74
75	80	75
76	81	76
77	82	77
78	83	78
79	84	79
80	85	80
81	86	81
82	87	82
83	88	83
84	89	84
85	90	85
86	91	86
87	92	87
88	93	88
89	94	89
90	95	90
91	95	91
92	95	92
93	96	93
94	103	94
95	104	95
96	105	96
97	107	97
98	108	98
99	109	99
100	109	100
101	110	101
102	111	102
103	111	103
104	111	104
105	112	105
106	113	106
107	114	107
108	115	108
109	116	109
110	116	110
111	117	111
112	118	112
113	119	113
114	120	114
115	121	115
116	122	116
117	123	117
118	124	118
119	124	119
120	125	120
121	126	121
122	126	122
123	126	123
124	126	124
125	127	125
126	128	126
127	134	130
128	134	131
129	135	132
130	136	133
131	137	134
132	138	135
133	140	136
134	142	137
135	146	138
136	147	139
137	147	140
138	147	141
139	148	142
140	148	143
141	149	144
142	150	145
143	151	146
144	152	147
145	153	148
146	154	149
147	155	150
148	156	151
149	156	152
181	189	184
182	190	185
183	191	186
184	192	187
185	193	188
186	193	189
187	194	190
188	195	191
189	195	192
190	196	193
\.


--
-- Data for Name: prescriptionapp_recopinist; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_recopinist (id, created, updated, active, clinic_id, user_id, type, "fromTimeStr", "toTimeStr") FROM stdin;
9	2021-05-21 16:30:59.324024+05:30	2021-05-21 16:30:59.324038+05:30	f	42	48	Clinic	\N	\N
8	2021-05-21 11:54:44.817969+05:30	2021-05-24 13:54:45.741991+05:30	f	1	41	Clinic	3:46 PM	5:46 PM
10	2021-05-22 14:23:52.886624+05:30	2021-05-26 18:32:13.016383+05:30	f	42	49	Clinic	7:31 PM	8:31 PM
\.


--
-- Data for Name: prescriptionapp_solditems; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_solditems (id, contact_details, contact_no, date, created, updated, total, discount, inventory_id) FROM stdin;
1	\N	wefawea	2021-06-17	2021-06-03 13:36:33.291863+05:30	2021-06-03 13:36:33.291876+05:30	0	0	\N
2	\N	wefawea	2021-06-17	2021-06-03 13:37:42.213174+05:30	2021-06-03 13:37:42.213187+05:30	0	0	\N
3	\N	wefawea	2021-06-17	2021-06-03 13:38:32.566886+05:30	2021-06-03 13:38:32.566898+05:30	0	0	\N
4	\N	wefawea	2021-06-17	2021-06-03 13:39:22.858389+05:30	2021-06-03 13:39:22.8584+05:30	0	0	\N
5	\N	wefawea	2021-06-17	2021-06-03 13:40:30.680505+05:30	2021-06-03 13:40:30.680518+05:30	0	0	\N
6	\N	wefawea	2021-06-17	2021-06-03 13:41:22.056854+05:30	2021-06-03 13:41:22.130092+05:30	2000	0	\N
7	\N	sdfsdf	2021-06-03	2021-06-03 13:43:00.503404+05:30	2021-06-03 13:43:00.555293+05:30	1000	0	\N
8	\N	asdsd	2021-06-03	2021-06-03 13:49:33.809157+05:30	2021-06-03 13:49:33.844063+05:30	200	0	\N
9	\N	asdasd	2021-06-16	2021-06-03 13:51:13.004278+05:30	2021-06-03 13:51:13.041207+05:30	2000	0	\N
10	\N	sadsadsd	2021-06-03	2021-06-03 13:53:55.896883+05:30	2021-06-03 13:53:55.943493+05:30	2200	0	\N
11	\N	sadsadsd	2021-06-03	2021-06-03 13:55:08.414744+05:30	2021-06-03 13:55:08.414755+05:30	0	0	\N
12	\N	sadsadsd	2021-06-03	2021-06-03 13:56:10.91092+05:30	2021-06-03 13:56:10.910932+05:30	0	0	\N
13	\N	sadsadsd	2021-06-03	2021-06-03 13:59:57.144297+05:30	2021-06-03 13:59:57.209179+05:30	2220	0	\N
14	\N	awefaef	2021-06-03	2021-06-03 14:00:40.27559+05:30	2021-06-03 14:00:40.275602+05:30	0	0	\N
15	\N	assad	2021-06-03	2021-06-03 14:03:50.396635+05:30	2021-06-03 14:03:50.396646+05:30	0	0	\N
16	\N	awef	2021-06-03	2021-06-03 14:07:45.903258+05:30	2021-06-03 14:07:45.90327+05:30	0	0	\N
17	\N	asd	2021-06-03	2021-06-03 14:10:02.725257+05:30	2021-06-03 14:10:02.807322+05:30	2000	0	\N
18	\N	awefafe	2021-06-03	2021-06-03 14:11:03.950025+05:30	2021-06-03 14:11:04.065871+05:30	2160	0	\N
19	\N	awefawef	2021-06-03	2021-06-03 14:11:45.615341+05:30	2021-06-03 14:11:45.615353+05:30	0	0	\N
20	\N	awef	2021-06-03	2021-06-03 14:15:05.16396+05:30	2021-06-03 14:15:05.23006+05:30	200	0	\N
21	\N	ewafawf	2021-06-03	2021-06-03 14:16:02.740307+05:30	2021-06-03 14:16:02.8197+05:30	380	0	\N
22	\N	aewfawef	2021-06-03	2021-06-03 14:16:31.737668+05:30	2021-06-03 14:16:31.804352+05:30	2220	0	\N
23	\N	waef	2021-06-03	2021-06-03 15:43:37.357533+05:30	2021-06-03 15:43:37.427014+05:30	2400	0	\N
24	\N	124124	2021-06-03	2021-06-03 15:54:53.759939+05:30	2021-06-03 15:54:53.759951+05:30	0	0	\N
25	\N	124124	2021-06-03	2021-06-03 15:55:59.01511+05:30	2021-06-03 15:55:59.015122+05:30	0	0	\N
26	\N	124124	2021-06-03	2021-06-03 15:56:34.831426+05:30	2021-06-03 15:56:34.885638+05:30	260	0	\N
27	\N	awef	2021-06-03	2021-06-03 15:57:14.32681+05:30	2021-06-03 15:57:14.326867+05:30	0	0	\N
28	\N	asfsf	2021-06-03	2021-06-03 15:58:22.405885+05:30	2021-06-03 15:58:22.504011+05:30	220	0	\N
29	\N	324324	2021-06-03	2021-06-03 18:24:35.133719+05:30	2021-06-03 18:24:35.300488+05:30	430	0	3
31	wegga	erfge	2021-06-05	2021-06-05 15:13:10.892761+05:30	2021-06-05 15:13:10.952303+05:30	600	0	16
32	ewff	awefawef	2021-06-05	2021-06-05 18:10:33.725463+05:30	2021-06-05 18:10:33.771044+05:30	300	0	16
33	waefaewf	wefweaqf	2021-06-05	2021-06-05 18:11:57.319047+05:30	2021-06-05 18:11:57.319074+05:30	0	0	16
34	awefwfeaewf	ewfawf	2021-06-05	2021-06-05 18:52:54.90441+05:30	2021-06-05 18:52:54.955583+05:30	300	0	16
35	awefwfeaewf	ewfawf	2021-06-05	2021-06-05 18:52:56.694477+05:30	2021-06-05 18:52:56.729983+05:30	300	0	16
36	awefwfeaewf	ewfawf	2021-06-05	2021-06-05 18:53:10.231421+05:30	2021-06-05 18:53:10.275179+05:30	300	0	16
\.


--
-- Data for Name: prescriptionapp_solditems_items; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_solditems_items (id, solditems_id, soldsubs_id) FROM stdin;
1	6	2
2	7	3
3	8	4
4	9	5
5	10	6
6	13	7
7	17	8
8	18	9
9	20	10
10	21	11
11	22	12
12	23	13
13	26	14
15	28	16
16	28	17
21	31	22
22	32	23
23	34	24
24	35	25
25	36	26
\.


--
-- Data for Name: prescriptionapp_soldsubs; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_soldsubs (id, created, updated, quantity, submain_id, sold_total) FROM stdin;
1	2021-06-03 13:40:30.698541+05:30	2021-06-03 13:40:30.698554+05:30	100	30	2000
2	2021-06-03 13:41:22.082131+05:30	2021-06-03 13:41:22.082144+05:30	100	30	2000
3	2021-06-03 13:43:00.53461+05:30	2021-06-03 13:43:00.534661+05:30	50	30	1000
4	2021-06-03 13:49:33.825918+05:30	2021-06-03 13:49:33.825929+05:30	10	30	200
5	2021-06-03 13:51:13.023324+05:30	2021-06-03 13:51:13.023336+05:30	100	30	2000
6	2021-06-03 13:53:55.925578+05:30	2021-06-03 13:53:55.925591+05:30	110	30	2200
7	2021-06-03 13:59:57.189341+05:30	2021-06-03 13:59:57.189352+05:30	111	30	2220
8	2021-06-03 14:10:02.787461+05:30	2021-06-03 14:10:02.787472+05:30	100	30	2000
9	2021-06-03 14:11:04.039773+05:30	2021-06-03 14:11:04.039785+05:30	108	30	2160
10	2021-06-03 14:15:05.210824+05:30	2021-06-03 14:15:05.210859+05:30	10	30	200
11	2021-06-03 14:16:02.800203+05:30	2021-06-03 14:16:02.800251+05:30	19	30	380
12	2021-06-03 14:16:31.784402+05:30	2021-06-03 14:16:31.784415+05:30	111	30	2220
13	2021-06-03 15:43:37.406992+05:30	2021-06-03 15:43:37.407006+05:30	120	30	2400
14	2021-06-03 15:56:34.865735+05:30	2021-06-03 15:56:34.865745+05:30	13	31	260
16	2021-06-03 15:58:22.454085+05:30	2021-06-03 15:58:22.454094+05:30	5	30	100
17	2021-06-03 15:58:22.484058+05:30	2021-06-03 15:58:22.484068+05:30	6	31	120
22	2021-06-05 15:13:10.931889+05:30	2021-06-05 15:13:10.9319+05:30	30	42	600
23	2021-06-05 18:10:33.750966+05:30	2021-06-05 18:10:33.750974+05:30	30	44	300
24	2021-06-05 18:52:54.935493+05:30	2021-06-05 18:52:54.935503+05:30	30	44	300
25	2021-06-05 18:52:56.71005+05:30	2021-06-05 18:52:56.710058+05:30	30	44	300
26	2021-06-05 18:53:10.255276+05:30	2021-06-05 18:53:10.255286+05:30	30	44	300
\.


--
-- Data for Name: prescriptionapp_subinventories; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_subinventories (id, created, updated, maxretailprice, quantity, number_of_boxes, number_of_medicines, number_of_strips, expiry_date, type, category_id, is_added) FROM stdin;
79	2021-06-02 20:22:01.336982+05:30	2021-06-02 20:22:01.336994+05:30	0	1111	10	1	1	2021-06-12	\N	26	t
80	2021-06-02 21:21:43.179904+05:30	2021-06-02 21:23:05.214491+05:30	0	220	11	0	0	\N	\N	25	t
81	2021-06-02 21:21:43.199631+05:30	2021-06-02 21:23:05.231925+05:30	0	110	11	0	0	\N	\N	27	t
82	2021-06-02 21:21:43.220228+05:30	2021-06-02 21:23:05.242053+05:30	0	112	11	2	0	\N	\N	27	t
83	2021-06-02 21:33:06.74151+05:30	2021-06-02 21:33:06.741523+05:30	0	526	4	10	3	\N	\N	28	t
98	2021-06-03 21:11:11.329364+05:30	2021-06-03 21:11:11.329383+05:30	0	21530	2153	0	0	2021-06-15	\N	22	t
99	2021-06-04 17:18:38.273695+05:30	2021-06-04 17:18:38.273706+05:30	0	25	1	1	2	2021-06-04	\N	37	t
100	2021-06-04 18:51:42.43875+05:30	2021-06-04 18:51:42.438768+05:30	0	78	4	0	2	2021-06-04	\N	37	t
102	2021-06-04 19:13:51.255611+05:30	2021-06-04 19:13:51.25562+05:30	0	9	9	0	0	2021-06-04	\N	39	t
103	2021-06-04 19:17:49.26901+05:30	2021-06-04 19:18:42.366362+05:30	0	300	2	0	1	\N	\N	35	t
104	2021-06-04 19:17:49.289651+05:30	2021-06-04 19:18:42.385827+05:30	0	100	6	10	0	\N	\N	36	t
106	2021-06-04 20:06:01.092247+05:30	2021-06-05 15:13:10.925206+05:30	0	70	7	0	0	\N	\N	42	t
107	2021-06-05 17:02:54.275771+05:30	2021-06-05 17:02:54.275785+05:30	0	51	3	6	0	\N	\N	36	f
109	2021-06-05 17:26:13.280368+05:30	2021-06-05 17:29:34.526136+05:30	0	459	3	3	2	\N	\N	35	t
108	2021-06-05 17:08:48.326479+05:30	2021-06-05 17:29:49.135579+05:30	0	51	3	6	0	\N	\N	36	t
111	2021-06-05 18:16:58.458951+05:30	2021-06-05 18:16:58.458971+05:30	0	96	6	6	0	\N	\N	36	f
76	2021-06-02 11:59:50.46219+05:30	2021-06-02 12:07:53.432129+05:30	0	100	10	0	0	\N	\N	23	t
77	2021-06-02 11:59:50.482305+05:30	2021-06-02 12:07:53.442209+05:30	0	1110	111	0	0	\N	\N	24	t
110	2021-06-05 18:06:21.675354+05:30	2021-06-05 18:53:10.248747+05:30	0	990	11	0	9	2021-06-11	\N	44	t
85	2021-06-03 13:32:23.988486+05:30	2021-06-03 15:56:34.849101+05:30	0	97	10	8	0	2021-06-09	\N	31	t
86	2021-06-03 15:40:56.035353+05:30	2021-06-03 15:58:22.444641+05:30	0	5	0	5	0	2021-06-14	\N	30	t
87	2021-06-03 15:48:56.73629+05:30	2021-06-03 15:58:22.476857+05:30	0	98	10	4	0	2021-06-23	\N	31	t
\.


--
-- Data for Name: prescriptionapp_submain; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_submain (id, created, updated, title, price, type, category_id, medicine_id, min_quantity, total_quantity, medicines_per_strips, strips_per_boxes) FROM stdin;
20	2021-06-02 08:48:40.599814+05:30	2021-06-02 08:48:40.629142+05:30	Dolomites	110	Tablet	\N	54	110	0	10	10
23	2021-06-02 11:28:45.971353+05:30	2021-06-02 11:28:45.994897+05:30	Dolomites	110	Tablet	14	54	100	0	10	1
24	2021-06-02 11:29:05.899041+05:30	2021-06-02 11:29:05.916321+05:30	utrera	20	Others	14	2	1110	0	10	0
25	2021-06-02 20:20:57.146168+05:30	2021-06-02 20:20:57.166867+05:30	utrera	20	Others	15	2	220	0	20	0
42	2021-06-04 20:03:30.206333+05:30	2021-06-04 20:03:30.220763+05:30	paracetomola	20	Liquid	23	63	20	0	10	0
27	2021-06-02 20:21:26.698309+05:30	2021-06-02 20:21:26.703311+05:30	Ajja	10	Cream	15	55	110	0	10	0
26	2021-06-02 20:21:14.818131+05:30	2021-06-02 20:22:01.353206+05:30	Dolomites	20	Tablet	15	54	1110	10	10	11
28	2021-06-02 21:31:20.791393+05:30	2021-06-02 21:33:06.758729+05:30	Dolomites	10	Tablet	17	54	1110	120	12	10
29	2021-06-02 21:33:50.894791+05:30	2021-06-02 21:33:51.012756+05:30	paracetamol	110	Inhalers	17	1	1110	0	10	0
43	2021-06-04 22:13:27.547476+05:30	2021-06-04 22:13:27.556366+05:30	awefawefffffffff	30	Capsules	23	65	110	0	10	10
44	2021-06-05 17:48:49.159961+05:30	2021-06-05 17:49:08.702794+05:30	Dolomites	10	Tablet	23	54	1220	0	10	10
30	2021-06-03 13:31:50.639573+05:30	2021-06-03 15:40:56.058816+05:30	Dolomites	20	Tablet	18	54	1110	0	10	10
31	2021-06-03 13:32:12.923772+05:30	2021-06-03 15:48:56.751435+05:30	utrera	20	Others	18	2	10	0	10	0
22	2021-06-02 11:26:51.629006+05:30	2021-06-03 21:11:11.347727+05:30	paracetamol	110	Inhalers	14	1	10	0	10	0
35	2021-06-04 16:07:54.217674+05:30	2021-06-04 16:07:54.232712+05:30	Dolomites	20	Tablet	21	54	300	0	12	12
36	2021-06-04 16:09:21.379819+05:30	2021-06-04 16:09:21.387893+05:30	Testliquid	50	Drops	21	59	100	0	15	0
37	2021-06-04 17:14:36.463179+05:30	2021-06-04 17:18:38.306571+05:30	Dolomites	2	Tablet	22	54	2	2	3	6
39	2021-06-04 17:20:14.828306+05:30	2021-06-04 17:20:14.836769+05:30	liqour	56	Liquid	22	61	20	0	1	0
\.


--
-- Data for Name: prescriptionapp_workinghours; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.prescriptionapp_workinghours (id, created, updated, "fromTime", "toTime", active, "fromTimeStr", "toTimeStr", clinic_id, doctor_id, "baseFees", timings) FROM stdin;
18	2021-05-21 14:01:52.240508+05:30	2021-05-21 14:01:52.275275+05:30	0	0	f	\N	\N	42	44	0	t
22	2021-05-25 13:19:48.398729+05:30	2021-05-25 13:19:48.414944+05:30	0	0	f	\N	\N	42	52	232	t
23	2021-05-25 13:20:47.01883+05:30	2021-05-25 13:20:47.036461+05:30	0	0	f	\N	\N	42	53	344	t
24	2021-05-25 13:22:04.468345+05:30	2021-05-25 13:22:04.486629+05:30	0	0	f	\N	\N	42	54	324	t
25	2021-05-27 17:12:13.765743+05:30	2021-05-27 17:12:29.09331+05:30	0	0	f	\N	\N	2	55	122	t
26	2021-05-30 14:11:54.124049+05:30	2021-05-30 14:12:08.907207+05:30	0	0	f	\N	\N	5	25	324	t
27	2021-05-30 14:15:39.099309+05:30	2021-05-30 14:15:39.117156+05:30	0	0	f	\N	\N	46	55	343	t
21	2021-05-21 14:24:26.478092+05:30	2021-05-30 14:31:07.125582+05:30	0	0	f	\N	\N	1	45	234	t
\.


--
-- Data for Name: profiles_accountskey; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.profiles_accountskey (id, activation_key, key_expires, "keyType", user_id) FROM stdin;
\.


--
-- Data for Name: profiles_payment; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.profiles_payment (id, status, subscription, order_id, payment_mode, is_received, amount, subscription_date, valid_till, is_cash, user_id, payment_id, clinic_id) FROM stdin;
33	Pending	Monthly	order_HAey7Hu4VHlV6T	upi	f	59900	2021-05-14	2021-06-11	f	4	\N	1
34	Pending	Monthly	order_HAeyyfkuh7WYo6	upi	f	59900	2021-05-14	2021-06-11	f	4	\N	1
35	Pending	Quarterly	order_HAezACyPTvZzmW	upi	f	169900	2021-05-14	2021-08-12	f	4	\N	1
36	Success	Monthly	order_HAf5lxZNvB7WZh	upi	f	59900	2021-05-14	2021-06-11	f	4	pay_HAf68Pzs84f9kQ	1
37	Pending	Monthly	order_HAf6YtVupnz99I	upi	f	59900	2021-06-11	2021-07-09	f	4	\N	1
38	Pending	Monthly	order_HAf6j6Pdl3g0yI	upi	f	59900	2021-06-11	2021-07-09	f	4	\N	1
39	Pending	Monthly	order_HAf6qq8oxxzWa4	upi	f	59900	2021-06-11	2021-07-09	f	4	\N	1
40	Pending	Monthly	order_HAf7iUeG3vVOpU	upi	f	59900	2021-06-11	2021-07-09	f	4	\N	1
41	Pending	Monthly	order_HAf85PrGQEUmBl	upi	f	59900	2021-06-11	2021-07-09	f	4	\N	1
42	Pending	Monthly	order_HAf94VhGFh6RM7	upi	f	59900	2021-06-11	2021-07-09	f	4	\N	1
43	Pending	Monthly	order_HAf9G7CKXPvIax	upi	f	59900	2021-06-11	2021-07-09	f	4	\N	1
44	Pending	Monthly	order_HB4x9J3IkifBcP	upi	f	59900	2021-06-11	2021-07-09	f	4	\N	1
45	Pending	Halfly	order_HB4xj9bNnqrnG6	upi	f	329900	2021-06-11	2021-12-08	f	4	\N	1
46	Pending	Halfly	order_HB4yHWj69fDucl	upi	f	329900	2021-06-11	2021-12-08	f	4	\N	1
47	Pending	Quarterly	order_HB4yOXCWcCqOxh	upi	f	169900	2021-06-11	2021-09-09	f	4	\N	1
48	Success	Quarterly	order_HCyFcrR544TDz6	upi	f	169900	2021-05-20	2021-08-18	f	4	pay_HCyGGUGCakIHuo	43
49	Pending	Monthly	order_HD0MeEAngWU9SV	upi	f	59900	2021-05-20	2021-06-17	f	4	\N	42
50	Pending	Monthly	order_HD0OQCjDX7aUtx	upi	f	59900	2021-05-20	2021-06-17	f	4	\N	42
51	Pending	Monthly	order_HDNfrI6eIiu95B	upi	f	59900	2021-05-21	2021-06-18	f	44	\N	42
52	Success	Monthly	order_HDNgudrRviYFnH	upi	f	59900	2021-05-21	2021-06-18	f	44	pay_HDNhQ2Zx45g51W	42
\.


--
-- Data for Name: profiles_profile; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.profiles_profile (id, "displayPicture", mobile, pan, "notificationId", address, pincode, state, city, "firstEmergencyContactNo", "secondEmergencyContactNo", occupation, language, specialization, qualification, uniqueid, "referralCode", "walletCreated", "clinicsHandling", "isDpVerified", user_id, health_issues, dob, blood_group) FROM stdin;
2		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	\N	\N	\N	\N	f	0	f	2	\N	\N	\N
16	HR/images/DP/1622364128_8838508_7010117100_main.jpeg	7010117100	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	Doctor	Customer	heart surgeon	mbbs	\N	\N	f	2	f	25	\N	2021-05-30	a+
5	HR/images/DP/1619504993_7892826_7878987878_8448e8a9-3a10-480d-b3f9-c0aaa6fbf597.jpg	7878987878	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MediacalRep	Customer	\N	B.pharm	\N	\N	f	2	f	6	\N	\N	\N
7	HR/images/DP/1619519019_9669223_7010117125_85e7084b-ace8-49ad-9e50-18e138d50d70.jpg	7010117125	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767		Customer	\N	B.pharm	\N	\N	f	2	f	8	\N	\N	\N
8	HR/images/DP/1619521787_2842724_7010117134_6909f67f-527b-47a8-847f-d0b11d7d6942.jpg	7010117134	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MedicalRecoptionist	Customer	\N	B.pharm	\N	\N	f	2	f	9	\N	\N	\N
9	HR/images/DP/1619522340_8277972_7010117123_e1e214c8-2c7c-4b81-b84b-8e8c2f9fd407.jpg	7010117123	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MedicalRecoptionist	Customer	\N	B.pharm	\N	\N	f	2	f	10	\N	\N	\N
10	HR/images/DP/1619522559_8348825_7010117180_8eef2f52-d51e-4db1-811b-9d14ae49f03a.jpg	7010117180	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MedicalRecoptionist	Customer	\N	B.pharm	\N	\N	f	2	f	13	\N	\N	\N
11	HR/images/DP/1619522640_506908_7010117169_3e39ac3b-3657-4706-9844-e501cd2773f6.jpg	7010117169	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MedicalRecoptionist	Customer	\N	B.pharm	\N	\N	f	2	f	14	\N	\N	\N
12	HR/images/DP/1619522790_0923598_7010117196_7a7b8f34-f834-493c-a57c-5e32fa35154b.jpg	7010117196	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MedicalRecoptionist	Customer	\N	B.pharm	\N	\N	f	2	f	15	\N	\N	\N
13	HR/images/DP/1619532408_7448425_5858585858_b7d9d1bd-f4fb-4bbe-8abb-48ca5c120e32.jpg	5858585858	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MedicalRecoptionist	Customer	\N	B.pharm	\N	\N	f	2	f	16	\N	\N	\N
14	HR/images/DP/1619532763_1144576_9393939393_ba03aaea-e78f-4e81-9961-e51864607db0.jpg	9393939393	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MedicalRecoptionist	Customer	\N	B.pharm	\N	\N	f	2	f	17	\N	\N	\N
15		7010117171	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	ClinicRecoptionist	Customer	\N	B.pharm	\N	\N	f	2	f	20	\N	\N	\N
33	HR/images/DP/1621594859_312291_1010101010_465d5971-d09a-4a47-af5c-3e51f888e583.jpg	1010101010	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	ClinicRecoptionist	Customer	\N	B.pharm	\N	\N	f	2	f	48	\N	\N	\N
22		6060606062	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	34	{Dheheu,Avagg,zz}	\N	\N
23		7010117137	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	\N	\N	\N	\N	f	0	f	35	\N	1998-10-11	B +ve
24		8973591775	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	\N	\N	\N	\N	f	0	f	36	\N	1988-05-19	B +ve
17	HR/images/DP/1620648451_1878603_7010117186_7f1e5dd4-929c-40ee-a07f-bf5fa38b1916.jpg	7010117186	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MedicalRecoptionist	Customer	\N	B.pharm	\N	\N	f	2	f	26	\N	\N	\N
25		9585858585	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	\N	\N	\N	\N	f	0	f	37	\N	2021-05-20	B +ve
18	HR/images/DP/1620884262_0943024_7010117179_29bccfbc-a6c7-4d47-a634-8ebb6cf08c91.jpg	7010117179	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MediacalRep	Customer	\N	B.pharm	\N	\N	f	2	f	27	\N	\N	\N
19	HR/images/DP/1620895510_8517811_5565656565_4239427d-9e97-4fe3-9ba9-c4b3a76264d0.jpg	5565656565	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	Doctor	Customer	heart surgeon	mbbs	\N	\N	f	2	f	31	\N	\N	\N
20	HR/images/DP/1620898421_267813_7010117199_9643bea5-5838-4261-845d-49a1b075e708.jpg	7010117199	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MediacalRep	Customer	\N	B.pharm	\N	\N	f	2	f	32	\N	\N	\N
34	HR/images/DP/1622034133_0056849_8080808080_main.jpeg	8080808080	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	ClinicRecoptionist	Customer	\N	B.pharm	\N	\N	f	2	f	49	\N	\N	\N
26		9585858586	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	38	\N	2011-05-19	B +ve
27		324234444	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	heart surgeon	\N	\N	\N	f	0	f	39	\N	2021-05-20	a+
30		3443434343	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	cardiologist	\N	\N	\N	f	0	f	42	\N	2021-05-21	a postive
28	HR/images/DP/1621526867_3543875_5345354344_main.jpeg	5345354344	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	342	\N	\N	\N	f	0	f	40	\N	2021-05-20	324
4	HR/images/DP/1621527001_6420493_7070707070_main.jpeg	7070707070	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	Doctor	Customer	heart surgeon	mbbs	\N	\N	f	2	f	4	\N	2021-05-20	aafew
37	HR/images/DP/1621928988_3843691_2323434344_main.jpeg	2323434344	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	123213	\N	\N	\N	f	0	f	52	\N	2021-05-25	a
31	HR/images/DP/1621584520_7453403_4040404040_77363c5d-1b1f-4f4e-9e07-3b1442d53d84.jpg	4040404040	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	Doctor	Customer	heart surgeon	mbbs	\N	\N	f	2	f	44	\N	\N	\N
3	HR/images/DP/1619504819_6985853_7010117133_f7072066-5ea9-4c0b-ba09-d22434d15fc4.jpg	7010117133	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	Doctor	Customer	heart surgeon	mbbs	\N	\N	f	2	f	3	\N	2021-05-21	a
29		343434311	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	ewr	\N	\N	\N	f	0	f	41	\N	2021-05-21	a3
6		6060606060	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	7	{Dheheu,Avagg,zz}	1997-07-08	\N
35		awefawefff	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	50	\N	\N	\N
36		23434234	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	51	\N	\N	\N
40	HR/images/DP/1622364339_0880568_bomm_bomm_image1.png	bomm bomm	\N	\N	\N	\N	\N	\N	\N	\N	Doctor	Customer	awef	\N	\N	\N	f	0	f	55	\N	2021-05-30	a+
38	HR/images/DP/1621929046_996265_3434343443_monsitj.jpg	3434343443	\N	\N	\N	\N	\N	\N	\N	\N	Doctor	Customer	awef	\N	\N	\N	f	0	f	53	\N	2021-05-25	a+
39	HR/images/DP/1621929124_4561481_234234232_Screenshot_2021-04-10_Profile_List__Django_RES_Riv7AYz.png	234234232	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	awefweaf	\N	\N	\N	f	0	f	54	\N	2021-05-25	a+
1		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	cardologist	\N	\N	\N	f	0	f	1	\N	\N	\N
32	HR/images/DP/1622365267_1121964_1234554327_main.jpeg	1234554321	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	pardolofist	\N	\N	\N	f	0	f	45	\N	2021-05-21	123
41		waefaweffff	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	56	\N	\N	\N
42		8989898989	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	57	\N	\N	\N
43		9898989898	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	58	{Sugar}	\N	\N
44		9464946464	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	59	{Hwh}	\N	\N
45		9449766449	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	60	{H}	\N	\N
46		4646464645	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	61	{Vwwv}	\N	\N
47		3746466466	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	62	{Whhe}	\N	\N
48		7994646464	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	63	{Ahha}	\N	\N
49		23323232	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	64	{awefaw}	\N	\N
82		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Customer	\N	\N	\N	\N	f	0	f	97	\N	\N	\N
83		32423444	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	98	{awef}	\N	\N
84		sdzvzv	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	99	{waef}	\N	\N
85		sergsrg	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	100	{esrg}	\N	\N
86		awefaweffffff	\N	\N	\N	\N	\N	\N	\N	\N	Customer	Customer	\N	\N	\N	\N	f	0	f	101	{waeff}	\N	\N
21	HR/images/DP/1620898457_802581_9902299176_56ebd7b8-9822-4e64-8f77-0bf8587c72e4.jpg	9902299176	w54647866	\N	4/120 vellacheri	634085	Karnataka	Bengaluru	9869669867	9778776767	MediacalRep	Customer	\N	B.pharm	\N	\N	f	2	f	33	{erg}	\N	\N
\.


--
-- Data for Name: profiles_wallet; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.profiles_wallet (id, total_coins, created, updated, user_id) FROM stdin;
\.


--
-- Data for Name: robots_rule; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.robots_rule (id, robot, crawl_delay) FROM stdin;
\.


--
-- Data for Name: robots_rule_allowed; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.robots_rule_allowed (id, rule_id, url_id) FROM stdin;
\.


--
-- Data for Name: robots_rule_disallowed; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.robots_rule_disallowed (id, rule_id, url_id) FROM stdin;
\.


--
-- Data for Name: robots_rule_sites; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.robots_rule_sites (id, rule_id, site_id) FROM stdin;
\.


--
-- Data for Name: robots_url; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.robots_url (id, pattern) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: ERP_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_address_id_seq"', 1, false);


--
-- Name: ERP_apiusage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_apiusage_id_seq"', 1, false);


--
-- Name: ERP_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_application_id_seq"', 1, false);


--
-- Name: ERP_application_owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_application_owners_id_seq"', 1, false);


--
-- Name: ERP_appsettingsfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_appsettingsfield_id_seq"', 1, false);


--
-- Name: ERP_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_device_id_seq"', 1, false);


--
-- Name: ERP_grouppermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_grouppermission_id_seq"', 1, false);


--
-- Name: ERP_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_media_id_seq"', 1, false);


--
-- Name: ERP_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_module_id_seq"', 1, false);


--
-- Name: ERP_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_permission_id_seq"', 1, false);


--
-- Name: ERP_profile_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_profile_devices_id_seq"', 1, false);


--
-- Name: ERP_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_profile_id_seq"', 1, false);


--
-- Name: ERP_publicapikeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_publicapikeys_id_seq"', 1, false);


--
-- Name: ERP_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."ERP_service_id_seq"', 1, false);


--
-- Name: PIM_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."PIM_settings_id_seq"', 1, false);


--
-- Name: PIM_theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public."PIM_theme_id_seq"', 1, false);


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 232, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 101, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.corsheaders_corsmodel_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 58, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 100, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: online_users_onlineuseractivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.online_users_onlineuseractivity_id_seq', 1, false);


--
-- Name: prescriptionapp_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_appointments_id_seq', 41, true);


--
-- Name: prescriptionapp_chatmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_chatmessage_id_seq', 262, true);


--
-- Name: prescriptionapp_chatmessageread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_chatmessageread_id_seq', 25, true);


--
-- Name: prescriptionapp_clinic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_clinic_id_seq', 61, true);


--
-- Name: prescriptionapp_clinicgroupthread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_clinicgroupthread_id_seq', 5, true);


--
-- Name: prescriptionapp_disease_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_disease_id_seq', 7, true);


--
-- Name: prescriptionapp_doctorthread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_doctorthread_id_seq', 5, true);


--
-- Name: prescriptionapp_doctortimings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_doctortimings_id_seq', 168, true);


--
-- Name: prescriptionapp_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_inventory_id_seq', 26, true);


--
-- Name: prescriptionapp_inventorycategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_inventorycategory_id_seq', 24, true);


--
-- Name: prescriptionapp_inventoryorders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_inventoryorders_id_seq', 26, true);


--
-- Name: prescriptionapp_inventoryorders_ordered_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_inventoryorders_ordered_items_id_seq', 22, true);


--
-- Name: prescriptionapp_issuedprescription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_issuedprescription_id_seq', 14, true);


--
-- Name: prescriptionapp_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_items_id_seq', 1, false);


--
-- Name: prescriptionapp_medicine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_medicine_id_seq', 66, true);


--
-- Name: prescriptionapp_medicinetimes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_medicinetimes_id_seq', 193, true);


--
-- Name: prescriptionapp_prescription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_prescription_id_seq', 196, true);


--
-- Name: prescriptionapp_prescription_medicines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_prescription_medicines_id_seq', 190, true);


--
-- Name: prescriptionapp_recopinist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_recopinist_id_seq', 10, true);


--
-- Name: prescriptionapp_solditems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_solditems_id_seq', 36, true);


--
-- Name: prescriptionapp_solditems_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_solditems_items_id_seq', 25, true);


--
-- Name: prescriptionapp_soldsubs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_soldsubs_id_seq', 26, true);


--
-- Name: prescriptionapp_subinventories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_subinventories_id_seq', 111, true);


--
-- Name: prescriptionapp_submain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_submain_id_seq', 44, true);


--
-- Name: prescriptionapp_workinghours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.prescriptionapp_workinghours_id_seq', 27, true);


--
-- Name: profiles_accountskey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.profiles_accountskey_id_seq', 1, false);


--
-- Name: profiles_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.profiles_payment_id_seq', 52, true);


--
-- Name: profiles_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.profiles_profile_id_seq', 86, true);


--
-- Name: profiles_wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.profiles_wallet_id_seq', 1, false);


--
-- Name: robots_rule_allowed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.robots_rule_allowed_id_seq', 1, false);


--
-- Name: robots_rule_disallowed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.robots_rule_disallowed_id_seq', 1, false);


--
-- Name: robots_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.robots_rule_id_seq', 1, false);


--
-- Name: robots_rule_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.robots_rule_sites_id_seq', 1, false);


--
-- Name: robots_url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.robots_url_id_seq', 1, false);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: ERP_address ERP_address_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_address"
    ADD CONSTRAINT "ERP_address_pkey" PRIMARY KEY (id);


--
-- Name: ERP_apiusage ERP_apiusage_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_apiusage"
    ADD CONSTRAINT "ERP_apiusage_pkey" PRIMARY KEY (id);


--
-- Name: ERP_application ERP_application_name_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_application"
    ADD CONSTRAINT "ERP_application_name_key" UNIQUE (name);


--
-- Name: ERP_application_owners ERP_application_owners_application_id_user_id_8c15cff6_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_application_owners"
    ADD CONSTRAINT "ERP_application_owners_application_id_user_id_8c15cff6_uniq" UNIQUE (application_id, user_id);


--
-- Name: ERP_application_owners ERP_application_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_application_owners"
    ADD CONSTRAINT "ERP_application_owners_pkey" PRIMARY KEY (id);


--
-- Name: ERP_application ERP_application_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_application"
    ADD CONSTRAINT "ERP_application_pkey" PRIMARY KEY (id);


--
-- Name: ERP_appsettingsfield ERP_appsettingsfield_name_app_id_fb4336f7_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_appsettingsfield"
    ADD CONSTRAINT "ERP_appsettingsfield_name_app_id_fb4336f7_uniq" UNIQUE (name, app_id);


--
-- Name: ERP_appsettingsfield ERP_appsettingsfield_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_appsettingsfield"
    ADD CONSTRAINT "ERP_appsettingsfield_pkey" PRIMARY KEY (id);


--
-- Name: ERP_device ERP_device_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_device"
    ADD CONSTRAINT "ERP_device_pkey" PRIMARY KEY (id);


--
-- Name: ERP_grouppermission ERP_grouppermission_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_grouppermission"
    ADD CONSTRAINT "ERP_grouppermission_pkey" PRIMARY KEY (id);


--
-- Name: ERP_media ERP_media_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_media"
    ADD CONSTRAINT "ERP_media_pkey" PRIMARY KEY (id);


--
-- Name: ERP_module ERP_module_name_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_module"
    ADD CONSTRAINT "ERP_module_name_key" UNIQUE (name);


--
-- Name: ERP_module ERP_module_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_module"
    ADD CONSTRAINT "ERP_module_pkey" PRIMARY KEY (id);


--
-- Name: ERP_permission ERP_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_permission"
    ADD CONSTRAINT "ERP_permission_pkey" PRIMARY KEY (id);


--
-- Name: ERP_profile_devices ERP_profile_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_profile_devices"
    ADD CONSTRAINT "ERP_profile_devices_pkey" PRIMARY KEY (id);


--
-- Name: ERP_profile_devices ERP_profile_devices_profile_id_device_id_888f1482_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_profile_devices"
    ADD CONSTRAINT "ERP_profile_devices_profile_id_device_id_888f1482_uniq" UNIQUE (profile_id, device_id);


--
-- Name: ERP_profile ERP_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_profile"
    ADD CONSTRAINT "ERP_profile_pkey" PRIMARY KEY (id);


--
-- Name: ERP_publicapikeys ERP_publicapikeys_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_publicapikeys"
    ADD CONSTRAINT "ERP_publicapikeys_pkey" PRIMARY KEY (id);


--
-- Name: ERP_service ERP_service_name_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_service"
    ADD CONSTRAINT "ERP_service_name_key" UNIQUE (name);


--
-- Name: ERP_service ERP_service_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_service"
    ADD CONSTRAINT "ERP_service_pkey" PRIMARY KEY (id);


--
-- Name: PIM_settings PIM_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."PIM_settings"
    ADD CONSTRAINT "PIM_settings_pkey" PRIMARY KEY (id);


--
-- Name: PIM_settings PIM_settings_user_id_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."PIM_settings"
    ADD CONSTRAINT "PIM_settings_user_id_key" UNIQUE (user_id);


--
-- Name: PIM_theme PIM_theme_parent_id_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."PIM_theme"
    ADD CONSTRAINT "PIM_theme_parent_id_key" UNIQUE (parent_id);


--
-- Name: PIM_theme PIM_theme_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."PIM_theme"
    ADD CONSTRAINT "PIM_theme_pkey" PRIMARY KEY (id);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: corsheaders_corsmodel corsheaders_corsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.corsheaders_corsmodel
    ADD CONSTRAINT corsheaders_corsmodel_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: online_users_onlineuseractivity online_users_onlineuseractivity_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.online_users_onlineuseractivity
    ADD CONSTRAINT online_users_onlineuseractivity_pkey PRIMARY KEY (id);


--
-- Name: online_users_onlineuseractivity online_users_onlineuseractivity_user_id_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.online_users_onlineuseractivity
    ADD CONSTRAINT online_users_onlineuseractivity_user_id_key UNIQUE (user_id);


--
-- Name: prescriptionapp_appointments prescriptionapp_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_appointments
    ADD CONSTRAINT prescriptionapp_appointments_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_chatmessage prescriptionapp_chatmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_chatmessage
    ADD CONSTRAINT prescriptionapp_chatmessage_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_chatmessageread prescriptionapp_chatmessageread_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_chatmessageread
    ADD CONSTRAINT prescriptionapp_chatmessageread_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_clinic prescriptionapp_clinic_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_clinic
    ADD CONSTRAINT prescriptionapp_clinic_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_clinicgroupthread prescriptionapp_clinicgroupthread_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_clinicgroupthread
    ADD CONSTRAINT prescriptionapp_clinicgroupthread_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_disease prescriptionapp_disease_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_disease
    ADD CONSTRAINT prescriptionapp_disease_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_disease prescriptionapp_disease_title_9ba66d14_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_disease
    ADD CONSTRAINT prescriptionapp_disease_title_9ba66d14_uniq UNIQUE (title);


--
-- Name: prescriptionapp_doctorthread prescriptionapp_doctorthread_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_doctorthread
    ADD CONSTRAINT prescriptionapp_doctorthread_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_doctortimings prescriptionapp_doctortimings_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_doctortimings
    ADD CONSTRAINT prescriptionapp_doctortimings_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_inventoryorders_items prescriptionapp_inventor_inventoryorders_id_subin_3e9fc989_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventoryorders_items
    ADD CONSTRAINT prescriptionapp_inventor_inventoryorders_id_subin_3e9fc989_uniq UNIQUE (inventoryorders_id, subinventories_id);


--
-- Name: prescriptionapp_inventory prescriptionapp_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventory
    ADD CONSTRAINT prescriptionapp_inventory_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_inventorycategory prescriptionapp_inventorycategory_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventorycategory
    ADD CONSTRAINT prescriptionapp_inventorycategory_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_inventoryorders_items prescriptionapp_inventoryorders_ordered_items_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventoryorders_items
    ADD CONSTRAINT prescriptionapp_inventoryorders_ordered_items_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_inventoryorders prescriptionapp_inventoryorders_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventoryorders
    ADD CONSTRAINT prescriptionapp_inventoryorders_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_issuedprescription prescriptionapp_issuedprescription_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_issuedprescription
    ADD CONSTRAINT prescriptionapp_issuedprescription_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_items prescriptionapp_items_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_items
    ADD CONSTRAINT prescriptionapp_items_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_medicine prescriptionapp_medicine_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_medicine
    ADD CONSTRAINT prescriptionapp_medicine_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_medicinetimes prescriptionapp_medicinetimes_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_medicinetimes
    ADD CONSTRAINT prescriptionapp_medicinetimes_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_prescription_medicines prescriptionapp_prescrip_prescription_id_medicine_82671a7c_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription_medicines
    ADD CONSTRAINT prescriptionapp_prescrip_prescription_id_medicine_82671a7c_uniq UNIQUE (prescription_id, medicinetimes_id);


--
-- Name: prescriptionapp_prescription prescriptionapp_prescription_appointment_id_d3f23f65_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription
    ADD CONSTRAINT prescriptionapp_prescription_appointment_id_d3f23f65_uniq UNIQUE (appointment_id);


--
-- Name: prescriptionapp_prescription_medicines prescriptionapp_prescription_medicines_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription_medicines
    ADD CONSTRAINT prescriptionapp_prescription_medicines_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_prescription prescriptionapp_prescription_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription
    ADD CONSTRAINT prescriptionapp_prescription_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_recopinist prescriptionapp_recopinist_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_recopinist
    ADD CONSTRAINT prescriptionapp_recopinist_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_solditems_items prescriptionapp_solditem_solditems_id_submain_id_71c9eb00_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_solditems_items
    ADD CONSTRAINT prescriptionapp_solditem_solditems_id_submain_id_71c9eb00_uniq UNIQUE (solditems_id, soldsubs_id);


--
-- Name: prescriptionapp_solditems_items prescriptionapp_solditems_items_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_solditems_items
    ADD CONSTRAINT prescriptionapp_solditems_items_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_solditems prescriptionapp_solditems_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_solditems
    ADD CONSTRAINT prescriptionapp_solditems_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_soldsubs prescriptionapp_soldsubs_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_soldsubs
    ADD CONSTRAINT prescriptionapp_soldsubs_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_subinventories prescriptionapp_subinventories_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_subinventories
    ADD CONSTRAINT prescriptionapp_subinventories_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_submain prescriptionapp_submain_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_submain
    ADD CONSTRAINT prescriptionapp_submain_pkey PRIMARY KEY (id);


--
-- Name: prescriptionapp_workinghours prescriptionapp_workinghours_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_workinghours
    ADD CONSTRAINT prescriptionapp_workinghours_pkey PRIMARY KEY (id);


--
-- Name: profiles_accountskey profiles_accountskey_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_accountskey
    ADD CONSTRAINT profiles_accountskey_pkey PRIMARY KEY (id);


--
-- Name: profiles_payment profiles_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_payment
    ADD CONSTRAINT profiles_payment_pkey PRIMARY KEY (id);


--
-- Name: profiles_profile profiles_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_profile
    ADD CONSTRAINT profiles_profile_pkey PRIMARY KEY (id);


--
-- Name: profiles_profile profiles_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_key UNIQUE (user_id);


--
-- Name: profiles_wallet profiles_wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_wallet
    ADD CONSTRAINT profiles_wallet_pkey PRIMARY KEY (id);


--
-- Name: profiles_wallet profiles_wallet_user_id_key; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_wallet
    ADD CONSTRAINT profiles_wallet_user_id_key UNIQUE (user_id);


--
-- Name: robots_rule_allowed robots_rule_allowed_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_allowed
    ADD CONSTRAINT robots_rule_allowed_pkey PRIMARY KEY (id);


--
-- Name: robots_rule_allowed robots_rule_allowed_rule_id_url_id_83b262d4_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_allowed
    ADD CONSTRAINT robots_rule_allowed_rule_id_url_id_83b262d4_uniq UNIQUE (rule_id, url_id);


--
-- Name: robots_rule_disallowed robots_rule_disallowed_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_disallowed
    ADD CONSTRAINT robots_rule_disallowed_pkey PRIMARY KEY (id);


--
-- Name: robots_rule_disallowed robots_rule_disallowed_rule_id_url_id_4d9b6222_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_disallowed
    ADD CONSTRAINT robots_rule_disallowed_rule_id_url_id_4d9b6222_uniq UNIQUE (rule_id, url_id);


--
-- Name: robots_rule robots_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule
    ADD CONSTRAINT robots_rule_pkey PRIMARY KEY (id);


--
-- Name: robots_rule_sites robots_rule_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_sites
    ADD CONSTRAINT robots_rule_sites_pkey PRIMARY KEY (id);


--
-- Name: robots_rule_sites robots_rule_sites_rule_id_site_id_093f04ea_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_sites
    ADD CONSTRAINT robots_rule_sites_rule_id_site_id_093f04ea_uniq UNIQUE (rule_id, site_id);


--
-- Name: robots_url robots_url_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_url
    ADD CONSTRAINT robots_url_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: ERP_apiusage_api_id_d2d6d7bc; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_apiusage_api_id_d2d6d7bc" ON public."ERP_apiusage" USING btree (api_id);


--
-- Name: ERP_application_canConfigure_id_35224e6f; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_application_canConfigure_id_35224e6f" ON public."ERP_application" USING btree ("canConfigure_id");


--
-- Name: ERP_application_module_id_0d170394; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_application_module_id_0d170394" ON public."ERP_application" USING btree (module_id);


--
-- Name: ERP_application_name_9e5f92d2_like; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_application_name_9e5f92d2_like" ON public."ERP_application" USING btree (name varchar_pattern_ops);


--
-- Name: ERP_application_owners_application_id_6795bef2; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_application_owners_application_id_6795bef2" ON public."ERP_application_owners" USING btree (application_id);


--
-- Name: ERP_application_owners_user_id_6ba97cb6; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_application_owners_user_id_6ba97cb6" ON public."ERP_application_owners" USING btree (user_id);


--
-- Name: ERP_appsettingsfield_app_id_5e0bb5a0; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_appsettingsfield_app_id_5e0bb5a0" ON public."ERP_appsettingsfield" USING btree (app_id);


--
-- Name: ERP_grouppermission_app_id_b08880bd; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_grouppermission_app_id_b08880bd" ON public."ERP_grouppermission" USING btree (app_id);


--
-- Name: ERP_grouppermission_givenBy_id_522edf12; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_grouppermission_givenBy_id_522edf12" ON public."ERP_grouppermission" USING btree ("givenBy_id");


--
-- Name: ERP_grouppermission_group_id_a7722e27; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_grouppermission_group_id_a7722e27" ON public."ERP_grouppermission" USING btree (group_id);


--
-- Name: ERP_media_user_id_8a7ec32d; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_media_user_id_8a7ec32d" ON public."ERP_media" USING btree (user_id);


--
-- Name: ERP_module_name_16c5c31d_like; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_module_name_16c5c31d_like" ON public."ERP_module" USING btree (name varchar_pattern_ops);


--
-- Name: ERP_permission_app_id_9d39a250; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_permission_app_id_9d39a250" ON public."ERP_permission" USING btree (app_id);


--
-- Name: ERP_permission_givenBy_id_54b91569; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_permission_givenBy_id_54b91569" ON public."ERP_permission" USING btree ("givenBy_id");


--
-- Name: ERP_permission_user_id_6ba8c3c0; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_permission_user_id_6ba8c3c0" ON public."ERP_permission" USING btree (user_id);


--
-- Name: ERP_profile_devices_device_id_7524e397; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_profile_devices_device_id_7524e397" ON public."ERP_profile_devices" USING btree (device_id);


--
-- Name: ERP_profile_devices_profile_id_f5ddf933; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_profile_devices_profile_id_f5ddf933" ON public."ERP_profile_devices" USING btree (profile_id);


--
-- Name: ERP_profile_user_id_7dada053; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_profile_user_id_7dada053" ON public."ERP_profile" USING btree (user_id);


--
-- Name: ERP_publicapikeys_admin_id_b9030d87; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_publicapikeys_admin_id_b9030d87" ON public."ERP_publicapikeys" USING btree (admin_id);


--
-- Name: ERP_publicapikeys_app_id_7ffce6c9; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_publicapikeys_app_id_7ffce6c9" ON public."ERP_publicapikeys" USING btree (app_id);


--
-- Name: ERP_publicapikeys_user_id_c88963a9; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_publicapikeys_user_id_c88963a9" ON public."ERP_publicapikeys" USING btree (user_id);


--
-- Name: ERP_service_address_id_d624f8d9; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_service_address_id_d624f8d9" ON public."ERP_service" USING btree (address_id);


--
-- Name: ERP_service_contactPerson_id_d67847fb; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_service_contactPerson_id_d67847fb" ON public."ERP_service" USING btree ("contactPerson_id");


--
-- Name: ERP_service_doc_id_fc7c5af1; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_service_doc_id_fc7c5af1" ON public."ERP_service" USING btree (doc_id);


--
-- Name: ERP_service_name_a067cc81_like; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_service_name_a067cc81_like" ON public."ERP_service" USING btree (name varchar_pattern_ops);


--
-- Name: ERP_service_user_id_91a0df31; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "ERP_service_user_id_91a0df31" ON public."ERP_service" USING btree (user_id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: prescriptionapp_appointments_clinic_id_bd7c2718; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_appointments_clinic_id_bd7c2718 ON public.prescriptionapp_appointments USING btree (clinic_id);


--
-- Name: prescriptionapp_appointments_doctor_id_1dc23624; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_appointments_doctor_id_1dc23624 ON public.prescriptionapp_appointments USING btree (doctor_id);


--
-- Name: prescriptionapp_appointments_requesteduser_id_5c41e45f; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_appointments_requesteduser_id_5c41e45f ON public.prescriptionapp_appointments USING btree (requesteduser_id);


--
-- Name: prescriptionapp_chatmessage_clinicThread_id_7ee5ca13; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "prescriptionapp_chatmessage_clinicThread_id_7ee5ca13" ON public.prescriptionapp_chatmessage USING btree ("clinicThread_id");


--
-- Name: prescriptionapp_chatmessage_doctorThread_id_a3b44417; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "prescriptionapp_chatmessage_doctorThread_id_a3b44417" ON public.prescriptionapp_chatmessage USING btree ("doctorThread_id");


--
-- Name: prescriptionapp_chatmessage_sender_id_442af0c1; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_chatmessage_sender_id_442af0c1 ON public.prescriptionapp_chatmessage USING btree (sender_id);


--
-- Name: prescriptionapp_chatmessageread_chatMessage_id_19634aa7; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "prescriptionapp_chatmessageread_chatMessage_id_19634aa7" ON public.prescriptionapp_chatmessageread USING btree ("chatMessage_id");


--
-- Name: prescriptionapp_chatmessageread_participant_id_c18403ef; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_chatmessageread_participant_id_c18403ef ON public.prescriptionapp_chatmessageread USING btree (participant_id);


--
-- Name: prescriptionapp_clinic_inventory_id_f269c5ee; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_clinic_inventory_id_f269c5ee ON public.prescriptionapp_clinic USING btree (inventory_id);


--
-- Name: prescriptionapp_clinic_owner_id_89c74474; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_clinic_owner_id_89c74474 ON public.prescriptionapp_clinic USING btree (owner_id);


--
-- Name: prescriptionapp_clinicgroupthread_clinic_id_9a23cdf5; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_clinicgroupthread_clinic_id_9a23cdf5 ON public.prescriptionapp_clinicgroupthread USING btree (clinic_id);


--
-- Name: prescriptionapp_clinicgroupthread_forUser_id_933717f3; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "prescriptionapp_clinicgroupthread_forUser_id_933717f3" ON public.prescriptionapp_clinicgroupthread USING btree ("forUser_id");


--
-- Name: prescriptionapp_disease_title_9ba66d14_like; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_disease_title_9ba66d14_like ON public.prescriptionapp_disease USING btree (title varchar_pattern_ops);


--
-- Name: prescriptionapp_doctorthread_doctor_id_25afa676; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_doctorthread_doctor_id_25afa676 ON public.prescriptionapp_doctorthread USING btree (doctor_id);


--
-- Name: prescriptionapp_doctorthread_forUser_id_9dc92181; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "prescriptionapp_doctorthread_forUser_id_9dc92181" ON public.prescriptionapp_doctorthread USING btree ("forUser_id");


--
-- Name: prescriptionapp_doctortimings_doctorshift_id_5ad4e622; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_doctortimings_doctorshift_id_5ad4e622 ON public.prescriptionapp_doctortimings USING btree (doctorshift_id);


--
-- Name: prescriptionapp_inventorycategory_inventory_id_440d232b; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_inventorycategory_inventory_id_440d232b ON public.prescriptionapp_inventorycategory USING btree (inventory_id);


--
-- Name: prescriptionapp_inventoryo_inventoryorders_id_b92c4164; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_inventoryo_inventoryorders_id_b92c4164 ON public.prescriptionapp_inventoryorders_items USING btree (inventoryorders_id);


--
-- Name: prescriptionapp_inventoryo_subinventories_id_99d1e11c; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_inventoryo_subinventories_id_99d1e11c ON public.prescriptionapp_inventoryorders_items USING btree (subinventories_id);


--
-- Name: prescriptionapp_inventoryorders_inventory_id_614a8e6c; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_inventoryorders_inventory_id_614a8e6c ON public.prescriptionapp_inventoryorders USING btree (inventory_id);


--
-- Name: prescriptionapp_issuedprescription_clinic_id_fb299e4e; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_issuedprescription_clinic_id_fb299e4e ON public.prescriptionapp_issuedprescription USING btree (clinic_id);


--
-- Name: prescriptionapp_issuedprescription_prescription_id_3d34cc09; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_issuedprescription_prescription_id_3d34cc09 ON public.prescriptionapp_issuedprescription USING btree (prescription_id);


--
-- Name: prescriptionapp_medicinetimes_medicine_id_74fb0b8f; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_medicinetimes_medicine_id_74fb0b8f ON public.prescriptionapp_medicinetimes USING btree (medicine_id);


--
-- Name: prescriptionapp_prescripti_medicinetimes_id_20690b30; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_prescripti_medicinetimes_id_20690b30 ON public.prescriptionapp_prescription_medicines USING btree (medicinetimes_id);


--
-- Name: prescriptionapp_prescription_clinic_id_38f1884b; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_prescription_clinic_id_38f1884b ON public.prescriptionapp_prescription USING btree (clinic_id);


--
-- Name: prescriptionapp_prescription_doctor_id_8df418b1; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_prescription_doctor_id_8df418b1 ON public.prescriptionapp_prescription USING btree (doctor_id);


--
-- Name: prescriptionapp_prescription_forUser_id_e3433c17; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX "prescriptionapp_prescription_forUser_id_e3433c17" ON public.prescriptionapp_prescription USING btree ("forUser_id");


--
-- Name: prescriptionapp_prescription_medicines_prescription_id_98e42082; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_prescription_medicines_prescription_id_98e42082 ON public.prescriptionapp_prescription_medicines USING btree (prescription_id);


--
-- Name: prescriptionapp_prescription_new_disease_id_0212bf9a; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_prescription_new_disease_id_0212bf9a ON public.prescriptionapp_prescription USING btree (new_disease_id);


--
-- Name: prescriptionapp_recopinist_clinic_id_8e2f3d92; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_recopinist_clinic_id_8e2f3d92 ON public.prescriptionapp_recopinist USING btree (clinic_id);


--
-- Name: prescriptionapp_recopinist_user_id_87bd57cf; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_recopinist_user_id_87bd57cf ON public.prescriptionapp_recopinist USING btree (user_id);


--
-- Name: prescriptionapp_solditems_inventory_id_3795de3a; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_solditems_inventory_id_3795de3a ON public.prescriptionapp_solditems USING btree (inventory_id);


--
-- Name: prescriptionapp_solditems_items_solditems_id_56e654f5; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_solditems_items_solditems_id_56e654f5 ON public.prescriptionapp_solditems_items USING btree (solditems_id);


--
-- Name: prescriptionapp_solditems_items_submain_id_2b3e50e4; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_solditems_items_submain_id_2b3e50e4 ON public.prescriptionapp_solditems_items USING btree (soldsubs_id);


--
-- Name: prescriptionapp_soldsubs_submain_id_aa1d6a48; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_soldsubs_submain_id_aa1d6a48 ON public.prescriptionapp_soldsubs USING btree (submain_id);


--
-- Name: prescriptionapp_subinventories_category_id_729b97cb; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_subinventories_category_id_729b97cb ON public.prescriptionapp_subinventories USING btree (category_id);


--
-- Name: prescriptionapp_submain_category_id_261b4fe9; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_submain_category_id_261b4fe9 ON public.prescriptionapp_submain USING btree (category_id);


--
-- Name: prescriptionapp_submain_medicine_id_3c7060ba; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_submain_medicine_id_3c7060ba ON public.prescriptionapp_submain USING btree (medicine_id);


--
-- Name: prescriptionapp_workinghours_clinic_id_1073ef67; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_workinghours_clinic_id_1073ef67 ON public.prescriptionapp_workinghours USING btree (clinic_id);


--
-- Name: prescriptionapp_workinghours_doctor_id_344f36f5; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX prescriptionapp_workinghours_doctor_id_344f36f5 ON public.prescriptionapp_workinghours USING btree (doctor_id);


--
-- Name: profiles_accountskey_user_id_78884aee; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX profiles_accountskey_user_id_78884aee ON public.profiles_accountskey USING btree (user_id);


--
-- Name: profiles_payment_clinic_id_a645acbc; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX profiles_payment_clinic_id_a645acbc ON public.profiles_payment USING btree (clinic_id);


--
-- Name: profiles_payment_user_id_2e098b55; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX profiles_payment_user_id_2e098b55 ON public.profiles_payment USING btree (user_id);


--
-- Name: robots_rule_allowed_rule_id_aa90358c; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX robots_rule_allowed_rule_id_aa90358c ON public.robots_rule_allowed USING btree (rule_id);


--
-- Name: robots_rule_allowed_url_id_6157f60a; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX robots_rule_allowed_url_id_6157f60a ON public.robots_rule_allowed USING btree (url_id);


--
-- Name: robots_rule_disallowed_rule_id_fad7328c; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX robots_rule_disallowed_rule_id_fad7328c ON public.robots_rule_disallowed USING btree (rule_id);


--
-- Name: robots_rule_disallowed_url_id_8e02db92; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX robots_rule_disallowed_url_id_8e02db92 ON public.robots_rule_disallowed USING btree (url_id);


--
-- Name: robots_rule_sites_rule_id_7921a799; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX robots_rule_sites_rule_id_7921a799 ON public.robots_rule_sites USING btree (rule_id);


--
-- Name: robots_rule_sites_site_id_efe5be97; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX robots_rule_sites_site_id_efe5be97 ON public.robots_rule_sites USING btree (site_id);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: ERP_apiusage ERP_apiusage_api_id_d2d6d7bc_fk_ERP_publicapikeys_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_apiusage"
    ADD CONSTRAINT "ERP_apiusage_api_id_d2d6d7bc_fk_ERP_publicapikeys_id" FOREIGN KEY (api_id) REFERENCES public."ERP_publicapikeys"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_application ERP_application_canConfigure_id_35224e6f_fk_ERP_application_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_application"
    ADD CONSTRAINT "ERP_application_canConfigure_id_35224e6f_fk_ERP_application_id" FOREIGN KEY ("canConfigure_id") REFERENCES public."ERP_application"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_application ERP_application_module_id_0d170394_fk_ERP_module_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_application"
    ADD CONSTRAINT "ERP_application_module_id_0d170394_fk_ERP_module_id" FOREIGN KEY (module_id) REFERENCES public."ERP_module"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_application_owners ERP_application_owne_application_id_6795bef2_fk_ERP_appli; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_application_owners"
    ADD CONSTRAINT "ERP_application_owne_application_id_6795bef2_fk_ERP_appli" FOREIGN KEY (application_id) REFERENCES public."ERP_application"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_application_owners ERP_application_owners_user_id_6ba97cb6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_application_owners"
    ADD CONSTRAINT "ERP_application_owners_user_id_6ba97cb6_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_appsettingsfield ERP_appsettingsfield_app_id_5e0bb5a0_fk_ERP_application_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_appsettingsfield"
    ADD CONSTRAINT "ERP_appsettingsfield_app_id_5e0bb5a0_fk_ERP_application_id" FOREIGN KEY (app_id) REFERENCES public."ERP_application"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_grouppermission ERP_grouppermission_app_id_b08880bd_fk_ERP_application_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_grouppermission"
    ADD CONSTRAINT "ERP_grouppermission_app_id_b08880bd_fk_ERP_application_id" FOREIGN KEY (app_id) REFERENCES public."ERP_application"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_grouppermission ERP_grouppermission_givenBy_id_522edf12_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_grouppermission"
    ADD CONSTRAINT "ERP_grouppermission_givenBy_id_522edf12_fk_auth_user_id" FOREIGN KEY ("givenBy_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_grouppermission ERP_grouppermission_group_id_a7722e27_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_grouppermission"
    ADD CONSTRAINT "ERP_grouppermission_group_id_a7722e27_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_media ERP_media_user_id_8a7ec32d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_media"
    ADD CONSTRAINT "ERP_media_user_id_8a7ec32d_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_permission ERP_permission_app_id_9d39a250_fk_ERP_application_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_permission"
    ADD CONSTRAINT "ERP_permission_app_id_9d39a250_fk_ERP_application_id" FOREIGN KEY (app_id) REFERENCES public."ERP_application"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_permission ERP_permission_givenBy_id_54b91569_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_permission"
    ADD CONSTRAINT "ERP_permission_givenBy_id_54b91569_fk_auth_user_id" FOREIGN KEY ("givenBy_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_permission ERP_permission_user_id_6ba8c3c0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_permission"
    ADD CONSTRAINT "ERP_permission_user_id_6ba8c3c0_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_profile_devices ERP_profile_devices_device_id_7524e397_fk_ERP_device_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_profile_devices"
    ADD CONSTRAINT "ERP_profile_devices_device_id_7524e397_fk_ERP_device_id" FOREIGN KEY (device_id) REFERENCES public."ERP_device"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_profile_devices ERP_profile_devices_profile_id_f5ddf933_fk_ERP_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_profile_devices"
    ADD CONSTRAINT "ERP_profile_devices_profile_id_f5ddf933_fk_ERP_profile_id" FOREIGN KEY (profile_id) REFERENCES public."ERP_profile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_profile ERP_profile_user_id_7dada053_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_profile"
    ADD CONSTRAINT "ERP_profile_user_id_7dada053_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_publicapikeys ERP_publicapikeys_admin_id_b9030d87_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_publicapikeys"
    ADD CONSTRAINT "ERP_publicapikeys_admin_id_b9030d87_fk_auth_user_id" FOREIGN KEY (admin_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_publicapikeys ERP_publicapikeys_app_id_7ffce6c9_fk_ERP_application_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_publicapikeys"
    ADD CONSTRAINT "ERP_publicapikeys_app_id_7ffce6c9_fk_ERP_application_id" FOREIGN KEY (app_id) REFERENCES public."ERP_application"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_publicapikeys ERP_publicapikeys_user_id_c88963a9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_publicapikeys"
    ADD CONSTRAINT "ERP_publicapikeys_user_id_c88963a9_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_service ERP_service_address_id_d624f8d9_fk_ERP_address_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_service"
    ADD CONSTRAINT "ERP_service_address_id_d624f8d9_fk_ERP_address_id" FOREIGN KEY (address_id) REFERENCES public."ERP_address"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_service ERP_service_contactPerson_id_d67847fb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_service"
    ADD CONSTRAINT "ERP_service_contactPerson_id_d67847fb_fk_auth_user_id" FOREIGN KEY ("contactPerson_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_service ERP_service_doc_id_fc7c5af1_fk_ERP_media_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_service"
    ADD CONSTRAINT "ERP_service_doc_id_fc7c5af1_fk_ERP_media_id" FOREIGN KEY (doc_id) REFERENCES public."ERP_media"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ERP_service ERP_service_user_id_91a0df31_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."ERP_service"
    ADD CONSTRAINT "ERP_service_user_id_91a0df31_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: PIM_settings PIM_settings_user_id_2784d72a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."PIM_settings"
    ADD CONSTRAINT "PIM_settings_user_id_2784d72a_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: PIM_theme PIM_theme_parent_id_a62dc5ac_fk_PIM_settings_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public."PIM_theme"
    ADD CONSTRAINT "PIM_theme_parent_id_a62dc5ac_fk_PIM_settings_id" FOREIGN KEY (parent_id) REFERENCES public."PIM_settings"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirmation_email_address_id_5b7f8c58_fk; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: online_users_onlineuseractivity online_users_onlineu_user_id_6def50a3_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.online_users_onlineuseractivity
    ADD CONSTRAINT online_users_onlineu_user_id_6def50a3_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_appointments prescriptionapp_appo_clinic_id_bd7c2718_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_appointments
    ADD CONSTRAINT prescriptionapp_appo_clinic_id_bd7c2718_fk_prescript FOREIGN KEY (clinic_id) REFERENCES public.prescriptionapp_clinic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_appointments prescriptionapp_appo_requesteduser_id_5c41e45f_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_appointments
    ADD CONSTRAINT prescriptionapp_appo_requesteduser_id_5c41e45f_fk_auth_user FOREIGN KEY (requesteduser_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_appointments prescriptionapp_appointments_doctor_id_1dc23624_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_appointments
    ADD CONSTRAINT prescriptionapp_appointments_doctor_id_1dc23624_fk_auth_user_id FOREIGN KEY (doctor_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_chatmessageread prescriptionapp_chat_chatMessage_id_19634aa7_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_chatmessageread
    ADD CONSTRAINT "prescriptionapp_chat_chatMessage_id_19634aa7_fk_prescript" FOREIGN KEY ("chatMessage_id") REFERENCES public.prescriptionapp_chatmessage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_chatmessage prescriptionapp_chat_clinicThread_id_7ee5ca13_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_chatmessage
    ADD CONSTRAINT "prescriptionapp_chat_clinicThread_id_7ee5ca13_fk_prescript" FOREIGN KEY ("clinicThread_id") REFERENCES public.prescriptionapp_clinicgroupthread(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_chatmessage prescriptionapp_chat_doctorThread_id_a3b44417_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_chatmessage
    ADD CONSTRAINT "prescriptionapp_chat_doctorThread_id_a3b44417_fk_prescript" FOREIGN KEY ("doctorThread_id") REFERENCES public.prescriptionapp_doctorthread(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_chatmessageread prescriptionapp_chat_participant_id_c18403ef_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_chatmessageread
    ADD CONSTRAINT prescriptionapp_chat_participant_id_c18403ef_fk_auth_user FOREIGN KEY (participant_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_chatmessage prescriptionapp_chatmessage_sender_id_442af0c1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_chatmessage
    ADD CONSTRAINT prescriptionapp_chatmessage_sender_id_442af0c1_fk_auth_user_id FOREIGN KEY (sender_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_clinicgroupthread prescriptionapp_clin_clinic_id_9a23cdf5_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_clinicgroupthread
    ADD CONSTRAINT prescriptionapp_clin_clinic_id_9a23cdf5_fk_prescript FOREIGN KEY (clinic_id) REFERENCES public.prescriptionapp_clinic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_clinicgroupthread prescriptionapp_clin_forUser_id_933717f3_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_clinicgroupthread
    ADD CONSTRAINT "prescriptionapp_clin_forUser_id_933717f3_fk_auth_user" FOREIGN KEY ("forUser_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_clinic prescriptionapp_clin_inventory_id_f269c5ee_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_clinic
    ADD CONSTRAINT prescriptionapp_clin_inventory_id_f269c5ee_fk_prescript FOREIGN KEY (inventory_id) REFERENCES public.prescriptionapp_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_clinic prescriptionapp_clinic_owner_id_89c74474_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_clinic
    ADD CONSTRAINT prescriptionapp_clinic_owner_id_89c74474_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_doctortimings prescriptionapp_doct_doctorshift_id_5ad4e622_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_doctortimings
    ADD CONSTRAINT prescriptionapp_doct_doctorshift_id_5ad4e622_fk_prescript FOREIGN KEY (doctorshift_id) REFERENCES public.prescriptionapp_workinghours(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_doctorthread prescriptionapp_doct_forUser_id_9dc92181_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_doctorthread
    ADD CONSTRAINT "prescriptionapp_doct_forUser_id_9dc92181_fk_auth_user" FOREIGN KEY ("forUser_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_doctorthread prescriptionapp_doctorthread_doctor_id_25afa676_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_doctorthread
    ADD CONSTRAINT prescriptionapp_doctorthread_doctor_id_25afa676_fk_auth_user_id FOREIGN KEY (doctor_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_inventorycategory prescriptionapp_inve_inventory_id_440d232b_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventorycategory
    ADD CONSTRAINT prescriptionapp_inve_inventory_id_440d232b_fk_prescript FOREIGN KEY (inventory_id) REFERENCES public.prescriptionapp_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_inventoryorders prescriptionapp_inve_inventory_id_614a8e6c_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventoryorders
    ADD CONSTRAINT prescriptionapp_inve_inventory_id_614a8e6c_fk_prescript FOREIGN KEY (inventory_id) REFERENCES public.prescriptionapp_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_inventoryorders_items prescriptionapp_inve_inventoryorders_id_b81cdf04_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventoryorders_items
    ADD CONSTRAINT prescriptionapp_inve_inventoryorders_id_b81cdf04_fk_prescript FOREIGN KEY (inventoryorders_id) REFERENCES public.prescriptionapp_inventoryorders(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_inventoryorders_items prescriptionapp_inve_subinventories_id_51a9b889_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_inventoryorders_items
    ADD CONSTRAINT prescriptionapp_inve_subinventories_id_51a9b889_fk_prescript FOREIGN KEY (subinventories_id) REFERENCES public.prescriptionapp_subinventories(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_issuedprescription prescriptionapp_issu_clinic_id_fb299e4e_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_issuedprescription
    ADD CONSTRAINT prescriptionapp_issu_clinic_id_fb299e4e_fk_prescript FOREIGN KEY (clinic_id) REFERENCES public.prescriptionapp_clinic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_issuedprescription prescriptionapp_issu_prescription_id_3d34cc09_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_issuedprescription
    ADD CONSTRAINT prescriptionapp_issu_prescription_id_3d34cc09_fk_prescript FOREIGN KEY (prescription_id) REFERENCES public.prescriptionapp_prescription(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_medicinetimes prescriptionapp_medi_medicine_id_74fb0b8f_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_medicinetimes
    ADD CONSTRAINT prescriptionapp_medi_medicine_id_74fb0b8f_fk_prescript FOREIGN KEY (medicine_id) REFERENCES public.prescriptionapp_medicine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_prescription prescriptionapp_pres_appointment_id_d3f23f65_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription
    ADD CONSTRAINT prescriptionapp_pres_appointment_id_d3f23f65_fk_prescript FOREIGN KEY (appointment_id) REFERENCES public.prescriptionapp_appointments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_prescription prescriptionapp_pres_clinic_id_38f1884b_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription
    ADD CONSTRAINT prescriptionapp_pres_clinic_id_38f1884b_fk_prescript FOREIGN KEY (clinic_id) REFERENCES public.prescriptionapp_clinic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_prescription prescriptionapp_pres_forUser_id_e3433c17_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription
    ADD CONSTRAINT "prescriptionapp_pres_forUser_id_e3433c17_fk_auth_user" FOREIGN KEY ("forUser_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_prescription_medicines prescriptionapp_pres_medicinetimes_id_20690b30_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription_medicines
    ADD CONSTRAINT prescriptionapp_pres_medicinetimes_id_20690b30_fk_prescript FOREIGN KEY (medicinetimes_id) REFERENCES public.prescriptionapp_medicinetimes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_prescription prescriptionapp_pres_new_disease_id_0212bf9a_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription
    ADD CONSTRAINT prescriptionapp_pres_new_disease_id_0212bf9a_fk_prescript FOREIGN KEY (new_disease_id) REFERENCES public.prescriptionapp_disease(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_prescription_medicines prescriptionapp_pres_prescription_id_98e42082_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription_medicines
    ADD CONSTRAINT prescriptionapp_pres_prescription_id_98e42082_fk_prescript FOREIGN KEY (prescription_id) REFERENCES public.prescriptionapp_prescription(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_prescription prescriptionapp_prescription_doctor_id_8df418b1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_prescription
    ADD CONSTRAINT prescriptionapp_prescription_doctor_id_8df418b1_fk_auth_user_id FOREIGN KEY (doctor_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_recopinist prescriptionapp_reco_clinic_id_8e2f3d92_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_recopinist
    ADD CONSTRAINT prescriptionapp_reco_clinic_id_8e2f3d92_fk_prescript FOREIGN KEY (clinic_id) REFERENCES public.prescriptionapp_clinic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_recopinist prescriptionapp_recopinist_user_id_87bd57cf_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_recopinist
    ADD CONSTRAINT prescriptionapp_recopinist_user_id_87bd57cf_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_solditems prescriptionapp_sold_inventory_id_3795de3a_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_solditems
    ADD CONSTRAINT prescriptionapp_sold_inventory_id_3795de3a_fk_prescript FOREIGN KEY (inventory_id) REFERENCES public.prescriptionapp_inventory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_solditems_items prescriptionapp_sold_solditems_id_56e654f5_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_solditems_items
    ADD CONSTRAINT prescriptionapp_sold_solditems_id_56e654f5_fk_prescript FOREIGN KEY (solditems_id) REFERENCES public.prescriptionapp_solditems(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_solditems_items prescriptionapp_sold_soldsubs_id_e8c29aa0_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_solditems_items
    ADD CONSTRAINT prescriptionapp_sold_soldsubs_id_e8c29aa0_fk_prescript FOREIGN KEY (soldsubs_id) REFERENCES public.prescriptionapp_soldsubs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_soldsubs prescriptionapp_sold_submain_id_aa1d6a48_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_soldsubs
    ADD CONSTRAINT prescriptionapp_sold_submain_id_aa1d6a48_fk_prescript FOREIGN KEY (submain_id) REFERENCES public.prescriptionapp_submain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_subinventories prescriptionapp_subi_category_id_729b97cb_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_subinventories
    ADD CONSTRAINT prescriptionapp_subi_category_id_729b97cb_fk_prescript FOREIGN KEY (category_id) REFERENCES public.prescriptionapp_submain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_submain prescriptionapp_subm_category_id_261b4fe9_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_submain
    ADD CONSTRAINT prescriptionapp_subm_category_id_261b4fe9_fk_prescript FOREIGN KEY (category_id) REFERENCES public.prescriptionapp_inventorycategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_submain prescriptionapp_subm_medicine_id_3c7060ba_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_submain
    ADD CONSTRAINT prescriptionapp_subm_medicine_id_3c7060ba_fk_prescript FOREIGN KEY (medicine_id) REFERENCES public.prescriptionapp_medicine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_workinghours prescriptionapp_work_clinic_id_1073ef67_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_workinghours
    ADD CONSTRAINT prescriptionapp_work_clinic_id_1073ef67_fk_prescript FOREIGN KEY (clinic_id) REFERENCES public.prescriptionapp_clinic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prescriptionapp_workinghours prescriptionapp_workinghours_doctor_id_344f36f5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.prescriptionapp_workinghours
    ADD CONSTRAINT prescriptionapp_workinghours_doctor_id_344f36f5_fk_auth_user_id FOREIGN KEY (doctor_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_accountskey profiles_accountskey_user_id_78884aee_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_accountskey
    ADD CONSTRAINT profiles_accountskey_user_id_78884aee_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_payment profiles_payment_clinic_id_a645acbc_fk_prescript; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_payment
    ADD CONSTRAINT profiles_payment_clinic_id_a645acbc_fk_prescript FOREIGN KEY (clinic_id) REFERENCES public.prescriptionapp_clinic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_payment profiles_payment_user_id_2e098b55_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_payment
    ADD CONSTRAINT profiles_payment_user_id_2e098b55_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_profile profiles_profile_user_id_a3e81f91_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_a3e81f91_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_wallet profiles_wallet_user_id_9b9dd552_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_wallet
    ADD CONSTRAINT profiles_wallet_user_id_9b9dd552_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: robots_rule_sites robots_rule_sites_site_id_efe5be97_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_sites
    ADD CONSTRAINT robots_rule_sites_site_id_efe5be97_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_account_id_951f210e_fk; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_account_id_951f210e_fk FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_636a42d7_fk; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_636a42d7_fk FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

