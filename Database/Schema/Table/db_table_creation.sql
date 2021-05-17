/*  Final DB440 Class *
*  Monday May 17*
*  Done by Paul Doho*/


--Creating table client if doesn't exist 
DROP TABLE IF EXISTS [clients];

CREATE TABLE clients (
  [client_id] int NOT NULL,
  [ name] varchar(255) NOT NULL,
  [details] varchar(max) NOT NULL,
  PRIMARY KEY ([client_id])
)  ;

--Creating table features if doesn't exist 
DROP TABLE IF EXISTS [features];

CREATE TABLE features (
  [feature_id] int check ([feature_id] > 0) NOT NULL IDENTITY,
  [description] varchar(max) NOT NULL,
  [status] varchar(45) NOT NULL,
  [priority] varchar(45) NOT NULL,
  [date_time] datetime2(0) NOT NULL,
  [fk_project_id] int NOT NULL,
  [fk_projects_id] int check ([fk_projects_id] > 0) DEFAULT NULL
  );
--primary key adding
ALTER TABLE features
ADD PRIMARY KEY ([feature_id]);

--Creating table projects if doesn't exist 
DROP TABLE IF EXISTS [projects];

CREATE TABLE projects (
  [project_id] int check ([project_id] > 0) NOT NULL IDENTITY,
  [details] varchar(max) NOT NULL,
  [version] int NOT NULL,
  [fk_client_id] int NOT NULL,
  [fk_feature_id] int check ([fk_feature_id] > 0) DEFAULT NULL
  );
--altering for primary keys
ALTER TABLE projects
ADD PRIMARY KEY ([project_id]);

--Creating table managers if doesn't exist 
DROP TABLE IF EXISTS [managers];

CREATE TABLE managers (
  [manager_id] int check ([manager_id] > 0) NOT NULL IDENTITY,
  [name] varchar(255) NOT NULL,
  [details] varchar(max) NOT NULL,
  PRIMARY KEY ([manager_id])
);


--Creating table manager_feature if doesn't exist 
DROP TABLE IF EXISTS [manager_feature];

CREATE TABLE manager_feature (
  [manager_id] int NOT NULL,
  [feature_id] int NOT NULL,
  [fk_features_id] int check ([fk_features_id] > 0) DEFAULT NULL,
  [fk_manager_id] int check ([fk_manager_id] > 0) DEFAULT NULL
  );


--Creating table tickets if doesn't exist 
DROP TABLE IF EXISTS [tickets];

CREATE TABLE tickets (
  [ticket_id] int check ([ticket_id] > 0) NOT NULL IDENTITY,
  [description] varchar(max) NOT NULL,
  [title] varchar(255) NOT NULL,
  [date1] datetime2(0) NOT NULL,
  [fk_client_id] int NOT NULL,
  [fk_project_id] int NOT NULL,
  PRIMARY KEY ([ticket_id])
)  ;

--Creating table manager_project if doesn't exist 
DROP TABLE IF EXISTS [manager_project];

CREATE TABLE manager_project (
  [manager_id] int NOT NULL,
  [project_id] int NOT NULL,
  [fk_managers_id] int check ([fk_managers_id] > 0) DEFAULT NULL,
  [fk_project_id] int check ([fk_project_id] > 0) DEFAULT NULL
 );

---Constraints
---Check image for explanation 
ALTER TABLE features
ADD CONSTRAINT [fk_projects_id] FOREIGN KEY ([fk_projects_id]) REFERENCES projects ([project_id]) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE projects
ADD CONSTRAINT [fk_client_id] FOREIGN KEY ([fk_client_id]) REFERENCES clients ([client_id]);

ALTER TABLE projects
ADD CONSTRAINT [fk_feature_id] FOREIGN KEY ([fk_feature_id]) REFERENCES features ([feature_id]) ON DELETE CASCADE ON UPDATE CASCADE;

ALTEr TABLE manager_feature
ADD CONSTRAINT [fk_features_id] FOREIGN KEY ([fk_features_id]) REFERENCES features ([feature_id]) ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE manager_feature  
ADD CONSTRAINT [fk_manager_id] FOREIGN KEY ([fk_manager_id]) REFERENCES managers ([manager_id]) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE manager_project
ADD CONSTRAINT [fk_managers_id] FOREIGN KEY ([fk_managers_id]) REFERENCES managers ([manager_id]) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE manager_project
ADD CONSTRAINT [fk_project_id] FOREIGN KEY ([fk_project_id]) REFERENCES projects ([project_id]) ON DELETE CASCADE ON UPDATE CASCADE;



---Index
CREATE INDEX [fk_projects_id] ON features ([fk_projects_id]);
CREATE INDEX [fk_client_id] ON projects ([fk_client_id]);
CREATE INDEX [fk_feature_id] ON projects ([fk_feature_id]);
CREATE INDEX [fk_features_id] ON manager_feature ([fk_features_id]);
CREATE INDEX [fk_manager_id] ON manager_feature ([fk_manager_id]);
CREATE INDEX [fk_managers_id] ON manager_project ([fk_managers_id]);
CREATE INDEX [fk_project_id] ON manager_project ([fk_project_id]);
