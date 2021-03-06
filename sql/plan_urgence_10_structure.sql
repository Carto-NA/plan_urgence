/* PLAN_URGENCE V1.0 */
/* Creation de la structure des données (schéma, tables, séquences, triggers,...) */
/* plan_urgence_10_structure.sql */
/* PostgreSQL/PostGIS */
/* Conseil régional Nouvelle-Aquitaine - https://cartographie.nouvelle-aquitaine.fr/ */
/* Auteur : Tony VINCENT */


------------------------------------------------------------------------ 
-- Tables : Création des tables
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Table: met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo

-- DROP TABLE met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo;
CREATE TABLE met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo
(
	id serial NOT NULL,
	site_code character varying(15),
	site_nom character varying(255),
	site_nom2 character varying(255),
	site_ouvert boolean DEFAULT false,
	site_nb_place character varying(150),
	temps_acces_voiture integer,
	distance numeric,
	adresse character varying(255),
	numcom character varying(5),
	nomcom character varying(255),
	code_postal character varying(5),
	site_contact_nom character varying(255),
	site_contact_tel character varying(14),
	site_contact_tel2 character varying(14),
	site_contact_mail character varying(255),
	caract_site_hebergement boolean DEFAULT false,
	caract_site_hebergement_contact_nom character varying(255),
	caract_site_hebergement_contact_tel character varying(14),
	caract_site_hebergement_contact_mail character varying(255),
	caract_site_hebergement_acces_nuit boolean DEFAULT false,
	caract_site_hebergement_desc character varying(255),
	caract_site_hebergement_horaire character varying(255),
	caract_site_hebergement_tps_trajet character varying(2),
	caract_site_hebergement_transport_centre_hospitalier boolean,
	caract_site_hebergement_transport_centre_hospitalier_desc text,
	caract_site_hebergement_commentaire text,
	caract_site_restaurant boolean DEFAULT false,
	caract_site_restaurant_acces_nuit boolean,
	caract_site_restaurant_desc character varying(255),
	caract_site_restaurant_horaire character varying(255),
	caract_site_restaurant_contact_nom character varying(255),
	caract_site_restaurant_contact_tel character varying(14),
	caract_site_restaurant_contact_mail character varying(255),
	caract_site_restaurant_commentaire text,
	divers_commentaires text,
	date_import date,
	date_maj date,
	geom_valide  boolean DEFAULT false,
	geom geometry(Point,2154),
    CONSTRAINT m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo_pkey PRIMARY KEY (id),
    CONSTRAINT m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo_uniq UNIQUE (site_code)
);

--
COMMENT ON TABLE met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo IS 'Plan urgence : Localisation des lieux d''accueil et d''hebergement dans les internats en Nouvelle-Aquitaine';

--
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.id IS 'Identifiant';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.site_code IS 'Code de l''établissement ou site';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.site_nom IS 'Nom de l''établissement ou du site';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.site_ouvert IS 'Indique si le site est ouvert';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.site_nb_place IS 'Indique la capacité d''accueil en internat';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.adresse IS 'Le site propose un hébergement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.numcom IS 'Code INSEE du site';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.nomcom IS 'Nom de la commune';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.code_postal IS 'Code postal de la commune';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.site_contact_nom IS 'Nom et prénom du contact de l''établissement ou site';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.site_contact_tel IS 'Numéro de téléphone de l''établissmeent ou du site';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.site_contact_mail IS 'Mail de l''établissmeent ou du site';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_hebergement IS 'Le site propose t-il un hébergement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_hebergement_contact_nom IS 'Nom et prénom du contact pour l''hébergement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_hebergement_contact_tel IS 'Numéro de téléphone du contact pour l''hébergement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_hebergement_contact_mail IS 'Mail du contact pour l''hébergement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_hebergement_acces_nuit IS 'L''hébergement est-t-il accessible la nuit';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_hebergement_desc IS 'Descriptio de l''hébergement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_hebergement_horaire IS 'Horaires d''accès à l''hébergement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_hebergement_tps_trajet IS 'Temps de trajet en voiture depuis le Centre Hospitalier';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_hebergement_transport_centre_hospitalier IS 'Possibilité de transport entre l''hébergement et le centre hospitalié';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_hebergement_transport_centre_hospitalier_desc IS 'Description du transport entre les sites';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_hebergement_commentaire IS 'Commentaire sur l''hébergement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_restaurant IS 'Le site propose t-il de la restauration';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_restaurant_contact_nom IS 'Nom et prénom du contact pour la restauration';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_restaurant_contact_tel IS 'Numéro de téléphone du contact pour la restauration';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_restaurant_contact_mail IS 'Mail du contact pour la restauration';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_restaurant_acces_nuit IS 'La restauration est-t-est accessible la nuit';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_restaurant_desc IS 'Descriptio de la restauration';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_restaurant_horaire IS 'Horaires d''accès à la restauration';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.caract_site_restaurant_commentaire IS 'Commentaire sur la restauration';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.divers_commentaires IS 'Divers : Commentaires';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.date_import IS 'Date d''import de la donnée';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.date_maj IS 'Date de mise à jour';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.geom_valide IS 'Géométrie validée';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo.geom IS 'Géométrie (point)';



