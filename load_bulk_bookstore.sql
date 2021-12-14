-- Setup & load table for bulk bookstore file

drop table if exists books;

create table books (
Title text not null,
Url text not null,
Price decimal (10,2),
ISBN-10 text,
ISBN text,
Author text,
Format text,
Pages bigint,
Publisher text,
Language text,
Weight text,
Dimensions text,
Case_pack bigint,
Raw_description text,
Availability text,
Item_condition text,
Breadcrumbs text,
Images text,
Scraped_at text,
Uniq_id text
);


