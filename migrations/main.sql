-- Adminer 4.8.1 PostgreSQL 17.0 (Debian 17.0-1.pgdg120+1) dump

CREATE TABLE "public"."author_collections" (
    "author_id" integer NOT NULL,
    "collection_id" integer NOT NULL,
    CONSTRAINT "author_collections_author_id_collection_id" PRIMARY KEY ("author_id", "collection_id")
) WITH (oids = false);


CREATE SEQUENCE authors_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."authors" (
    "id" integer DEFAULT nextval('authors_id_seq') NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "role" character varying(10) NOT NULL,
    CONSTRAINT "authors_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE collections_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."collections" (
    "id" integer DEFAULT nextval('collections_id_seq') NOT NULL,
    "name" text NOT NULL,
    CONSTRAINT "collections_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."image_tags" (
    "image_id" integer NOT NULL,
    "tag_id" integer NOT NULL,
    CONSTRAINT "image_tags_image_id_tag_id" PRIMARY KEY ("image_id", "tag_id")
) WITH (oids = false);


CREATE SEQUENCE images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."images" (
    "id" integer DEFAULT nextval('images_id_seq') NOT NULL,
    "name" text NOT NULL,
    "link" text NOT NULL,
    "author_id" integer NOT NULL,
    "status" character varying(10) NOT NULL,
    "collection_id" integer NOT NULL,
    "created_at" timestamp DEFAULT now() NOT NULL,
    CONSTRAINT "images_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE tags_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tags" (
    "id" integer DEFAULT nextval('tags_id_seq') NOT NULL,
    "name" text NOT NULL,
    CONSTRAINT "tags_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."author_collections" ADD CONSTRAINT "author_collections_author_id_fkey" FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."author_collections" ADD CONSTRAINT "author_collections_collection_id_fkey" FOREIGN KEY (collection_id) REFERENCES collections(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."image_tags" ADD CONSTRAINT "image_tags_image_id_fkey" FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."image_tags" ADD CONSTRAINT "image_tags_tag_id_fkey" FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE NOT DEFERRABLE;
