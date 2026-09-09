-- =========================================
-- ASIGNACION 07
-- BASE DE DATOS PUBS
-- =========================================

-- =========================================
-- CREACION DE BASE DE DATOS
-- =========================================

CREATE DATABASE pubs;
GO

USE pubs;
GO


-- =========================================
-- TABLAS PADRE
-- Las tablas padre deben crearse primero
-- porque las tablas hijas dependen de ellas
-- mediante FOREIGN KEY
-- =========================================


-- =========================================
-- TABLA publishers
-- =========================================

CREATE TABLE publishers (
    pub_id CHAR(4) PRIMARY KEY,
    pub_name VARCHAR(40),
    city VARCHAR(20),
    state CHAR(2),
    country VARCHAR(30)
);
GO


-- =========================================
-- TABLA stores
-- =========================================

CREATE TABLE stores (
    stor_id CHAR(4) PRIMARY KEY,
    stor_name VARCHAR(40),
    stor_address VARCHAR(40),
    city VARCHAR(20),
    state CHAR(2),
    zip CHAR(5)
);
GO


-- =========================================
-- TABLA authors
-- =========================================

CREATE TABLE authors (
    au_id VARCHAR(11) PRIMARY KEY,
    au_lname VARCHAR(40),
    au_fname VARCHAR(20),
    phone CHAR(12),
    address VARCHAR(40),
    city VARCHAR(20),
    state CHAR(2),
    zip CHAR(5),
    contract BIT
);
GO


-- =========================================
-- TABLA jobs
-- =========================================

CREATE TABLE jobs (
    job_id SMALLINT PRIMARY KEY,
    job_desc VARCHAR(50),
    min_lvl TINYINT,
    max_lvl TINYINT
);
GO


-- =========================================
-- TABLAS HIJAS
-- No es posible crear FOREIGN KEY
-- si la tabla padre no existe previamente
-- =========================================


-- =========================================
-- TABLA titles
-- publishers es la tabla padre
-- =========================================

CREATE TABLE titles (
    title_id VARCHAR(6) PRIMARY KEY,
    title VARCHAR(80),
    type CHAR(12),
    pub_id CHAR(4),
    price MONEY,
    advance MONEY,
    royalty INT,
    ytd_sales INT,
    notes VARCHAR(200),
    pubdate DATETIME,

    FOREIGN KEY (pub_id)
    REFERENCES publishers(pub_id)
);
GO


-- =========================================
-- TABLA employee
-- publishers y jobs son tablas padre
-- =========================================

CREATE TABLE employee (
    emp_id CHAR(9) PRIMARY KEY,
    fname VARCHAR(20),
    minit CHAR(1),
    lname VARCHAR(30),
    job_id SMALLINT,
    job_lvl TINYINT,
    pub_id CHAR(4),
    hire_date DATETIME,

    FOREIGN KEY (job_id)
    REFERENCES jobs(job_id),

    FOREIGN KEY (pub_id)
    REFERENCES publishers(pub_id)
);
GO


-- =========================================
-- TABLA discounts
-- stores es tabla padre
-- =========================================

CREATE TABLE discounts (
    discounttype VARCHAR(40),
    stor_id CHAR(4),
    lowqty SMALLINT,
    highqty SMALLINT,
    discount DECIMAL(4,2),

    FOREIGN KEY (stor_id)
    REFERENCES stores(stor_id)
);
GO


-- =========================================
-- TABLA sales
-- stores y titles son tablas padre
-- =========================================

CREATE TABLE sales (
    stor_id CHAR(4),
    ord_num VARCHAR(20),
    ord_date DATETIME,
    qty SMALLINT,
    payterms VARCHAR(12),
    title_id VARCHAR(6),

    FOREIGN KEY (stor_id)
    REFERENCES stores(stor_id),

    FOREIGN KEY (title_id)
    REFERENCES titles(title_id)
);
GO


-- =========================================
-- TABLA titleauthor
-- authors y titles son tablas padre
-- =========================================

CREATE TABLE titleauthor (
    au_id VARCHAR(11),
    title_id VARCHAR(6),
    au_ord TINYINT,
    royaltyper INT,

    FOREIGN KEY (au_id)
    REFERENCES authors(au_id),

    FOREIGN KEY (title_id)
    REFERENCES titles(title_id)
);
GO


-- =========================================
-- TABLA roysched
-- titles es tabla padre
-- =========================================

CREATE TABLE roysched (
    title_id VARCHAR(6),
    lorange INT,
    hirange INT,
    royalty INT,

    FOREIGN KEY (title_id)
    REFERENCES titles(title_id)
);
GO


-- =========================================
-- TABLA pub_info
-- publishers es tabla padre
-- =========================================

CREATE TABLE pub_info (
    pub_id CHAR(4),
    logo IMAGE,
    pr_info TEXT,

    FOREIGN KEY (pub_id)
    REFERENCES publishers(pub_id)
);
GO