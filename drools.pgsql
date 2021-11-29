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
    AS integer
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
    AS integer
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
    AS integer
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
-- Name: drolls_cart; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_cart (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    total_price double precision NOT NULL,
    money_saved double precision NOT NULL,
    active boolean NOT NULL,
    cart_bill double precision NOT NULL,
    cart_status character varying(250),
    order_type character varying(250),
    payment_status character varying(250),
    gst double precision NOT NULL,
    table_id integer,
    user_id integer
);


ALTER TABLE public.drolls_cart OWNER TO sakthi;

--
-- Name: drolls_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_cart_id_seq OWNER TO sakthi;

--
-- Name: drolls_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_cart_id_seq OWNED BY public.drolls_cart.id;


--
-- Name: drolls_cart_items; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_cart_items (
    id integer NOT NULL,
    cart_id integer NOT NULL,
    cartitem_id integer NOT NULL
);


ALTER TABLE public.drolls_cart_items OWNER TO sakthi;

--
-- Name: drolls_cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_cart_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_cart_items_id_seq OWNER TO sakthi;

--
-- Name: drolls_cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_cart_items_id_seq OWNED BY public.drolls_cart_items.id;


--
-- Name: drolls_cartitem; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_cartitem (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    item_status character varying(250),
    item_price double precision NOT NULL,
    finished_quantity integer NOT NULL,
    quantity integer NOT NULL,
    comments text NOT NULL,
    is_finished boolean NOT NULL,
    discount_price double precision NOT NULL,
    total_price double precision NOT NULL,
    item_id integer NOT NULL,
    CONSTRAINT drolls_cartitem_finished_quantity_check CHECK ((finished_quantity >= 0)),
    CONSTRAINT drolls_cartitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.drolls_cartitem OWNER TO sakthi;

--
-- Name: drolls_cartitem_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_cartitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_cartitem_id_seq OWNER TO sakthi;

--
-- Name: drolls_cartitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_cartitem_id_seq OWNED BY public.drolls_cartitem.id;


--
-- Name: drolls_category; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_category (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(500) NOT NULL
);


ALTER TABLE public.drolls_category OWNER TO sakthi;

--
-- Name: drolls_category_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_category_id_seq OWNER TO sakthi;

--
-- Name: drolls_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_category_id_seq OWNED BY public.drolls_category.id;


--
-- Name: drolls_drollsexpenses; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_drollsexpenses (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    employee_expense integer NOT NULL,
    other_expense integer NOT NULL,
    electricity_expense integer NOT NULL,
    total_expense integer NOT NULL,
    CONSTRAINT drolls_drollsexpenses_electricity_expense_check CHECK ((electricity_expense >= 0)),
    CONSTRAINT drolls_drollsexpenses_employee_expense_check CHECK ((employee_expense >= 0)),
    CONSTRAINT drolls_drollsexpenses_other_expense_check CHECK ((other_expense >= 0)),
    CONSTRAINT drolls_drollsexpenses_total_expense_check CHECK ((total_expense >= 0))
);


ALTER TABLE public.drolls_drollsexpenses OWNER TO sakthi;

--
-- Name: drolls_drollsexpenses_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_drollsexpenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_drollsexpenses_id_seq OWNER TO sakthi;

--
-- Name: drolls_drollsexpenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_drollsexpenses_id_seq OWNED BY public.drolls_drollsexpenses.id;


--
-- Name: drolls_ingridient; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_ingridient (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(500),
    description text,
    minimum_quantity double precision NOT NULL,
    type character varying(250)
);


ALTER TABLE public.drolls_ingridient OWNER TO sakthi;

--
-- Name: drolls_ingridient_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_ingridient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_ingridient_id_seq OWNER TO sakthi;

--
-- Name: drolls_ingridient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_ingridient_id_seq OWNED BY public.drolls_ingridient.id;


--
-- Name: drolls_ingridientsub; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_ingridientsub (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    quantity double precision NOT NULL,
    price double precision NOT NULL,
    status character varying(500),
    expiry_date date,
    main_id integer
);


ALTER TABLE public.drolls_ingridientsub OWNER TO sakthi;

--
-- Name: drolls_ingridientsub_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_ingridientsub_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_ingridientsub_id_seq OWNER TO sakthi;

--
-- Name: drolls_ingridientsub_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_ingridientsub_id_seq OWNED BY public.drolls_ingridientsub.id;


--
-- Name: drolls_inventorycategory; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_inventorycategory (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    grams double precision NOT NULL,
    discount double precision NOT NULL,
    price double precision NOT NULL,
    status character varying(500),
    expiry_date date
);


ALTER TABLE public.drolls_inventorycategory OWNER TO sakthi;

--
-- Name: drolls_inventorycategory_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_inventorycategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_inventorycategory_id_seq OWNER TO sakthi;

--
-- Name: drolls_inventorycategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_inventorycategory_id_seq OWNED BY public.drolls_inventorycategory.id;


--
-- Name: drolls_item; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_item (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    "displayPicture" character varying(100),
    item_price double precision NOT NULL,
    discount_price double precision NOT NULL,
    title character varying(500),
    description text,
    category_id integer
);


ALTER TABLE public.drolls_item OWNER TO sakthi;

--
-- Name: drolls_item_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_item_id_seq OWNER TO sakthi;

--
-- Name: drolls_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_item_id_seq OWNED BY public.drolls_item.id;


--
-- Name: drolls_item_ingridients; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_item_ingridients (
    id integer NOT NULL,
    item_id integer NOT NULL,
    itemsub_id integer NOT NULL
);


ALTER TABLE public.drolls_item_ingridients OWNER TO sakthi;

--
-- Name: drolls_item_ingridients_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_item_ingridients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_item_ingridients_id_seq OWNER TO sakthi;

--
-- Name: drolls_item_ingridients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_item_ingridients_id_seq OWNED BY public.drolls_item_ingridients.id;


--
-- Name: drolls_itemreview; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_itemreview (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    comment text,
    item_id integer NOT NULL
);


ALTER TABLE public.drolls_itemreview OWNER TO sakthi;

--
-- Name: drolls_itemreview_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_itemreview_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_itemreview_id_seq OWNER TO sakthi;

--
-- Name: drolls_itemreview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_itemreview_id_seq OWNED BY public.drolls_itemreview.id;


--
-- Name: drolls_itemsub; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_itemsub (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    grams double precision NOT NULL,
    ingridient_id integer
);


ALTER TABLE public.drolls_itemsub OWNER TO sakthi;

--
-- Name: drolls_itemsub_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_itemsub_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_itemsub_id_seq OWNER TO sakthi;

--
-- Name: drolls_itemsub_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_itemsub_id_seq OWNED BY public.drolls_itemsub.id;


--
-- Name: drolls_order; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_order (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    arriving_date date,
    order_status character varying(250),
    amount double precision NOT NULL,
    discount double precision NOT NULL
);


ALTER TABLE public.drolls_order OWNER TO sakthi;

--
-- Name: drolls_order_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_order_id_seq OWNER TO sakthi;

--
-- Name: drolls_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_order_id_seq OWNED BY public.drolls_order.id;


--
-- Name: drolls_order_items; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_order_items (
    id integer NOT NULL,
    order_id integer NOT NULL,
    ingridientsub_id integer NOT NULL
);


ALTER TABLE public.drolls_order_items OWNER TO sakthi;

--
-- Name: drolls_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_order_items_id_seq OWNER TO sakthi;

--
-- Name: drolls_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_order_items_id_seq OWNED BY public.drolls_order_items.id;


--
-- Name: drolls_table; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_table (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    total_persons integer NOT NULL,
    active boolean NOT NULL,
    qr_code character varying(100),
    CONSTRAINT drolls_table_total_persons_check CHECK ((total_persons >= 0))
);


ALTER TABLE public.drolls_table OWNER TO sakthi;

--
-- Name: drolls_table_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_table_id_seq OWNER TO sakthi;

--
-- Name: drolls_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_table_id_seq OWNED BY public.drolls_table.id;


--
-- Name: drolls_tablecopy; Type: TABLE; Schema: public; Owner: sakthi
--

CREATE TABLE public.drolls_tablecopy (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    total_persons integer NOT NULL,
    active boolean NOT NULL,
    qr_code character varying(100),
    CONSTRAINT drolls_tablecopy_total_persons_check CHECK ((total_persons >= 0))
);


ALTER TABLE public.drolls_tablecopy OWNER TO sakthi;

--
-- Name: drolls_tablecopy_id_seq; Type: SEQUENCE; Schema: public; Owner: sakthi
--

CREATE SEQUENCE public.drolls_tablecopy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drolls_tablecopy_id_seq OWNER TO sakthi;

--
-- Name: drolls_tablecopy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sakthi
--

ALTER SEQUENCE public.drolls_tablecopy_id_seq OWNED BY public.drolls_tablecopy.id;


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
    payment_id character varying(300),
    amount integer NOT NULL,
    subscription_date date,
    valid_till date,
    is_cash boolean NOT NULL,
    user_id integer,
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
    dob date,
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
    specialization character varying(50),
    qualification character varying(50),
    uniqueid character varying(200),
    "referralCode" character varying(300),
    "walletCreated" boolean NOT NULL,
    blood_group character varying(300),
    "isDpVerified" boolean NOT NULL,
    user_id integer NOT NULL
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
    AS integer
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
    AS integer
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
    AS integer
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
    AS integer
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
    AS integer
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
-- Name: drolls_cart id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cart ALTER COLUMN id SET DEFAULT nextval('public.drolls_cart_id_seq'::regclass);


--
-- Name: drolls_cart_items id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cart_items ALTER COLUMN id SET DEFAULT nextval('public.drolls_cart_items_id_seq'::regclass);


--
-- Name: drolls_cartitem id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cartitem ALTER COLUMN id SET DEFAULT nextval('public.drolls_cartitem_id_seq'::regclass);


--
-- Name: drolls_category id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_category ALTER COLUMN id SET DEFAULT nextval('public.drolls_category_id_seq'::regclass);


--
-- Name: drolls_drollsexpenses id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_drollsexpenses ALTER COLUMN id SET DEFAULT nextval('public.drolls_drollsexpenses_id_seq'::regclass);


--
-- Name: drolls_ingridient id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_ingridient ALTER COLUMN id SET DEFAULT nextval('public.drolls_ingridient_id_seq'::regclass);


--
-- Name: drolls_ingridientsub id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_ingridientsub ALTER COLUMN id SET DEFAULT nextval('public.drolls_ingridientsub_id_seq'::regclass);


--
-- Name: drolls_inventorycategory id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_inventorycategory ALTER COLUMN id SET DEFAULT nextval('public.drolls_inventorycategory_id_seq'::regclass);


--
-- Name: drolls_item id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_item ALTER COLUMN id SET DEFAULT nextval('public.drolls_item_id_seq'::regclass);


--
-- Name: drolls_item_ingridients id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_item_ingridients ALTER COLUMN id SET DEFAULT nextval('public.drolls_item_ingridients_id_seq'::regclass);


--
-- Name: drolls_itemreview id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_itemreview ALTER COLUMN id SET DEFAULT nextval('public.drolls_itemreview_id_seq'::regclass);


--
-- Name: drolls_itemsub id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_itemsub ALTER COLUMN id SET DEFAULT nextval('public.drolls_itemsub_id_seq'::regclass);


--
-- Name: drolls_order id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_order ALTER COLUMN id SET DEFAULT nextval('public.drolls_order_id_seq'::regclass);


--
-- Name: drolls_order_items id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_order_items ALTER COLUMN id SET DEFAULT nextval('public.drolls_order_items_id_seq'::regclass);


--
-- Name: drolls_table id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_table ALTER COLUMN id SET DEFAULT nextval('public.drolls_table_id_seq'::regclass);


--
-- Name: drolls_tablecopy id; Type: DEFAULT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_tablecopy ALTER COLUMN id SET DEFAULT nextval('public.drolls_tablecopy_id_seq'::regclass);


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
37	Can add payment	10	add_payment
38	Can change payment	10	change_payment
39	Can delete payment	10	delete_payment
40	Can view payment	10	view_payment
41	Can add accounts key	11	add_accountskey
42	Can change accounts key	11	change_accountskey
43	Can delete accounts key	11	delete_accountskey
44	Can view accounts key	11	view_accountskey
45	Can add category	12	add_category
46	Can change category	12	change_category
47	Can delete category	12	delete_category
48	Can view category	12	view_category
49	Can add drolls expenses	13	add_drollsexpenses
50	Can change drolls expenses	13	change_drollsexpenses
51	Can delete drolls expenses	13	delete_drollsexpenses
52	Can view drolls expenses	13	view_drollsexpenses
53	Can add ingridient	14	add_ingridient
54	Can change ingridient	14	change_ingridient
55	Can delete ingridient	14	delete_ingridient
56	Can view ingridient	14	view_ingridient
57	Can add ingridient sub	15	add_ingridientsub
58	Can change ingridient sub	15	change_ingridientsub
59	Can delete ingridient sub	15	delete_ingridientsub
60	Can view ingridient sub	15	view_ingridientsub
61	Can add inventory category	16	add_inventorycategory
62	Can change inventory category	16	change_inventorycategory
63	Can delete inventory category	16	delete_inventorycategory
64	Can view inventory category	16	view_inventorycategory
65	Can add item	17	add_item
66	Can change item	17	change_item
67	Can delete item	17	delete_item
68	Can view item	17	view_item
69	Can add table	18	add_table
70	Can change table	18	change_table
71	Can delete table	18	delete_table
72	Can view table	18	view_table
73	Can add table copy	19	add_tablecopy
74	Can change table copy	19	change_tablecopy
75	Can delete table copy	19	delete_tablecopy
76	Can view table copy	19	view_tablecopy
77	Can add order	20	add_order
78	Can change order	20	change_order
79	Can delete order	20	delete_order
80	Can view order	20	view_order
81	Can add item sub	21	add_itemsub
82	Can change item sub	21	change_itemsub
83	Can delete item sub	21	delete_itemsub
84	Can view item sub	21	view_itemsub
85	Can add item review	22	add_itemreview
86	Can change item review	22	change_itemreview
87	Can delete item review	22	delete_itemreview
88	Can view item review	22	view_itemreview
89	Can add cart item	23	add_cartitem
90	Can change cart item	23	change_cartitem
91	Can delete cart item	23	delete_cartitem
92	Can view cart item	23	view_cartitem
93	Can add cart	24	add_cart
94	Can change cart	24	change_cart
95	Can delete cart	24	delete_cart
96	Can view cart	24	view_cart
97	Can add cors model	25	add_corsmodel
98	Can change cors model	25	change_corsmodel
99	Can delete cors model	25	delete_corsmodel
100	Can view cors model	25	view_corsmodel
101	Can add email address	26	add_emailaddress
102	Can change email address	26	change_emailaddress
103	Can delete email address	26	delete_emailaddress
104	Can view email address	26	view_emailaddress
105	Can add email confirmation	27	add_emailconfirmation
106	Can change email confirmation	27	change_emailconfirmation
107	Can delete email confirmation	27	delete_emailconfirmation
108	Can view email confirmation	27	view_emailconfirmation
109	Can add social account	28	add_socialaccount
110	Can change social account	28	change_socialaccount
111	Can delete social account	28	delete_socialaccount
112	Can view social account	28	view_socialaccount
113	Can add social application	29	add_socialapp
114	Can change social application	29	change_socialapp
115	Can delete social application	29	delete_socialapp
116	Can view social application	29	view_socialapp
117	Can add social application token	30	add_socialtoken
118	Can change social application token	30	change_socialtoken
119	Can delete social application token	30	delete_socialtoken
120	Can view social application token	30	view_socialtoken
121	Can add rule	31	add_rule
122	Can change rule	31	change_rule
123	Can delete rule	31	delete_rule
124	Can view rule	31	view_rule
125	Can add url	32	add_url
126	Can change url	32	change_url
127	Can delete url	32	delete_url
128	Can view url	32	view_url
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
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
10	profiles	payment
11	profiles	accountskey
12	drolls	category
13	drolls	drollsexpenses
14	drolls	ingridient
15	drolls	ingridientsub
16	drolls	inventorycategory
17	drolls	item
18	drolls	table
19	drolls	tablecopy
20	drolls	order
21	drolls	itemsub
22	drolls	itemreview
23	drolls	cartitem
24	drolls	cart
25	corsheaders	corsmodel
26	account	emailaddress
27	account	emailconfirmation
28	socialaccount	socialaccount
29	socialaccount	socialapp
30	socialaccount	socialtoken
31	robots	rule
32	robots	url
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-06-22 12:17:04.80116+05:30
2	auth	0001_initial	2021-06-22 12:17:05.182895+05:30
3	account	0001_initial	2021-06-22 12:17:06.220147+05:30
4	account	0002_email_max_length	2021-06-22 12:17:06.512197+05:30
5	admin	0001_initial	2021-06-22 12:17:06.661085+05:30
6	admin	0002_logentry_remove_auto_add	2021-06-22 12:17:06.782267+05:30
7	admin	0003_logentry_add_action_flag_choices	2021-06-22 12:17:06.806549+05:30
8	contenttypes	0002_remove_content_type_name	2021-06-22 12:17:06.834838+05:30
9	auth	0002_alter_permission_name_max_length	2021-06-22 12:17:06.849974+05:30
10	auth	0003_alter_user_email_max_length	2021-06-22 12:17:06.861737+05:30
11	auth	0004_alter_user_username_opts	2021-06-22 12:17:06.872261+05:30
12	auth	0005_alter_user_last_login_null	2021-06-22 12:17:06.881863+05:30
13	auth	0006_require_contenttypes_0002	2021-06-22 12:17:06.887925+05:30
14	auth	0007_alter_validators_add_error_messages	2021-06-22 12:17:06.901573+05:30
15	auth	0008_alter_user_username_max_length	2021-06-22 12:17:06.96286+05:30
16	auth	0009_alter_user_last_name_max_length	2021-06-22 12:17:07.022977+05:30
17	auth	0010_alter_group_name_max_length	2021-06-22 12:17:07.062273+05:30
18	auth	0011_update_proxy_permissions	2021-06-22 12:17:07.072667+05:30
19	corsheaders	0001_initial	2021-06-22 12:17:07.123271+05:30
20	drolls	0001_initial	2021-06-22 12:17:08.725758+05:30
21	profiles	0001_initial	2021-06-22 12:17:10.797331+05:30
22	sites	0001_initial	2021-06-22 12:17:10.931058+05:30
23	robots	0001_initial	2021-06-22 12:17:11.263685+05:30
24	sessions	0001_initial	2021-06-22 12:17:11.857087+05:30
25	sites	0002_alter_domain_unique	2021-06-22 12:17:12.121071+05:30
26	socialaccount	0001_initial	2021-06-22 12:17:12.652211+05:30
27	socialaccount	0002_token_max_lengths	2021-06-22 12:17:12.957485+05:30
28	socialaccount	0003_extra_data_default_dict	2021-06-22 12:17:12.994026+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: drolls_cart; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_cart (id, created, updated, total_price, money_saved, active, cart_bill, cart_status, order_type, payment_status, gst, table_id, user_id) FROM stdin;
\.


--
-- Data for Name: drolls_cart_items; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_cart_items (id, cart_id, cartitem_id) FROM stdin;
\.


--
-- Data for Name: drolls_cartitem; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_cartitem (id, created, updated, item_status, item_price, finished_quantity, quantity, comments, is_finished, discount_price, total_price, item_id) FROM stdin;
\.


--
-- Data for Name: drolls_category; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_category (id, created, updated, title) FROM stdin;
\.


--
-- Data for Name: drolls_drollsexpenses; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_drollsexpenses (id, created, updated, employee_expense, other_expense, electricity_expense, total_expense) FROM stdin;
\.


--
-- Data for Name: drolls_ingridient; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_ingridient (id, created, updated, title, description, minimum_quantity, type) FROM stdin;
\.


--
-- Data for Name: drolls_ingridientsub; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_ingridientsub (id, created, updated, quantity, price, status, expiry_date, main_id) FROM stdin;
\.


--
-- Data for Name: drolls_inventorycategory; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_inventorycategory (id, created, updated, grams, discount, price, status, expiry_date) FROM stdin;
\.


--
-- Data for Name: drolls_item; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_item (id, created, updated, "displayPicture", item_price, discount_price, title, description, category_id) FROM stdin;
\.


--
-- Data for Name: drolls_item_ingridients; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_item_ingridients (id, item_id, itemsub_id) FROM stdin;
\.


--
-- Data for Name: drolls_itemreview; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_itemreview (id, created, updated, comment, item_id) FROM stdin;
\.


--
-- Data for Name: drolls_itemsub; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_itemsub (id, created, updated, grams, ingridient_id) FROM stdin;
\.


--
-- Data for Name: drolls_order; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_order (id, created, updated, arriving_date, order_status, amount, discount) FROM stdin;
\.


--
-- Data for Name: drolls_order_items; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_order_items (id, order_id, ingridientsub_id) FROM stdin;
\.


--
-- Data for Name: drolls_table; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_table (id, created, updated, total_persons, active, qr_code) FROM stdin;
\.


--
-- Data for Name: drolls_tablecopy; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.drolls_tablecopy (id, created, updated, total_persons, active, qr_code) FROM stdin;
\.


--
-- Data for Name: profiles_accountskey; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.profiles_accountskey (id, activation_key, key_expires, "keyType", user_id) FROM stdin;
\.


--
-- Data for Name: profiles_payment; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.profiles_payment (id, status, subscription, order_id, payment_mode, is_received, payment_id, amount, subscription_date, valid_till, is_cash, user_id) FROM stdin;
\.


--
-- Data for Name: profiles_profile; Type: TABLE DATA; Schema: public; Owner: sakthi
--

COPY public.profiles_profile (id, "displayPicture", dob, mobile, pan, "notificationId", address, pincode, state, city, "firstEmergencyContactNo", "secondEmergencyContactNo", occupation, specialization, qualification, uniqueid, "referralCode", "walletCreated", blood_group, "isDpVerified", user_id) FROM stdin;
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 128, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 32, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: drolls_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_cart_id_seq', 1, false);


--
-- Name: drolls_cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_cart_items_id_seq', 1, false);


--
-- Name: drolls_cartitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_cartitem_id_seq', 1, false);


--
-- Name: drolls_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_category_id_seq', 1, false);


--
-- Name: drolls_drollsexpenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_drollsexpenses_id_seq', 1, false);


--
-- Name: drolls_ingridient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_ingridient_id_seq', 1, false);


--
-- Name: drolls_ingridientsub_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_ingridientsub_id_seq', 1, false);


--
-- Name: drolls_inventorycategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_inventorycategory_id_seq', 1, false);


--
-- Name: drolls_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_item_id_seq', 1, false);


--
-- Name: drolls_item_ingridients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_item_ingridients_id_seq', 1, false);


--
-- Name: drolls_itemreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_itemreview_id_seq', 1, false);


--
-- Name: drolls_itemsub_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_itemsub_id_seq', 1, false);


--
-- Name: drolls_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_order_id_seq', 1, false);


--
-- Name: drolls_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_order_items_id_seq', 1, false);


--
-- Name: drolls_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_table_id_seq', 1, false);


--
-- Name: drolls_tablecopy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.drolls_tablecopy_id_seq', 1, false);


--
-- Name: profiles_accountskey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.profiles_accountskey_id_seq', 1, false);


--
-- Name: profiles_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.profiles_payment_id_seq', 1, false);


--
-- Name: profiles_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sakthi
--

SELECT pg_catalog.setval('public.profiles_profile_id_seq', 1, false);


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
-- Name: drolls_cart_items drolls_cart_items_cart_id_cartitem_id_a630e7b5_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cart_items
    ADD CONSTRAINT drolls_cart_items_cart_id_cartitem_id_a630e7b5_uniq UNIQUE (cart_id, cartitem_id);


--
-- Name: drolls_cart_items drolls_cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cart_items
    ADD CONSTRAINT drolls_cart_items_pkey PRIMARY KEY (id);


--
-- Name: drolls_cart drolls_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cart
    ADD CONSTRAINT drolls_cart_pkey PRIMARY KEY (id);


--
-- Name: drolls_cartitem drolls_cartitem_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cartitem
    ADD CONSTRAINT drolls_cartitem_pkey PRIMARY KEY (id);


--
-- Name: drolls_category drolls_category_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_category
    ADD CONSTRAINT drolls_category_pkey PRIMARY KEY (id);


--
-- Name: drolls_drollsexpenses drolls_drollsexpenses_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_drollsexpenses
    ADD CONSTRAINT drolls_drollsexpenses_pkey PRIMARY KEY (id);


--
-- Name: drolls_ingridient drolls_ingridient_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_ingridient
    ADD CONSTRAINT drolls_ingridient_pkey PRIMARY KEY (id);


--
-- Name: drolls_ingridientsub drolls_ingridientsub_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_ingridientsub
    ADD CONSTRAINT drolls_ingridientsub_pkey PRIMARY KEY (id);


--
-- Name: drolls_inventorycategory drolls_inventorycategory_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_inventorycategory
    ADD CONSTRAINT drolls_inventorycategory_pkey PRIMARY KEY (id);


--
-- Name: drolls_item_ingridients drolls_item_ingridients_item_id_itemsub_id_0e5dd388_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_item_ingridients
    ADD CONSTRAINT drolls_item_ingridients_item_id_itemsub_id_0e5dd388_uniq UNIQUE (item_id, itemsub_id);


--
-- Name: drolls_item_ingridients drolls_item_ingridients_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_item_ingridients
    ADD CONSTRAINT drolls_item_ingridients_pkey PRIMARY KEY (id);


--
-- Name: drolls_item drolls_item_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_item
    ADD CONSTRAINT drolls_item_pkey PRIMARY KEY (id);


--
-- Name: drolls_itemreview drolls_itemreview_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_itemreview
    ADD CONSTRAINT drolls_itemreview_pkey PRIMARY KEY (id);


--
-- Name: drolls_itemsub drolls_itemsub_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_itemsub
    ADD CONSTRAINT drolls_itemsub_pkey PRIMARY KEY (id);


--
-- Name: drolls_order_items drolls_order_items_order_id_ingridientsub_id_af9d3a10_uniq; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_order_items
    ADD CONSTRAINT drolls_order_items_order_id_ingridientsub_id_af9d3a10_uniq UNIQUE (order_id, ingridientsub_id);


--
-- Name: drolls_order_items drolls_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_order_items
    ADD CONSTRAINT drolls_order_items_pkey PRIMARY KEY (id);


--
-- Name: drolls_order drolls_order_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_order
    ADD CONSTRAINT drolls_order_pkey PRIMARY KEY (id);


--
-- Name: drolls_table drolls_table_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_table
    ADD CONSTRAINT drolls_table_pkey PRIMARY KEY (id);


--
-- Name: drolls_tablecopy drolls_tablecopy_pkey; Type: CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_tablecopy
    ADD CONSTRAINT drolls_tablecopy_pkey PRIMARY KEY (id);


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
-- Name: drolls_cart_items_cart_id_786336d3; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_cart_items_cart_id_786336d3 ON public.drolls_cart_items USING btree (cart_id);


--
-- Name: drolls_cart_items_cartitem_id_8fa7cf83; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_cart_items_cartitem_id_8fa7cf83 ON public.drolls_cart_items USING btree (cartitem_id);


--
-- Name: drolls_cart_table_id_31813d1f; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_cart_table_id_31813d1f ON public.drolls_cart USING btree (table_id);


--
-- Name: drolls_cart_user_id_ededcfef; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_cart_user_id_ededcfef ON public.drolls_cart USING btree (user_id);


--
-- Name: drolls_cartitem_item_id_9c81c79a; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_cartitem_item_id_9c81c79a ON public.drolls_cartitem USING btree (item_id);


--
-- Name: drolls_ingridientsub_main_id_8badcc92; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_ingridientsub_main_id_8badcc92 ON public.drolls_ingridientsub USING btree (main_id);


--
-- Name: drolls_item_category_id_94577efb; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_item_category_id_94577efb ON public.drolls_item USING btree (category_id);


--
-- Name: drolls_item_ingridients_item_id_486d9222; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_item_ingridients_item_id_486d9222 ON public.drolls_item_ingridients USING btree (item_id);


--
-- Name: drolls_item_ingridients_itemsub_id_bd0c6ec9; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_item_ingridients_itemsub_id_bd0c6ec9 ON public.drolls_item_ingridients USING btree (itemsub_id);


--
-- Name: drolls_itemreview_item_id_990060fb; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_itemreview_item_id_990060fb ON public.drolls_itemreview USING btree (item_id);


--
-- Name: drolls_itemsub_ingridient_id_b2ebc146; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_itemsub_ingridient_id_b2ebc146 ON public.drolls_itemsub USING btree (ingridient_id);


--
-- Name: drolls_order_items_ingridientsub_id_0b820e17; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_order_items_ingridientsub_id_0b820e17 ON public.drolls_order_items USING btree (ingridientsub_id);


--
-- Name: drolls_order_items_order_id_94663ace; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX drolls_order_items_order_id_94663ace ON public.drolls_order_items USING btree (order_id);


--
-- Name: profiles_accountskey_user_id_78884aee; Type: INDEX; Schema: public; Owner: sakthi
--

CREATE INDEX profiles_accountskey_user_id_78884aee ON public.profiles_accountskey USING btree (user_id);


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
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: drolls_cart_items drolls_cart_items_cart_id_786336d3_fk_drolls_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cart_items
    ADD CONSTRAINT drolls_cart_items_cart_id_786336d3_fk_drolls_cart_id FOREIGN KEY (cart_id) REFERENCES public.drolls_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_cart_items drolls_cart_items_cartitem_id_8fa7cf83_fk_drolls_cartitem_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cart_items
    ADD CONSTRAINT drolls_cart_items_cartitem_id_8fa7cf83_fk_drolls_cartitem_id FOREIGN KEY (cartitem_id) REFERENCES public.drolls_cartitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_cart drolls_cart_table_id_31813d1f_fk_drolls_table_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cart
    ADD CONSTRAINT drolls_cart_table_id_31813d1f_fk_drolls_table_id FOREIGN KEY (table_id) REFERENCES public.drolls_table(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_cart drolls_cart_user_id_ededcfef_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cart
    ADD CONSTRAINT drolls_cart_user_id_ededcfef_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_cartitem drolls_cartitem_item_id_9c81c79a_fk_drolls_item_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_cartitem
    ADD CONSTRAINT drolls_cartitem_item_id_9c81c79a_fk_drolls_item_id FOREIGN KEY (item_id) REFERENCES public.drolls_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_ingridientsub drolls_ingridientsub_main_id_8badcc92_fk_drolls_ingridient_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_ingridientsub
    ADD CONSTRAINT drolls_ingridientsub_main_id_8badcc92_fk_drolls_ingridient_id FOREIGN KEY (main_id) REFERENCES public.drolls_ingridient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_item drolls_item_category_id_94577efb_fk_drolls_category_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_item
    ADD CONSTRAINT drolls_item_category_id_94577efb_fk_drolls_category_id FOREIGN KEY (category_id) REFERENCES public.drolls_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_item_ingridients drolls_item_ingridie_itemsub_id_bd0c6ec9_fk_drolls_it; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_item_ingridients
    ADD CONSTRAINT drolls_item_ingridie_itemsub_id_bd0c6ec9_fk_drolls_it FOREIGN KEY (itemsub_id) REFERENCES public.drolls_itemsub(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_item_ingridients drolls_item_ingridients_item_id_486d9222_fk_drolls_item_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_item_ingridients
    ADD CONSTRAINT drolls_item_ingridients_item_id_486d9222_fk_drolls_item_id FOREIGN KEY (item_id) REFERENCES public.drolls_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_itemreview drolls_itemreview_item_id_990060fb_fk_drolls_item_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_itemreview
    ADD CONSTRAINT drolls_itemreview_item_id_990060fb_fk_drolls_item_id FOREIGN KEY (item_id) REFERENCES public.drolls_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_itemsub drolls_itemsub_ingridient_id_b2ebc146_fk_drolls_ingridient_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_itemsub
    ADD CONSTRAINT drolls_itemsub_ingridient_id_b2ebc146_fk_drolls_ingridient_id FOREIGN KEY (ingridient_id) REFERENCES public.drolls_ingridient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_order_items drolls_order_items_ingridientsub_id_0b820e17_fk_drolls_in; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_order_items
    ADD CONSTRAINT drolls_order_items_ingridientsub_id_0b820e17_fk_drolls_in FOREIGN KEY (ingridientsub_id) REFERENCES public.drolls_ingridientsub(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drolls_order_items drolls_order_items_order_id_94663ace_fk_drolls_order_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.drolls_order_items
    ADD CONSTRAINT drolls_order_items_order_id_94663ace_fk_drolls_order_id FOREIGN KEY (order_id) REFERENCES public.drolls_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_accountskey profiles_accountskey_user_id_78884aee_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.profiles_accountskey
    ADD CONSTRAINT profiles_accountskey_user_id_78884aee_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: robots_rule_allowed robots_rule_allowed_rule_id_aa90358c_fk_robots_rule_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_allowed
    ADD CONSTRAINT robots_rule_allowed_rule_id_aa90358c_fk_robots_rule_id FOREIGN KEY (rule_id) REFERENCES public.robots_rule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: robots_rule_allowed robots_rule_allowed_url_id_6157f60a_fk_robots_url_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_allowed
    ADD CONSTRAINT robots_rule_allowed_url_id_6157f60a_fk_robots_url_id FOREIGN KEY (url_id) REFERENCES public.robots_url(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: robots_rule_disallowed robots_rule_disallowed_rule_id_fad7328c_fk_robots_rule_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_disallowed
    ADD CONSTRAINT robots_rule_disallowed_rule_id_fad7328c_fk_robots_rule_id FOREIGN KEY (rule_id) REFERENCES public.robots_rule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: robots_rule_disallowed robots_rule_disallowed_url_id_8e02db92_fk_robots_url_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_disallowed
    ADD CONSTRAINT robots_rule_disallowed_url_id_8e02db92_fk_robots_url_id FOREIGN KEY (url_id) REFERENCES public.robots_url(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: robots_rule_sites robots_rule_sites_rule_id_7921a799_fk_robots_rule_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_sites
    ADD CONSTRAINT robots_rule_sites_rule_id_7921a799_fk_robots_rule_id FOREIGN KEY (rule_id) REFERENCES public.robots_rule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: robots_rule_sites robots_rule_sites_site_id_efe5be97_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.robots_rule_sites
    ADD CONSTRAINT robots_rule_sites_site_id_efe5be97_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sakthi
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

