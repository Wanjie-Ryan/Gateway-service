PGDMP                      |            bank    16.3    16.3                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    41253    bank    DATABASE        CREATE DATABASE bank WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE bank;
                postgres    false            �            1259    41254    address    TABLE     �   CREATE TABLE public.address (
    id uuid NOT NULL,
    city character varying(255),
    state character varying(255),
    customer_id bigint NOT NULL
);
    DROP TABLE public.address;
       public         heap    postgres    false            �            1259    41262    credentials    TABLE     �  CREATE TABLE public.credentials (
    credentials_id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_by character varying(50),
    last_modified_date timestamp(6) without time zone,
    confirmed_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    enabled boolean NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    is_verified boolean,
    locked boolean NOT NULL,
    password character varying(255),
    token character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    customer_id bigint NOT NULL
);
    DROP TABLE public.credentials;
       public         heap    postgres    false            �            1259    41261    credentials_credentials_id_seq    SEQUENCE     �   CREATE SEQUENCE public.credentials_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.credentials_credentials_id_seq;
       public          postgres    false    217                       0    0    credentials_credentials_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.credentials_credentials_id_seq OWNED BY public.credentials.credentials_id;
          public          postgres    false    216            �            1259    41271 	   customers    TABLE     c  CREATE TABLE public.customers (
    id bigint NOT NULL,
    date_of_birth date,
    email character varying(255),
    employer_name character varying(255),
    full_name character varying(255),
    gender smallint,
    monthly_income real,
    national_id character varying(255),
    occupation character varying(255),
    phone character varying(255)
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    41270    customers_id_seq    SEQUENCE     y   CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    219                       0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    218            �            1259    41279    users    TABLE     4   CREATE TABLE public.users (
    id uuid NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            ]           2604    41265    credentials credentials_id    DEFAULT     �   ALTER TABLE ONLY public.credentials ALTER COLUMN credentials_id SET DEFAULT nextval('public.credentials_credentials_id_seq'::regclass);
 I   ALTER TABLE public.credentials ALTER COLUMN credentials_id DROP DEFAULT;
       public          postgres    false    217    216    217            ^           2604    41274    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �          0    41254    address 
   TABLE DATA           ?   COPY public.address (id, city, state, customer_id) FROM stdin;
    public          postgres    false    215   �       �          0    41262    credentials 
   TABLE DATA           �   COPY public.credentials (credentials_id, created_by, created_date, last_modified_by, last_modified_date, confirmed_at, created_at, enabled, expires_at, is_verified, locked, password, token, username, customer_id) FROM stdin;
    public          postgres    false    217   �!       �          0    41271 	   customers 
   TABLE DATA           �   COPY public.customers (id, date_of_birth, email, employer_name, full_name, gender, monthly_income, national_id, occupation, phone) FROM stdin;
    public          postgres    false    219   4#       �          0    41279    users 
   TABLE DATA           #   COPY public.users (id) FROM stdin;
    public          postgres    false    220   :%                  0    0    credentials_credentials_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.credentials_credentials_id_seq', 5, true);
          public          postgres    false    216                       0    0    customers_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.customers_id_seq', 8, true);
          public          postgres    false    218            `           2606    41260    address address_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            postgres    false    215            b           2606    41269    credentials credentials_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (credentials_id);
 F   ALTER TABLE ONLY public.credentials DROP CONSTRAINT credentials_pkey;
       public            postgres    false    217            d           2606    41278    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    219            f           2606    41283    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            h           2606    41289 '   credentials fkpfers5cemp3hwt59yiccid46o    FK CONSTRAINT     �   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT fkpfers5cemp3hwt59yiccid46o FOREIGN KEY (customer_id) REFERENCES public.customers(id);
 Q   ALTER TABLE ONLY public.credentials DROP CONSTRAINT fkpfers5cemp3hwt59yiccid46o;
       public          postgres    false    217    219    4708            g           2606    41284 #   address fkpkaif5e5vy013h0spva59jpfd    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT fkpkaif5e5vy013h0spva59jpfd FOREIGN KEY (customer_id) REFERENCES public.customers(id);
 M   ALTER TABLE ONLY public.address DROP CONSTRAINT fkpkaif5e5vy013h0spva59jpfd;
       public          postgres    false    219    4708    215            �   �  x�u��n[1E���"?���(����C�L��E�D�!N�q��}i4���ˑ.�攃�2��=j�YG��,��o��l�z�yzy}[���HC`����%�Re��?K?�K��d#�<�@��ט�Q��-����m;��O���ƕc�H�М��Ƙ�9�D���t8��+���0�@"q�( �� !qVt���=u��?���D�;E���;4iU���V���EkC�1P��v6[}�1`&Ĕ"אm���el��n��`�4�T�؁,F�l9�8��,�oO���UC�*��t�ݼ1��Ҥ�y����?t����f�@a6�yl�s�:u�._vc��ˏ~�^�n�Ǐʚ<��C����hM�e�@�S1��tY�����휖w�_A����M��V][�.���bThA�o���s����<l�+Y4�,ՠqN&�keH��g�ۂy�sE�0�zP�����`�2�*e��??������      �   �  x���Mo�@���_Q�\�ڙݝ�8I#�FjE�F�,�;�!�	����0�����������U�����_�y)<:� �F��������d�Z�X��8߅b�~K�!߼$|�Ι����6^���������+g$ѧ�e_�n0�T��Α`�z�"K���:��<��[��l�z��Ps�k@�M_�����X���̐�ұ,�I��t�|�@��ā���YEǴ���-�ٗ:s8� wWy���a�vC�Q�w2�����탍��J�V��q���=]���AF�	)ت��ٸ,-�'�&�]��u3gjvA�>�n�/U#G`d_���y#�\��{\����<����rx;�f�V��?��Ϊ�(�*7���q�ed�q�6I���Y�|�>��#���_��      �   �  x�e�͎�0���S�ـ��5��Qg�i�T��l�%N��I:o�k�f����w�AQ�<�2������'���K���O��k�.�	��D��HR��EI���pW�g�h�H,�|>�1�2�Esr�G�wz8.l�h�LkK�����pRHoTy&�$dUU�je�����A�GBD���
κSF/<��ܭ�٪R5t�d��9H�+X��õȮ��3����O04R�����B�Ջ����<�iثu�l�ۅ2xN�sA	�S��pG����娕9�ӵ5��U�zǭx{�B���Y��)<��zݘ�q
4��T�l,F�Y9}=�����coj��g߆��b�<�=�ؖy���-�Ak/s]D'I���'�G��bI�*��N�]��l�A�l����D���u�@�2ThdF8�1�SF5�z������S�\` gkL�;؅��U�u����:hkz�ë��I�ɓ@
��7�.?��6�������	#      �      x������ � �     