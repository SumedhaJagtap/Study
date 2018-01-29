--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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

SET default_with_oids = true;

--
-- Name: barcode; Type: TABLE; Schema: public; Owner: sumedha
--

CREATE TABLE barcode (
    barcode_ean character(13) NOT NULL,
    item_id integer NOT NULL
);


ALTER TABLE barcode OWNER TO sumedha;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: sumedha
--

CREATE TABLE customer (
    customer_id integer NOT NULL,
    title character(4),
    fname character varying(32),
    lname character varying(32) NOT NULL,
    addressline character varying(64),
    town character varying(32),
    zipcode character(10) NOT NULL,
    phone character varying(16)
);


ALTER TABLE customer OWNER TO sumedha;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: sumedha
--

CREATE SEQUENCE customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customer_customer_id_seq OWNER TO sumedha;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sumedha
--

ALTER SEQUENCE customer_customer_id_seq OWNED BY customer.customer_id;


--
-- Name: item; Type: TABLE; Schema: public; Owner: sumedha
--

CREATE TABLE item (
    item_id integer NOT NULL,
    description character varying(64) NOT NULL,
    cost_price numeric(7,2),
    sell_price numeric(7,2)
);


ALTER TABLE item OWNER TO sumedha;

--
-- Name: item_item_id_seq; Type: SEQUENCE; Schema: public; Owner: sumedha
--

CREATE SEQUENCE item_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_item_id_seq OWNER TO sumedha;

--
-- Name: item_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sumedha
--

ALTER SEQUENCE item_item_id_seq OWNED BY item.item_id;


SET default_with_oids = false;

--
-- Name: mytable; Type: TABLE; Schema: public; Owner: sumedha
--

CREATE TABLE mytable (
    customer_id integer,
    title character(4),
    fname character varying(32),
    lname character varying(32),
    addressline character varying(64),
    town character varying(32),
    zipcode character(10),
    phone character varying(16)
);


ALTER TABLE mytable OWNER TO sumedha;

SET default_with_oids = true;

--
-- Name: orderinfo; Type: TABLE; Schema: public; Owner: sumedha
--

CREATE TABLE orderinfo (
    orderinfo_id integer NOT NULL,
    customer_id integer NOT NULL,
    date_placed date NOT NULL,
    date_shipped date,
    shipping numeric(7,2)
);


ALTER TABLE orderinfo OWNER TO sumedha;

--
-- Name: orderinfo_orderinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: sumedha
--

CREATE SEQUENCE orderinfo_orderinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orderinfo_orderinfo_id_seq OWNER TO sumedha;

--
-- Name: orderinfo_orderinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sumedha
--

ALTER SEQUENCE orderinfo_orderinfo_id_seq OWNED BY orderinfo.orderinfo_id;


--
-- Name: orderline; Type: TABLE; Schema: public; Owner: sumedha
--