-- Jeu de données test
INSERT INTO met_plan_urgence.m_plan_urgence_covid19_lieux_accueil_hebergement_na_geo (
	site_code, site_nom, site_nom2, site_ouvert, site_nb_place, temps_acces_voiture, distance,
	site_contact_nom, site_contact_tel, site_contact_tel2, site_contact_mail, adresse, numcom, nomcom, code_postal, 
	caract_site_hebergement, caract_site_hebergement_transport_centre_hospitalier,
	date_import, geom_valide, geom) 
SELECT t1.site_code, t2.type_ || ' ' || t2.lib_v2, t1.site_nom2, true, t1.nb_place, cast(t1.temps_acces_voiture as integer), cast(t1.distance as numeric),
t1.contact, t1.telephone, t1.telephone2, t1.mail, t2.adresse, t2.numcom, t2.nomcom, t2.cp, 
	CASE 
      WHEN t1.caract_site_hebergement='oui'  THEN true
      ELSE false
END, CASE 
      WHEN t1.caract_site_hebergement_transport_centre_hospitalier='oui'  THEN true
      ELSE false
END, now(), true, t2.geom 
FROM (SELECT * FROM z_maj.covid19_lieux_accueil_et_hebergement WHERE site_solicite = 'x') t1,
	(SELECT code_uai, lib_v2, type_, adresse, cp, tel, numcom, nomcom, geom FROM met_lyc.m_lyc_public_adresse) t2
WHERE t1.site_code = t2.code_uai;


------------------------------------------------------------------------
-- Table: met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo

-- DROP TABLE met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo;
CREATE TABLE met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo
(
	id serial NOT NULL,
	osm_id character varying(20),
	num_finess character varying(9),
	site_nom character varying(255),
	site_nom2 character varying(255),
	site_type character varying(10),
	site_nb_place integer,
	adresse character varying(255),
	numcom character varying(5),
	nomcom character varying(255),
	code_postal character varying(5),
	niveau character varying(50),
	divers_commentaires text,
	date_import date,
	date_maj date,
	geom_valide  boolean DEFAULT false,
	geom geometry(Point,2154),
    CONSTRAINT m_plan_urgence_covid19_hopitaux_mobilises_na_geo_pkey PRIMARY KEY (id),
    CONSTRAINT m_plan_urgence_covid19_hopitaux_mobilises_na_geo_uniq UNIQUE (osm_id, num_finess)
);

--
COMMENT ON TABLE met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo IS 'Plan urgence : Hôpitaux de Nouvelle-Aquitaine mobilisés pour le plan d''urgence';

--
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.id IS 'Identifiant';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.osm_id IS 'Code OSM';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.num_finess IS 'Numéro FINESS de l''établissement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.site_nom IS 'Nom de l''établissement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.site_nom2 IS 'Nom 2 de l''établissement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.site_nb_place IS 'Nombre de place proposé';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.adresse IS 'Adresse de l''établissement';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.numcom IS 'Code INSEE du site';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.nomcom IS 'Nom de la commune';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.code_postal IS 'Code postal de la commune';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.niveau IS 'Niveau d''intervention';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.divers_commentaires IS 'Divers : Commentaires';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.date_import IS 'Date d''import de la donnée';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.date_maj IS 'Date de mise à jour';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.geom_valide IS 'Géométrie validée';
COMMENT ON COLUMN met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo.geom IS 'Géométrie (point)';

-- Ajout des données de test
INSERT INTO met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo (
	osm_id, num_finess, site_nom, site_nom2, site_type, site_nb_place,
	adresse, numcom, nomcom, code_postal,
	niveau, divers_commentaires, date_import, geom_valide, geom
)
SELECT  
	id, covid19_ce, covid19__1, name, covid19__2, cast(covid19__7 as integer),
	addr_stree, covid19__3, covid19__5, covid19__4,
	covid19__6,null, now(), false, ST_PointOnSurface(geom) FROM z_maj.etab_mobilise_c19_epsg2154;

-- Ajout du 21/04/2020
INSERT INTO met_plan_urgence.m_plan_urgence_covid19_hopitaux_mobilises_na_geo (
	osm_id, num_finess, site_nom, site_nom2, site_type, site_nb_place,
	adresse, numcom, nomcom, code_postal,
	niveau, divers_commentaires, date_import, geom_valide, geom
)
SELECT id, null, "name", "name", 'EPHAD', 10, 
	'16 avenue Jean Jaurés', '86078', 'Civray', '86400',
	'EPHAD', null, now(), true, ST_Transform(ST_PointOnSurface(geom),2154)
FROM z_maj."20200421_exportOverpass_EPHAD_LesCapucines";
