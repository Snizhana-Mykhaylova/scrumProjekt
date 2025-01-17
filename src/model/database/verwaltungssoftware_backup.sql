PGDMP      5    
            |            verwaltungssoftware    16.1    16.1 "               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16480    verwaltungssoftware    DATABASE     �   CREATE DATABASE verwaltungssoftware WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'German_Germany.1252';
 #   DROP DATABASE verwaltungssoftware;
                postgres    false            �            1259    16481    dozenten    TABLE     �   CREATE TABLE public.dozenten (
    dozent_id integer NOT NULL,
    dozent_vorname character varying(255),
    dozent_nachname character varying(255),
    dozent_fachgebiet character varying(255)
);
    DROP TABLE public.dozenten;
       public         heap    postgres    false            �            1259    16486    dozenten_dozent_id_seq    SEQUENCE     �   ALTER TABLE public.dozenten ALTER COLUMN dozent_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dozenten_dozent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    16487    kontakt_daten    TABLE     m  CREATE TABLE public.kontakt_daten (
    kd_id integer NOT NULL,
    kd_ort character varying(255),
    "kd_straße" character varying(255),
    kd_haus_nr integer,
    kd_plz character varying(255),
    kd_email character varying(255),
    kd_phone_nr character varying(255),
    fk_dozent_id integer,
    fk_teilnehmer_id integer,
    fk_mitarbeiter_id integer
);
 !   DROP TABLE public.kontakt_daten;
       public         heap    postgres    false            �            1259    16492    kontakt_daten_kd_id_seq    SEQUENCE     �   ALTER TABLE public.kontakt_daten ALTER COLUMN kd_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kontakt_daten_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16493    kurse    TABLE     �   CREATE TABLE public.kurse (
    kurs_id integer NOT NULL,
    kurs_name character varying,
    kurs_beschreibung character varying,
    kurs_start_datum date,
    kurs_end_datum date,
    fk_dozent_id integer
);
    DROP TABLE public.kurse;
       public         heap    postgres    false            �            1259    16498    kurse_kurs_id_seq    SEQUENCE     �   ALTER TABLE public.kurse ALTER COLUMN kurs_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kurse_kurs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16499    mitarbeiter    TABLE     �   CREATE TABLE public.mitarbeiter (
    mitarbeiter_id integer NOT NULL,
    mitarbeiter_vorname character varying(255),
    mitarbeiter_nachname character varying(255),
    mitarbeiter_position character varying(255)
);
    DROP TABLE public.mitarbeiter;
       public         heap    postgres    false            �            1259    16504    mitarbeiter_mitarbeiter_id_seq    SEQUENCE     �   ALTER TABLE public.mitarbeiter ALTER COLUMN mitarbeiter_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.mitarbeiter_mitarbeiter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    16505 
   teilnehmer    TABLE     �   CREATE TABLE public.teilnehmer (
    teilnehmer_id integer NOT NULL,
    teilnehmer_vorname character varying(255),
    teilnehmer_nachname character varying(255),
    fk_kurs_id integer
);
    DROP TABLE public.teilnehmer;
       public         heap    postgres    false            �            1259    16510    teilnehmer_teilnehmer_id_seq    SEQUENCE     �   ALTER TABLE public.teilnehmer ALTER COLUMN teilnehmer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.teilnehmer_teilnehmer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223                      0    16481    dozenten 
   TABLE DATA           a   COPY public.dozenten (dozent_id, dozent_vorname, dozent_nachname, dozent_fachgebiet) FROM stdin;
    public          postgres    false    215   9*                 0    16487    kontakt_daten 
   TABLE DATA           �   COPY public.kontakt_daten (kd_id, kd_ort, "kd_straße", kd_haus_nr, kd_plz, kd_email, kd_phone_nr, fk_dozent_id, fk_teilnehmer_id, fk_mitarbeiter_id) FROM stdin;
    public          postgres    false    217   �*                 0    16493    kurse 
   TABLE DATA           v   COPY public.kurse (kurs_id, kurs_name, kurs_beschreibung, kurs_start_datum, kurs_end_datum, fk_dozent_id) FROM stdin;
    public          postgres    false    219   p-                 0    16499    mitarbeiter 
   TABLE DATA           v   COPY public.mitarbeiter (mitarbeiter_id, mitarbeiter_vorname, mitarbeiter_nachname, mitarbeiter_position) FROM stdin;
    public          postgres    false    221   ;/       
          0    16505 
   teilnehmer 
   TABLE DATA           h   COPY public.teilnehmer (teilnehmer_id, teilnehmer_vorname, teilnehmer_nachname, fk_kurs_id) FROM stdin;
    public          postgres    false    223   0                  0    0    dozenten_dozent_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dozenten_dozent_id_seq', 10, true);
          public          postgres    false    216                       0    0    kontakt_daten_kd_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.kontakt_daten_kd_id_seq', 17, true);
          public          postgres    false    218                       0    0    kurse_kurs_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kurse_kurs_id_seq', 7, true);
          public          postgres    false    220                       0    0    mitarbeiter_mitarbeiter_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mitarbeiter_mitarbeiter_id_seq', 7, true);
          public          postgres    false    222                       0    0    teilnehmer_teilnehmer_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.teilnehmer_teilnehmer_id_seq', 7, true);
          public          postgres    false    224            e           2606    16512    dozenten dozenten_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.dozenten
    ADD CONSTRAINT dozenten_pkey PRIMARY KEY (dozent_id);
 @   ALTER TABLE ONLY public.dozenten DROP CONSTRAINT dozenten_pkey;
       public            postgres    false    215            g           2606    16514     kontakt_daten kontakt_daten_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.kontakt_daten
    ADD CONSTRAINT kontakt_daten_pkey PRIMARY KEY (kd_id);
 J   ALTER TABLE ONLY public.kontakt_daten DROP CONSTRAINT kontakt_daten_pkey;
       public            postgres    false    217            i           2606    16516    kurse kurse_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.kurse
    ADD CONSTRAINT kurse_pkey PRIMARY KEY (kurs_id);
 :   ALTER TABLE ONLY public.kurse DROP CONSTRAINT kurse_pkey;
       public            postgres    false    219            k           2606    16518    mitarbeiter mitarbeiter_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.mitarbeiter
    ADD CONSTRAINT mitarbeiter_pkey PRIMARY KEY (mitarbeiter_id);
 F   ALTER TABLE ONLY public.mitarbeiter DROP CONSTRAINT mitarbeiter_pkey;
       public            postgres    false    221            m           2606    16520    teilnehmer teilnehmer_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.teilnehmer
    ADD CONSTRAINT teilnehmer_pkey PRIMARY KEY (teilnehmer_id);
 D   ALTER TABLE ONLY public.teilnehmer DROP CONSTRAINT teilnehmer_pkey;
       public            postgres    false    223            n           2606    16521    kontakt_daten kd_dozent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kontakt_daten
    ADD CONSTRAINT kd_dozent_fkey FOREIGN KEY (fk_dozent_id) REFERENCES public.dozenten(dozent_id) NOT VALID;
 F   ALTER TABLE ONLY public.kontakt_daten DROP CONSTRAINT kd_dozent_fkey;
       public          postgres    false    217    4709    215            o           2606    16526 !   kontakt_daten kd_mitarbeiter_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kontakt_daten
    ADD CONSTRAINT kd_mitarbeiter_fkey FOREIGN KEY (fk_mitarbeiter_id) REFERENCES public.mitarbeiter(mitarbeiter_id) NOT VALID;
 K   ALTER TABLE ONLY public.kontakt_daten DROP CONSTRAINT kd_mitarbeiter_fkey;
       public          postgres    false    4715    221    217            p           2606    16531     kontakt_daten kd_teilnehmer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kontakt_daten
    ADD CONSTRAINT kd_teilnehmer_fkey FOREIGN KEY (fk_teilnehmer_id) REFERENCES public.teilnehmer(teilnehmer_id) NOT VALID;
 J   ALTER TABLE ONLY public.kontakt_daten DROP CONSTRAINT kd_teilnehmer_fkey;
       public          postgres    false    217    4717    223            q           2606    16536    kurse kurs_dozent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kurse
    ADD CONSTRAINT kurs_dozent_fkey FOREIGN KEY (fk_dozent_id) REFERENCES public.dozenten(dozent_id) NOT VALID;
 @   ALTER TABLE ONLY public.kurse DROP CONSTRAINT kurs_dozent_fkey;
       public          postgres    false    4709    215    219            r           2606    16541    teilnehmer kurs_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.teilnehmer
    ADD CONSTRAINT kurs_fkey FOREIGN KEY (fk_kurs_id) REFERENCES public.kurse(kurs_id) NOT VALID;
 >   ALTER TABLE ONLY public.teilnehmer DROP CONSTRAINT kurs_fkey;
       public          postgres    false    223    4713    219               �   x�M�9�0E��)� ��H�$�L�!������4��zYANΐ�Zۤ{}�A��e5�8��@�|��p�&@���#'�'
