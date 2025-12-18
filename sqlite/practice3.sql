-- 一つの項目に一つの値。
CREATE TABlE IF NOT EXISTS onenf 
(
    company_id              INTEGER,
    company_name            TEXT,
    branch_id               INTEGER,
    branch_name             TEXT,
    marchandise_id          INTEGER,
    marchandise_name        TEXT,
    marchandise_group       TEXT,
    marchandise_group_name  TEXT,
    PRIMARY KEY (company_id, branch_id, marchandise_id)
);

-- second nomalization 
-- keyに対する操作
-- 部分関数従属を無くし、完全関数従属だけを残す。
-- 部分関数従属　= 主キーの'一部'から従属している項目。
-- 完全関数従属　= 主キーの'すべて'から従属している項目。
DROP TABLE IF EXISTS twonf;
DROP TABLE IF EXISTS companies;
DROP TABLE IF EXISTS branchies;
DROP TABLE IF EXISTS marchandises;
CREATE TABlE IF NOT EXISTS twonf 
(
    company_id              INTEGER REFERENCES companies(company_id),
    branch_id               INTEGER REFERENCES branchies(branch_id),
    marchandise_id          INTEGER REFERENCES marchandises(marchandise_id),
    PRIMARY KEY (company_id, branch_id, marchandise_id)
);

CREATE TABLE IF NOT EXISTS companies(
    company_id              INTEGER PRIMARY KEY,
    company_name            TEXT
);

CREATE TABLE IF NOT EXISTS branchies(
    branch_id               INTEGER PRIMARY KEY,
    branch_name             TEXT
);

CREATE TABLE IF NOT EXISTS marchandises(
    marchandise_id          INTEGER PRIMARY KEY,
    marchandise_name        TEXT,
    marchandise_group       TEXT,
    marchandise_group_name  TEXT
);

INSERT INTO twonf (company_id,branch_id,marchandise_id)VALUES(
    1,1,1
);
-- second nomalization end

-- third  nomalization 
-- 非キー属性に対する操作
-- 部分関数従属を無くし、完全関数従属だけを残す。
-- 部分関数従属　= 主キーの'一部'から従属している項目。
-- 完全関数従属　= 主キーの'すべて'から従属している項目。
CREATE TABlE IF NOT EXISTS thirdof
(
    company_id              INTEGER REFERENCES companies(company_id),
    branch_id               INTEGER REFERENCES branchies(branch_id),
    marchandise_id          INTEGER REFERENCES marchandises(marchandise_id),
    PRIMARY KEY (company_id, branch_id, marchandise_id)
);

CREATE TABLE IF NOT EXISTS companies_third(
    company_id              INTEGER PRIMARY KEY,
    company_name            TEXT
);

CREATE TABLE IF NOT EXISTS branchies_third(
    branch_id               INTEGER PRIMARY KEY,
    branch_name             TEXT
);

CREATE TABLE IF NOT EXISTS marchandises_third(
    marchandise_id          INTEGER PRIMARY KEY,
    marchandise_name        TEXT,
    marchandise_group       TEXT REFERENCES marchandise_groups_third(marchandise_group)
);

CREATE TABLE IF NOT EXISTS marchandise_groups_third(
    marchandise_group       TEXT PRIMARY KEY,
    marchandise_group_name  TEXT
);

-- third  nomalization end