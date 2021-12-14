-- Setup & load table for bulk bookstore file

-- drop table
drop table if exists books;

-- create table to match bookstore.csv

-- Title,Url,Price,ISBN-10,ISBN,Author,Format,Pages,Publisher,Language,Weight,Dimensions,Case pack,Raw description,Availability,Item condition,Breadcrumbs,Images,Scraped at,Uniq id

create table books (
Title text not null,
Url text not null,
Price decimal (10,2),
ISBN10 text,
ISBN text,
Author text,
Format text,
Pages text,
Publisher text,
BookLanguage text,
Weight text,
Dimensions text,
Case_pack text,
Raw_description text,
Availability text,
Item_condition text,
Breadcrumbs text,
Images text,
Scraped_at text
--Uniq_id text
);

-- client-side copy
\copy books from 'bulk_bookstore_cleansed.csv' with csv header;

