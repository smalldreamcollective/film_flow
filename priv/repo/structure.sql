--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Homebrew)
-- Dumped by pg_dump version 14.17 (Homebrew)

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
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aperture; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aperture (
    id bigint NOT NULL,
    value character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: aperture_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.aperture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aperture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.aperture_id_seq OWNED BY public.aperture.id;


--
-- Name: cameras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cameras (
    id bigint NOT NULL,
    name character varying(255),
    model character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    manufacturer bigint,
    manufacturer_id bigint
);


--
-- Name: cameras_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cameras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cameras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cameras_id_seq OWNED BY public.cameras.id;


--
-- Name: exposure_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exposure_records (
    id bigint NOT NULL,
    reference_id character varying(255),
    project_name character varying(255),
    date_loaded timestamp(0) without time zone,
    date_exposed timestamp(0) without time zone,
    concept text,
    photographer bigint,
    location bigint,
    film bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: exposure_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exposure_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exposure_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exposure_records_id_seq OWNED BY public.exposure_records.id;


--
-- Name: exposures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exposures (
    id bigint NOT NULL,
    frame integer,
    subject text,
    date_exposed timestamp(0) without time zone,
    lighting_condition text,
    notes text,
    exposure_record bigint,
    location bigint,
    shutter_speed bigint,
    camera bigint,
    zone bigint,
    lens bigint,
    filter bigint,
    tripod bigint,
    holder bigint,
    film_back bigint,
    film_roll bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: exposures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exposures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exposures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exposures_id_seq OWNED BY public.exposures.id;


--
-- Name: film; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.film (
    id bigint NOT NULL,
    name character varying(255),
    description text,
    manufacturer bigint,
    film_type bigint,
    format bigint,
    iso bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: film_backs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.film_backs (
    id bigint NOT NULL,
    model character varying(255),
    description text,
    years character varying(255),
    url_manual character varying(255),
    url_additional_info character varying(255),
    manufacturer bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: film_backs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.film_backs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: film_backs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.film_backs_id_seq OWNED BY public.film_backs.id;


--
-- Name: film_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.film_id_seq OWNED BY public.film.id;


--
-- Name: film_rolls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.film_rolls (
    id bigint NOT NULL,
    reference_id character varying(255),
    name character varying(255),
    frames integer,
    expirate_date timestamp(0) without time zone,
    description text,
    manufacturer bigint,
    film_type bigint,
    format bigint,
    iso bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: film_rolls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.film_rolls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: film_rolls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.film_rolls_id_seq OWNED BY public.film_rolls.id;


--
-- Name: film_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.film_type (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: film_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.film_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: film_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.film_type_id_seq OWNED BY public.film_type.id;


--
-- Name: filters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.filters (
    id bigint NOT NULL,
    model character varying(255),
    description text,
    years character varying(255),
    url_manual character varying(255),
    url_additional_info character varying(255),
    manufacturer bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: filters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.filters_id_seq OWNED BY public.filters.id;


--
-- Name: format; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.format (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: format_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.format_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: format_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.format_id_seq OWNED BY public.format.id;


--
-- Name: holders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.holders (
    id bigint NOT NULL,
    model character varying(255),
    description text,
    years character varying(255),
    url_manual character varying(255),
    url_additional_info character varying(255),
    manufacturer bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: holders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.holders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: holders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.holders_id_seq OWNED BY public.holders.id;


--
-- Name: iso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.iso (
    id bigint NOT NULL,
    value character varying(255),
    description character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: iso_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.iso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: iso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.iso_id_seq OWNED BY public.iso.id;


--
-- Name: lenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lenses (
    id bigint NOT NULL,
    model character varying(255),
    description text,
    years character varying(255),
    url_manual character varying(255),
    url_additional_info character varying(255),
    manufacturer_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: lenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lenses_id_seq OWNED BY public.lenses.id;


--
-- Name: light_conditions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.light_conditions (
    id bigint NOT NULL,
    name character varying(255),
    description text,
    url_icon character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: light_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.light_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: light_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.light_conditions_id_seq OWNED BY public.light_conditions.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    name character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.manufacturers (
    id bigint NOT NULL,
    name character varying(255),
    url character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: manufacturers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: manufacturers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.manufacturers_id_seq OWNED BY public.manufacturers.id;


--
-- Name: photographers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.photographers (
    id bigint NOT NULL,
    first_name character varying(255),
    middle_name character varying(255),
    last_name character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: photographers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.photographers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: photographers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.photographers_id_seq OWNED BY public.photographers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: shutter_speed; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shutter_speed (
    id bigint NOT NULL,
    value character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: shutter_speed_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shutter_speed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shutter_speed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shutter_speed_id_seq OWNED BY public.shutter_speed.id;


--
-- Name: tripods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tripods (
    id bigint NOT NULL,
    model character varying(255),
    description text,
    years character varying(255),
    url_manual character varying(255),
    url_addtional_info character varying(255),
    manufacture bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    manufacturer_id bigint
);


--
-- Name: tripods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tripods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tripods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tripods_id_seq OWNED BY public.tripods.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email public.citext NOT NULL,
    hashed_password character varying(255) NOT NULL,
    confirmed_at timestamp(0) without time zone,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
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
-- Name: users_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_tokens (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    token bytea NOT NULL,
    context character varying(255) NOT NULL,
    sent_to character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL
);


--
-- Name: users_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_tokens_id_seq OWNED BY public.users_tokens.id;


--
-- Name: zones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zones (
    id bigint NOT NULL,
    name character varying(255),
    description text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zones_id_seq OWNED BY public.zones.id;


--
-- Name: aperture id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aperture ALTER COLUMN id SET DEFAULT nextval('public.aperture_id_seq'::regclass);


--
-- Name: cameras id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cameras ALTER COLUMN id SET DEFAULT nextval('public.cameras_id_seq'::regclass);


--
-- Name: exposure_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposure_records ALTER COLUMN id SET DEFAULT nextval('public.exposure_records_id_seq'::regclass);


--
-- Name: exposures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures ALTER COLUMN id SET DEFAULT nextval('public.exposures_id_seq'::regclass);


--
-- Name: film id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film ALTER COLUMN id SET DEFAULT nextval('public.film_id_seq'::regclass);


--
-- Name: film_backs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film_backs ALTER COLUMN id SET DEFAULT nextval('public.film_backs_id_seq'::regclass);


--
-- Name: film_rolls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film_rolls ALTER COLUMN id SET DEFAULT nextval('public.film_rolls_id_seq'::regclass);


--
-- Name: film_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film_type ALTER COLUMN id SET DEFAULT nextval('public.film_type_id_seq'::regclass);


--
-- Name: filters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.filters ALTER COLUMN id SET DEFAULT nextval('public.filters_id_seq'::regclass);


--
-- Name: format id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.format ALTER COLUMN id SET DEFAULT nextval('public.format_id_seq'::regclass);


--
-- Name: holders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.holders ALTER COLUMN id SET DEFAULT nextval('public.holders_id_seq'::regclass);


--
-- Name: iso id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.iso ALTER COLUMN id SET DEFAULT nextval('public.iso_id_seq'::regclass);


--
-- Name: lenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lenses ALTER COLUMN id SET DEFAULT nextval('public.lenses_id_seq'::regclass);


--
-- Name: light_conditions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.light_conditions ALTER COLUMN id SET DEFAULT nextval('public.light_conditions_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: manufacturers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.manufacturers ALTER COLUMN id SET DEFAULT nextval('public.manufacturers_id_seq'::regclass);


--
-- Name: photographers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photographers ALTER COLUMN id SET DEFAULT nextval('public.photographers_id_seq'::regclass);


--
-- Name: shutter_speed id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shutter_speed ALTER COLUMN id SET DEFAULT nextval('public.shutter_speed_id_seq'::regclass);


--
-- Name: tripods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tripods ALTER COLUMN id SET DEFAULT nextval('public.tripods_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_tokens ALTER COLUMN id SET DEFAULT nextval('public.users_tokens_id_seq'::regclass);


--
-- Name: zones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones ALTER COLUMN id SET DEFAULT nextval('public.zones_id_seq'::regclass);


--
-- Name: aperture aperture_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aperture
    ADD CONSTRAINT aperture_pkey PRIMARY KEY (id);


--
-- Name: cameras cameras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cameras
    ADD CONSTRAINT cameras_pkey PRIMARY KEY (id);


--
-- Name: exposure_records exposure_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposure_records
    ADD CONSTRAINT exposure_records_pkey PRIMARY KEY (id);


--
-- Name: exposures exposures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_pkey PRIMARY KEY (id);


--
-- Name: film_backs film_backs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film_backs
    ADD CONSTRAINT film_backs_pkey PRIMARY KEY (id);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- Name: film_rolls film_rolls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film_rolls
    ADD CONSTRAINT film_rolls_pkey PRIMARY KEY (id);


--
-- Name: film_type film_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film_type
    ADD CONSTRAINT film_type_pkey PRIMARY KEY (id);


--
-- Name: filters filters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (id);


--
-- Name: format format_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.format
    ADD CONSTRAINT format_pkey PRIMARY KEY (id);


--
-- Name: holders holders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.holders
    ADD CONSTRAINT holders_pkey PRIMARY KEY (id);


--
-- Name: iso iso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.iso
    ADD CONSTRAINT iso_pkey PRIMARY KEY (id);


--
-- Name: lenses lenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lenses
    ADD CONSTRAINT lenses_pkey PRIMARY KEY (id);


--
-- Name: light_conditions light_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.light_conditions
    ADD CONSTRAINT light_conditions_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


--
-- Name: photographers photographers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photographers
    ADD CONSTRAINT photographers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: shutter_speed shutter_speed_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shutter_speed
    ADD CONSTRAINT shutter_speed_pkey PRIMARY KEY (id);


--
-- Name: tripods tripods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tripods
    ADD CONSTRAINT tripods_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_tokens users_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_tokens
    ADD CONSTRAINT users_tokens_pkey PRIMARY KEY (id);


--
-- Name: zones zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- Name: cameras_manufacturer_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cameras_manufacturer_id_index ON public.cameras USING btree (manufacturer_id);


--
-- Name: cameras_manufacturer_ref_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cameras_manufacturer_ref_index ON public.cameras USING btree (manufacturer);


--
-- Name: exposure_records_film_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposure_records_film_index ON public.exposure_records USING btree (film);


--
-- Name: exposure_records_location_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposure_records_location_index ON public.exposure_records USING btree (location);


--
-- Name: exposure_records_photographer_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposure_records_photographer_index ON public.exposure_records USING btree (photographer);


--
-- Name: exposures_camera_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposures_camera_index ON public.exposures USING btree (camera);


--
-- Name: exposures_exposure_record_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposures_exposure_record_index ON public.exposures USING btree (exposure_record);


--
-- Name: exposures_film_back_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposures_film_back_index ON public.exposures USING btree (film_back);


--
-- Name: exposures_film_roll_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposures_film_roll_index ON public.exposures USING btree (film_roll);


--
-- Name: exposures_filter_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposures_filter_index ON public.exposures USING btree (filter);


--
-- Name: exposures_holder_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposures_holder_index ON public.exposures USING btree (holder);


--
-- Name: exposures_lens_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposures_lens_index ON public.exposures USING btree (lens);


--
-- Name: exposures_location_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposures_location_index ON public.exposures USING btree (location);


--
-- Name: exposures_shutter_speed_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposures_shutter_speed_index ON public.exposures USING btree (shutter_speed);


--
-- Name: exposures_tripod_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposures_tripod_index ON public.exposures USING btree (tripod);


--
-- Name: exposures_zone_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exposures_zone_index ON public.exposures USING btree (zone);


--
-- Name: film_backs_manufacturer_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX film_backs_manufacturer_index ON public.film_backs USING btree (manufacturer);


--
-- Name: film_film_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX film_film_type_index ON public.film USING btree (film_type);


--
-- Name: film_format_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX film_format_index ON public.film USING btree (format);


--
-- Name: film_iso_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX film_iso_index ON public.film USING btree (iso);


--
-- Name: film_manufacturer_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX film_manufacturer_index ON public.film USING btree (manufacturer);


--
-- Name: film_rolls_film_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX film_rolls_film_type_index ON public.film_rolls USING btree (film_type);


--
-- Name: film_rolls_format_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX film_rolls_format_index ON public.film_rolls USING btree (format);


--
-- Name: film_rolls_iso_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX film_rolls_iso_index ON public.film_rolls USING btree (iso);


--
-- Name: film_rolls_manufacturer_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX film_rolls_manufacturer_index ON public.film_rolls USING btree (manufacturer);


--
-- Name: filters_manufacturer_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX filters_manufacturer_index ON public.filters USING btree (manufacturer);


--
-- Name: holders_manufacturer_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX holders_manufacturer_index ON public.holders USING btree (manufacturer);


--
-- Name: lenses_manufacturer_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lenses_manufacturer_id_index ON public.lenses USING btree (manufacturer_id);


--
-- Name: tripods_manufacture_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tripods_manufacture_index ON public.tripods USING btree (manufacture);


--
-- Name: tripods_manufacturer_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tripods_manufacturer_id_index ON public.tripods USING btree (manufacturer_id);


--
-- Name: users_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_email_index ON public.users USING btree (email);


--
-- Name: users_tokens_context_token_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_tokens_context_token_index ON public.users_tokens USING btree (context, token);


--
-- Name: users_tokens_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_tokens_user_id_index ON public.users_tokens USING btree (user_id);


--
-- Name: cameras cameras_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cameras
    ADD CONSTRAINT cameras_manufacturer_id_fkey FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(id);


--
-- Name: cameras cameras_manufacturer_ref_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cameras
    ADD CONSTRAINT cameras_manufacturer_ref_fkey FOREIGN KEY (manufacturer) REFERENCES public.manufacturers(id);


--
-- Name: exposure_records exposure_records_film_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposure_records
    ADD CONSTRAINT exposure_records_film_fkey FOREIGN KEY (film) REFERENCES public.film(id);


--
-- Name: exposure_records exposure_records_location_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposure_records
    ADD CONSTRAINT exposure_records_location_fkey FOREIGN KEY (location) REFERENCES public.locations(id);


--
-- Name: exposure_records exposure_records_photographer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposure_records
    ADD CONSTRAINT exposure_records_photographer_fkey FOREIGN KEY (photographer) REFERENCES public.photographers(id);


--
-- Name: exposures exposures_camera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_camera_fkey FOREIGN KEY (camera) REFERENCES public.cameras(id);


--
-- Name: exposures exposures_exposure_record_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_exposure_record_fkey FOREIGN KEY (exposure_record) REFERENCES public.exposure_records(id);


--
-- Name: exposures exposures_film_back_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_film_back_fkey FOREIGN KEY (film_back) REFERENCES public.film_backs(id);


--
-- Name: exposures exposures_film_roll_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_film_roll_fkey FOREIGN KEY (film_roll) REFERENCES public.film_rolls(id);


--
-- Name: exposures exposures_filter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_filter_fkey FOREIGN KEY (filter) REFERENCES public.filters(id);


--
-- Name: exposures exposures_holder_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_holder_fkey FOREIGN KEY (holder) REFERENCES public.holders(id);


--
-- Name: exposures exposures_lens_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_lens_fkey FOREIGN KEY (lens) REFERENCES public.lenses(id);


--
-- Name: exposures exposures_location_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_location_fkey FOREIGN KEY (location) REFERENCES public.locations(id);


--
-- Name: exposures exposures_shutter_speed_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_shutter_speed_fkey FOREIGN KEY (shutter_speed) REFERENCES public.shutter_speed(id);


--
-- Name: exposures exposures_tripod_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_tripod_fkey FOREIGN KEY (tripod) REFERENCES public.tripods(id);


--
-- Name: exposures exposures_zone_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposures
    ADD CONSTRAINT exposures_zone_fkey FOREIGN KEY (zone) REFERENCES public.zones(id);


--
-- Name: film_backs film_backs_manufacturer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film_backs
    ADD CONSTRAINT film_backs_manufacturer_fkey FOREIGN KEY (manufacturer) REFERENCES public.manufacturers(id);


--
-- Name: film film_film_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_film_type_fkey FOREIGN KEY (film_type) REFERENCES public.film_type(id);


--
-- Name: film film_format_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_format_fkey FOREIGN KEY (format) REFERENCES public.format(id);


--
-- Name: film film_iso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_iso_fkey FOREIGN KEY (iso) REFERENCES public.iso(id);


--
-- Name: film film_manufacturer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_manufacturer_fkey FOREIGN KEY (manufacturer) REFERENCES public.manufacturers(id);


--
-- Name: film_rolls film_rolls_film_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film_rolls
    ADD CONSTRAINT film_rolls_film_type_fkey FOREIGN KEY (film_type) REFERENCES public.film_type(id);


--
-- Name: film_rolls film_rolls_format_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film_rolls
    ADD CONSTRAINT film_rolls_format_fkey FOREIGN KEY (format) REFERENCES public.format(id);


--
-- Name: film_rolls film_rolls_iso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film_rolls
    ADD CONSTRAINT film_rolls_iso_fkey FOREIGN KEY (iso) REFERENCES public.iso(id);


--
-- Name: film_rolls film_rolls_manufacturer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.film_rolls
    ADD CONSTRAINT film_rolls_manufacturer_fkey FOREIGN KEY (manufacturer) REFERENCES public.manufacturers(id);


--
-- Name: filters filters_manufacturer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_manufacturer_fkey FOREIGN KEY (manufacturer) REFERENCES public.manufacturers(id);


--
-- Name: holders holders_manufacturer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.holders
    ADD CONSTRAINT holders_manufacturer_fkey FOREIGN KEY (manufacturer) REFERENCES public.manufacturers(id);


--
-- Name: lenses lenses_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lenses
    ADD CONSTRAINT lenses_manufacturer_id_fkey FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(id);


--
-- Name: tripods tripods_manufacture_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tripods
    ADD CONSTRAINT tripods_manufacture_fkey FOREIGN KEY (manufacture) REFERENCES public.manufacturers(id);


--
-- Name: tripods tripods_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tripods
    ADD CONSTRAINT tripods_manufacturer_id_fkey FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(id);


--
-- Name: users_tokens users_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_tokens
    ADD CONSTRAINT users_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

INSERT INTO public."schema_migrations" (version) VALUES (20240320014228);
INSERT INTO public."schema_migrations" (version) VALUES (20240321183144);
INSERT INTO public."schema_migrations" (version) VALUES (20240417171609);
INSERT INTO public."schema_migrations" (version) VALUES (20240418015000);
INSERT INTO public."schema_migrations" (version) VALUES (20240422180336);
INSERT INTO public."schema_migrations" (version) VALUES (20240422181601);
INSERT INTO public."schema_migrations" (version) VALUES (20240422183433);
INSERT INTO public."schema_migrations" (version) VALUES (20240422184912);
INSERT INTO public."schema_migrations" (version) VALUES (20240422185816);
INSERT INTO public."schema_migrations" (version) VALUES (20240422190807);
INSERT INTO public."schema_migrations" (version) VALUES (20240422204850);
INSERT INTO public."schema_migrations" (version) VALUES (20240422212517);
INSERT INTO public."schema_migrations" (version) VALUES (20240422213806);
INSERT INTO public."schema_migrations" (version) VALUES (20240422214809);
INSERT INTO public."schema_migrations" (version) VALUES (20240422215744);
INSERT INTO public."schema_migrations" (version) VALUES (20240422220723);
INSERT INTO public."schema_migrations" (version) VALUES (20240422221503);
INSERT INTO public."schema_migrations" (version) VALUES (20240422222138);
INSERT INTO public."schema_migrations" (version) VALUES (20240422223112);
INSERT INTO public."schema_migrations" (version) VALUES (20240422224522);
INSERT INTO public."schema_migrations" (version) VALUES (20240422230437);
INSERT INTO public."schema_migrations" (version) VALUES (20250504222211);
INSERT INTO public."schema_migrations" (version) VALUES (20250505004536);
INSERT INTO public."schema_migrations" (version) VALUES (20250505012345);
INSERT INTO public."schema_migrations" (version) VALUES (20250505013000);
INSERT INTO public."schema_migrations" (version) VALUES (20250505014000);