�,|�{7��r&C"g-��P�NbO�Ŭ
/�gH)��C<�6}1c�+����N������2u�G�b���v�wr-��͔R?�]E[         k  x�m��n�0����,�-$����n����e+�jY*$yA�<}��vˋMfl7�c%Y?R$���k?ı�;k�yM8���a`Tm��ۚ��F�M���(�m[x|�o��g���.D��8J#�8��Ɂ;ժ�� ��
V�n��I�^Zgc����
�q�p�~ŉ��L����js�N��)8Tq��YvP��<��N8�̣����#�t��G�֐-T#�LJ���\���:�"�$T	%�S�.�`��B�&�w��D�"5�*���i,��7W,6��d_��_���MX��k&斘[�C���k-�^6�X��D����`zg�W��|:�/�X���|-c���H�R�+�qC�a�]��C��"�=�Qk��H}�R��XB���Q�Mm��VQK��K�B�6�v/�-��y2GK�2�F%�U'�E�?x�	�(#'�B�o*z'����1x��C����}4o�4���p'��7jKF����/�4B�8��ɖ�����̇�k���B�b��VZ�`�8����&!������W�������� ��!k��X	�G'�^�kXTI��"���I�b�!&S<vR]mR֘��q�$��ͣ�         �  x�}R�r�0>�����c���0�!�x2Ρk�"�Gq�>}���b]�3�Lo+������zP�5(�����摭4?���B೒�2������R���\��]G�Aռ ��Тl,�V.��2GIůn�`%R���a���[?L?�;?�X��l#tU���K���T<�Q[S6�`	�u_6�.Xp	�E��`_v��S�V��"�ĝ�l��ӡu�\	.�a�aB\�l���OA��Y���t*���� Z��=��#Ӈ7%:4��$t{e��q��~�$��,�Ʉc����`M�R��:��nF��l�sGSy��x]����9��b?aG��0v��y	�~� ���7�������9!�7X��Q>6�T����O�p1�͹��?o����	�,3]��0Jح�2g� �
��9�p޿�6y~�J�אx�o<��;���         �   x���Mj1���)|���t��h!a&�M7�G3V�� ��B9Fws����g%����x�����I+t4��T?�����X�8�Dm2�xA͉�'҄B
}E��D\��[;��Gxo�c��X{k2��y��������]�{�YnX�vm�g,��RxZ�7��4Y�#/9?�1�ج{���UG���-T�����\9�~��r      
      x�̻
�0F����r��)���
]1��#��$O�l�o8����8�j8�#�1��������ҩ�3Ƥ>.g��/ֲb,3+z����y�'�	h��s9��8G�@������ jz_����)Q     