CREATE TABLE orderline (
    orderinfo_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE orderline OWNER TO sumedha;

--
-- Name: stock; Type: TABLE; Schema: public; Owner: sumedha
--

CREATE TABLE stock (
    item_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE stock OWNER TO sumedha;

--
-- Name: customer_id; Type: DEFAULT; Schema: public; Owner: sumedha
--

ALTER TABLE ONLY customer ALTER COLUMN customer_id SET DEFAULT nextval('customer_customer_id_seq'::regclass);


--
-- Name: item_id; Type: DEFAULT; Schema: public; Owner: sumedha
--

ALTER TABLE ONLY item ALTER COLUMN item_id SET DEFAULT nextval('item_item_id_seq'::regclass);


--
-- Name: orderinfo_id; Type: DEFAULT; Schema: public; Owner: sumedha
--

ALTER TABLE ONLY orderinfo ALTER COLUMN orderinfo_id SET DEFAULT nextval('orderinfo_orderinfo_id_seq'::regclass);


--
-- Data for Name: barcode; Type: TABLE DATA; Schema: public; Owner: sumedha
--

COPY barcode (barcode_ean, item_id) FROM stdin;
6241527836173	1
6241574635234	2
6264537836173	3
6241527746363	3
7465743843764	4
3453458677628	5
6434564564544	6
8476736836876	7
6241234586487	8
9473625532534	8
9473627464543	8
4587263646878	9
9879879837489	11
2239872376872	11
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: sumedha
--

COPY customer (customer_id, title, fname, lname, addressline, town, zipcode, phone) FROM stdin;
1	Miss	Jenny	Stones	27 Rowan Avenue	Hightown	NT2 1AQ   	023 9876
2	Mr  	Andrew	Stones	52 The Willows	Lowtown	LT5 7RA   	876 3527
3	Miss	Alex	Matthew	4 The Street	Nicetown	NT2 2TX   	010 4567
4	Mr  	Adrian	Matthew	The Barn	Yuleville	YV67 2WR  	487 3871
5	Mr  	Simon	Cozens	7 Shady Lane	Oakenham	OA3 6QW   	514 5926
6	Mr  	Neil	Matthew	5 Pasture Lane	Nicetown	NT3 7RT   	267 1232
8	Mrs 	Ann	Stones	34 Holly Way	Bingham	BG4 2WE   	342 5982
9	Mrs 	Christine	Hickman	36 Queen Street	Histon	HT3 5EM   	342 5432
10	Mr  	Mike	Howard	86 Dysart Street	Tibsville	TB3 7FG   	505 5482
11	Mr  	Dave	Jones	54 Vale Rise	Bingham	BG3 8GD   	342 8264
12	Mr  	Richard	Neill	42 Thatched Way	Winersby	WB3 6GQ   	505 6482
13	Mrs 	Laura	Hardy	73 Margarita Way	Oxbridge	OX2 3HX   	821 2335
14	Mr  	Bill	O'Neill	2 Beamer Street	Welltown	WT3 8GM   	435 1234
15	Mr  	David	Hudson	4 The Square	Milltown	MT2 6RT   	961 4526
16	\N	asdf	weqe	\N	\N	422011    	\N
\.


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sumedha
--

SELECT pg_catalog.setval('customer_customer_id_seq', 16, true);


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: sumedha
--

COPY item (item_id, description, cost_price, sell_price) FROM stdin;
1	Wood Puzzle	15.23	21.95
2	Rubik Cube	7.45	11.49
3	Linux CD	1.99	2.49
4	Tissues	2.11	3.99
5	Picture Frame	7.54	9.95
6	Fan Small	9.23	15.75
7	Fan Large	13.36	19.95
8	Toothbrush	0.75	1.45
9	Roman Coin	2.34	2.45
10	Carrier Bag	0.01	0.00
11	Speakers	19.73	25.32
\.


--
-- Name: item_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sumedha
--

SELECT pg_catalog.setval('item_item_id_seq', 11, true);


--
-- Data for Name: mytable; Type: TABLE DATA; Schema: public; Owner: sumedha
--

COPY mytable (customer_id, title, fname, lname, addressline, town, zipcode, phone) FROM stdin;
1	Miss	Jenny	Stones	27 Rowan Avenue	Hightown	NT2 1AQ   	023 9876
2	Mr  	Andrew	Stones	52 The Willows	Lowtown	LT5 7RA   	876 3527
3	Miss	Alex	Matthew	4 The Street	Nicetown	NT2 2TX   	010 4567
4	Mr  	Adrian	Matthew	The Barn	Yuleville	YV67 2WR  	487 3871
5	Mr  	Simon	Cozens	7 Shady Lane	Oakenham	OA3 6QW   	514 5926
6	Mr  	Neil	Matthew	5 Pasture Lane	Nicetown	NT3 7RT   	267 1232
8	Mrs 	Ann	Stones	34 Holly Way	Bingham	BG4 2WE   	342 5982
9	Mrs 	Christine	Hickman	36 Queen Street	Histon	HT3 5EM   	342 5432
10	Mr  	Mike	Howard	86 Dysart Street	Tibsville	TB3 7FG   	505 5482
11	Mr  	Dave	Jones	54 Vale Rise	Bingham	BG3 8GD   	342 8264
12	Mr  	Richard	Neill	42 Thatched Way	Winersby	WB3 6GQ   	505 6482
13	Mrs 	Laura	Hardy	73 Margarita Way	Oxbridge	OX2 3HX   	821 2335
14	Mr  	Bill	O'Neill	2 Beamer Street	Welltown	WT3 8GM   	435 1234
15	Mr  	David	Hudson	4 The Square	Milltown	MT2 6RT   	961 4526
16	\N	asdf	weqe	\N	\N	422011    	\N
1	Miss	Jenny	Stones	27 Rowan Avenue	Hightown	NT2 1AQ   	023 9876
2	Mr  	Andrew	Stones	52 The Willows	Lowtown	LT5 7RA   	876 3527
3	Miss	Alex	Matthew	4 The Street	Nicetown	NT2 2TX   	010 4567
4	Mr  	Adrian	Matthew	The Barn	Yuleville	YV67 2WR  	487 3871
5	Mr  	Simon	Cozens	7 Shady Lane	Oakenham	OA3 6QW   	514 5926
6	Mr  	Neil	Matthew	5 Pasture Lane	Nicetown	NT3 7RT   	267 1232
8	Mrs 	Ann	Stones	34 Holly Way	Bingham	BG4 2WE   	342 5982
9	Mrs 	Christine	Hickman	36 Queen Street	Histon	HT3 5EM   	342 5432
10	Mr  	Mike	Howard	86 Dysart Street	Tibsville	TB3 7FG   	505 5482
11	Mr  	Dave	Jones	54 Vale Rise	Bingham	BG3 8GD   	342 8264
12	Mr  	Richard	Neill	42 Thatched Way	Winersby	WB3 6GQ   	505 6482
13	Mrs 	Laura	Hardy	73 Margarita Way	Oxbridge	OX2 3HX   	821 2335
14	Mr  	Bill	O'Neill	2 Beamer Street	Welltown	WT3 8GM   	435 1234
15	Mr  	David	Hudson	4 The Square	Milltown	MT2 6RT   	961 4526
16	\N	asdf	weqe	\N	\N	422011    	\N
1	Miss	Jenny	Stones	27 Rowan Avenue	Hightown	NT2 1AQ   	023 9876
2	Mr  	Andrew	Stones	52 The Willows	Lowtown	LT5 7RA   	876 3527
3	Miss	Alex	Matthew	4 The Street	Nicetown	NT2 2TX   	010 4567
4	Mr  	Adrian	Matthew	The Barn	Yuleville	YV67 2WR  	487 3871
5	Mr  	Simon	Cozens	7 Shady Lane	Oakenham	OA3 6QW   	514 5926
6	Mr  	Neil	Matthew	5 Pasture Lane	Nicetown	NT3 7RT   	267 1232
8	Mrs 	Ann	Stones	34 Holly Way	Bingham	BG4 2WE   	342 5982
9	Mrs 	Christine	Hickman	36 Queen Street	Histon	HT3 5EM   	342 5432
10	Mr  	Mike	Howard	86 Dysart Street	Tibsville	TB3 7FG   	505 5482
11	Mr  	Dave	Jones	54 Vale Rise	Bingham	BG3 8GD   	342 8264
12	Mr  	Richard	Neill	42 Thatched Way	Winersby	WB3 6GQ   	505 6482
13	Mrs 	Laura	Hardy	73 Margarita Way	Oxbridge	OX2 3HX   	821 2335
14	Mr  	Bill	O'Neill	2 Beamer Street	Welltown	WT3 8GM   	435 1234
15	Mr  	David	Hudson	4 The Square	Milltown	MT2 6RT   	961 4526
16	\N	asdf	weqe	\N	\N	422011    	\N
1	Miss	Jenny	Stones	27 Rowan Avenue	Hightown	NT2 1AQ   	023 9876
2	Mr  	Andrew	Stones	52 The Willows	Lowtown	LT5 7RA   	876 3527
3	Miss	Alex	Matthew	4 The Street	Nicetown	NT2 2TX   	010 4567
4	Mr  	Adrian	Matthew	The Barn	Yuleville	YV67 2WR  	487 3871
5	Mr  	Simon	Cozens	7 Shady Lane	Oakenham	OA3 6QW   	514 5926
6	Mr  	Neil	Matthew	5 Pasture Lane	Nicetown	NT3 7RT   	267 1232
8	Mrs 	Ann	Stones	34 Holly Way	Bingham	BG4 2WE   	342 5982
9	Mrs 	Christine	Hickman	36 Queen Street	Histon	HT3 5EM   	342 5432
10	Mr  	Mike	Howard	86 Dysart Street	Tibsville	TB3 7FG   	505 5482
11	Mr  	Dave	Jones	54 Vale Rise	Bingham	BG3 8GD   	342 8264
12	Mr  	Richard	Neill	42 Thatched Way	Winersby	WB3 6GQ   	505 6482
13	Mrs 	Laura	Hardy	73 Margarita Way	Oxbridge	OX2 3HX   	821 2335
14	Mr  	Bill	O'Neill	2 Beamer Street	Welltown	WT3 8GM   	435 1234
15	Mr  	David	Hudson	4 The Square	Milltown	MT2 6RT   	961 4526
16	\N	asdf	weqe	\N	\N	422011    	\N
\.


--
-- Data for Name: orderinfo; Type: TABLE DATA; Schema: public; Owner: sumedha
--

COPY orderinfo (orderinfo_id, customer_id, date_placed, date_shipped, shipping) FROM stdin;
1	3	2000-03-13	2000-03-17	2.99
2	8	2000-06-23	2000-06-24	0.00
3	15	2000-09-02	2000-09-12	3.99
4	13	2000-09-03	2000-09-10	2.99
5	8	2000-07-21	2000-07-24	0.00
\.


--
-- Name: orderinfo_orderinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sumedha
--

SELECT pg_catalog.setval('orderinfo_orderinfo_id_seq', 5, true);


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: sumedha
--

COPY orderline (orderinfo_id, item_id, quantity) FROM stdin;
1	4	1
1	7	1
1	9	1
2	1	1
2	10	1
2	7	2
2	4	2
3	2	1
3	1	1
4	5	2
5	1	1
5	3	1
\.


--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: sumedha
--

COPY stock (item_id, quantity) FROM stdin;
1	12
2	2
4	8
5	3
7	8
8	18
10	1
\.


--
-- Name: barcode_pk; Type: CONSTRAINT; Schema: public; Owner: sumedha
--

ALTER TABLE ONLY barcode
    ADD CONSTRAINT barcode_pk PRIMARY KEY (barcode_ean);


--
-- Name: customer_pk; Type: CONSTRAINT; Schema: public; Owner: sumedha
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pk PRIMARY KEY (customer_id);


--
-- Name: item_pk; Type: CONSTRAINT; Schema: public; Owner: sumedha
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_pk PRIMARY KEY (item_id);


--
-- Name: orderinfo_pk; Type: CONSTRAINT; Schema: public; Owner: sumedha
--

ALTER TABLE ONLY orderinfo
    ADD CONSTRAINT orderinfo_pk PRIMARY KEY (orderinfo_id);


--
-- Name: orderline_pk; Type: CONSTRAINT; Schema: public; Owner: sumedha
--

ALTER TABLE ONLY orderline
    ADD CONSTRAINT orderline_pk PRIMARY KEY (orderinfo_id, item_id);


--
-- Name: stock_pk; Type: CONSTRAINT; Schema: public; Owner: sumedha
--

ALTER TABLE ONLY stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (item_id);


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

