CREATE TABLE fsp_details
(
    fsp_id text COLLATE pg_catalog."default" NOT NULL,
    callback_url text COLLATE pg_catalog."default",
    connector_port text COLLATE pg_catalog."default",
    CONSTRAINT fsp_details_pkey PRIMARY KEY (fsp_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE fsp_details
    OWNER to interop_switch;