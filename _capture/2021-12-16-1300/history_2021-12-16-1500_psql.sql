\d books
\q
\q
\d
\d books
alter table books alter column pages set not null ; 
alter column books add unique ( title ) ; 
alter table books add unique ( title ) ; 
\d books
alter table books add unique ( isbn10 ) ; 
select isbn10, author, publisher from books order by isbn10 asc limit 10 ; 
alter table books add column id bigserial primary key ; 
select id, isbn10, author, publisher from books order by isbn10 asc limit 10 ; 
select id, isbn10, author, publisher from books order by isbn1 asc limit 10 ; 
select id, isbn10, author, publisher from books order by id asc limit 10 ; 
select max(array_length(string_to_array(author,','),1)) from books ;
select id, author from books order by id asc limit 10 ; 
select id, author, string_to_array(author,', ') from books order by id asc limit 10 ; 
select id, string_to_array(author,', ') as author from books order by id asc limit 10 ; 
select id, unnest(string_to_array(author,', ')) as author from books order by id asc limit 10 ; 
select id, string_to_array(author,', ') as author from books order by id asc limit 10 ; 
select id, string_to_array(author,', ') as author from books order by id asc limit 10 ; 
select id, t(string_to_array(author,', ')) as author from books order by id asc limit 10 ; 
select id, string_to_array(author,', ') as author from books order by id asc limit 10 ; 
select * from ( select id, string_to_array(author,', ') as author from books order by id asc limit 10 ) as t1 ; 
select t1.id, t1.author from ( select id, string_to_array(author,', ') as author from books order by id asc limit 10 ) as t1 ; 
select t1.id, t1.author, unnest(t1.author) from ( select id, string_to_array(author,', ') as author from books order by id asc limit 10 ) as t1 ; 
create table author ( id bigserial primary key, name text not null unique ) ; 
select  unnest(t1.author) from ( select id, string_to_array(author,', ') as author from books order by id asc limit 10 ) as t1 ; 
select distinct  unnest(t1.author) from ( select id, string_to_array(author,', ') as author from books order by id asc limit 10 ) as t1 ; 
select distinct  unnest(t1.author) from ( select id, string_to_array(author,', ') as author from books order by id asc limit 10 ) as t1 ; 
select  unnest(t1.author) from ( select id, string_to_array(author,', ') as author from books order by id asc limit 10 ) as t1 ; 
select distinct  unnest(t1.author) from ( select id, string_to_array(author,', ') as author from books order by id asc limit 10 ) as t1 ; 
select distinct  unnest(t1.author) as author  from ( select id, string_to_array(author,', ') as author from books order by id asc limit 10 ) as t1 ; 
select distinct  unnest(t1.author) as author  from ( select id, string_to_array(author,', ') as author from books order by id asc ) as t1 ; 
insert into author ( name) select distinct  unnest(t1.author) as author  from ( select id, string_to_array(author,', ') as author from books order by id asc ) as t1 ; 
create table book_author ( id bigserial primary key , book bigint not null references books(id), author not null references author(id), unique(book, author)); 
create table book_author ( id bigserial primary key , book bigint not null references books(id), author bigint not null references author(id), unique(book, author)); 
select id, author from books order by id asc limit 10 ; 
select id, string_to_array(author, ', ') from books order by id asc limit 10 ; 
select id, unnest(string_to_array(author, ', ')) from books order by id asc limit 10 ; 
select books.id as id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc limit 10 ; 
select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc limit 10 ; 
select t1.book_id, t1.author_name from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc limit 10 ) as t1; 
select t1.book_id, t1.author_name from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc limit 10 ) as t1; 
select t1.book_id, t1.author_name from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc limit 10 ) as t1 join author on author.name=t1.author_name ; 
select t1.book_id, t1.author_name, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc limit 10 ) as t1 join author on author.name=t1.author_name ; 
select distinct t1.book_id, t1.author_name, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc limit 10 ) as t1 join author on author.name=t1.author_name ; 
select t1.book_id, t1.author_name, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc limit 10 ) as t1 join author on author.name=t1.author_name ; 
select t1.book_id, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc limit 10 ) as t1 join author on author.name=t1.author_name ; 
insert into book_author ( book, author) select t1.book_id, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc ) as t1 join author on author.name=t1.author_name ; 
insert into book_author ( book, author) select t1.book_id, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc ) as t1 join author on author.name=t1.author_name ; 
insert into book_author ( book, author) select t1.book_id, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc ) as t1 join author on author.name=t1.author_name on conflict do nothing ; 
insert into book_author ( book, author) select t1.book_id, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc ) as t1 join author on author.name=t1.author_name on conflict do nothing ; 
delete from book_author ; 
insert into book_author ( book, author) select t1.book_id, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc ) as t1 join author on author.name=t1.author_name  ; 
insert into book_author ( book, author) select t1.book_id, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc ) as t1 join author on author.name=t1.author_name  ; 
select * from book_author ; 
insert into book_author ( book, author) select t1.book_id, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(author, ', ')) as author_name from books order by id asc ) as t1 join author on author.name=t1.author_name on conflict do nothing ; 
\d books
alter table books drop column author ; 
select id, publisher, dimensions from books order by id asc limit 10;
select id, publisher, dimensions from books order by id desc limit 10;
select id, publisher, dimensions from books where publisher not like 'Harper%' order by id desc limit 10;
select id, publisher, string_to_array(dimensions, ' x ') from books where publisher not like 'Harper%' order by id desc limit 10;
select id, publisher, string_to_array(dimensions, ' x ') from books order by id desc limit 10;
alter table books add column dim_width decimal(5,2) ; 
alter table books add column dim_height decimal(5,2) ; 
alter table books add column dim_depth decimal(5,2) ; 
select id, publisher, string_to_array(dimensions, ' x ')[0] from books order by id desc limit 10;
select id, publisher, string_to_array(dimensions, ' x ')[1] from books order by id desc limit 10;
select id, publisher, (string_to_array(dimensions, ' x '))[1] from books order by id desc limit 10;
select id, publisher, NULLIF(regexp_replace((string_to_array(dimensions, ' x '))[1], '\D','','g'), '')::numeric from books order by id desc limit 10;
select id, publisher, NULLIF(regexp_replace((string_to_array(dimensions, ' x '))[1], '\D','','g'), '')::numeric/100 from books order by id desc limit 10;
select id, publisher, round(NULLIF(regexp_replace((string_to_array(dimensions, ' x '))[1], '\D','','g'), '')::numeric/100,2) from books order by id desc limit 10;
select id, publisher, (string_to_array(dimensions, ' x '))[1] from books order by id desc limit 10;
select * from ( select id, publisher, (string_to_array(dimensions, ' x '))[1] from books order by id desc limit 10 ) as t1 ; 
select * from ( select id, publisher, (string_to_array(dimensions, ' x '))[1] as width from books order by id desc limit 10 ) as t1 ; 
select id, width from ( select id, publisher, (string_to_array(dimensions, ' x '))[1] as width from books order by id desc limit 10 ) as t1 ; 
select id, substr(width,1,length(width)-1) from ( select id, publisher, (string_to_array(dimensions, ' x '))[1] as width from books order by id desc limit 10 ) as t1 ; 
select id, substr(width,1,length(width)-1)::numeric from ( select id, publisher, (string_to_array(dimensions, ' x '))[1] as width from books order by id desc limit 10 ) as t1 ; 
select id, substr(width,1,length(width)-1)::numeric as width from ( select id, publisher, (string_to_array(dimensions, ' x '))[1] as width from books order by id desc limit 10 ) as t1 ; 
select id, substr(dims[1],1,length(width)-1)::numeric as width from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dimensions from books order by id desc limit 10 ) as t1 ; 
select id, substr(dims[1],1,length(width)-1)::numeric as width from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ; 
select id, substr(dims[1],1,length(dims[1])-1)::numeric as width from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ; 
select id, substr(dims[1],1,length(dims[1])-1)::numeric as width,  substr(dims[2],1,length(dims[2])-1)::numeric as height,  substr(dims[3],1,length(dims[3])-1)::numeric as depth  from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ; 
select id, substr(dims[1],1,length(dims[1])-1)::numeric as width,  substr(dims[2],1,length(dims[2])-1)::numeric as height,  substr(dims[3],1,length(dims[3])-1)::numeric as depth  from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ; 
update books set books.width = t2.width from ( select id, substr(dims[1],1,length(dims[1])-1)::numeric as width,  substr(dims[2],1,length(dims[2])-1)::numeric as height,  substr(dims[3],1,length(dims[3])-1)::numeric as depth  from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ) as t2 where t2.id=books.id ; 
update books set width = t2.width from ( select id, substr(dims[1],1,length(dims[1])-1)::numeric as width,  substr(dims[2],1,length(dims[2])-1)::numeric as height,  substr(dims[3],1,length(dims[3])-1)::numeric as depth  from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ) as t2 where t2.id=books.id ; 
update books set books.width = t2.width from ( select id, substr(dims[1],1,length(dims[1])-1)::numeric as width,  substr(dims[2],1,length(dims[2])-1)::numeric as height,  substr(dims[3],1,length(dims[3])-1)::numeric as depth  from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ) as t2 where t2.id=books.id ; 
update books set books.dim_width = t2.width from ( select id, substr(dims[1],1,length(dims[1])-1)::numeric as width,  substr(dims[2],1,length(dims[2])-1)::numeric as height,  substr(dims[3],1,length(dims[3])-1)::numeric as depth  from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ) as t2 where t2.id=books.id ; 
update books set dim_width = t2.width from ( select id, substr(dims[1],1,length(dims[1])-1)::numeric as width,  substr(dims[2],1,length(dims[2])-1)::numeric as height,  substr(dims[3],1,length(dims[3])-1)::numeric as depth  from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ) as t2 where t2.id=books.id ; 
update books set dim_width = t2.width set dim_height=t2.height set dim_depth=t2.depth from ( select id, substr(dims[1],1,length(dims[1])-1)::numeric as width,  substr(dims[2],1,length(dims[2])-1)::numeric as height,  substr(dims[3],1,length(dims[3])-1)::numeric as depth  from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ) as t2 where t2.id=books.id ; 
update books set dim_width = t2.width, dim_height=t2.height set dim_depth=t2.depth from ( select id, substr(dims[1],1,length(dims[1])-1)::numeric as width,  substr(dims[2],1,length(dims[2])-1)::numeric as height,  substr(dims[3],1,length(dims[3])-1)::numeric as depth  from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ) as t2 where t2.id=books.id ; 
update books set dim_width = t2.width, dim_height=t2.height, dim_depth=t2.depth from ( select id, substr(dims[1],1,length(dims[1])-1)::numeric as width,  substr(dims[2],1,length(dims[2])-1)::numeric as height,  substr(dims[3],1,length(dims[3])-1)::numeric as depth  from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc limit 10 ) as t1 ) as t2 where t2.id=books.id ;
\e#
\e
update books set dim_width = t2.width, dim_height=t2.height, dim_depth=t2.depth from ( select id, substr(dims[1],1,length(dims[1])-1)::numeric as width,  substr(dims[2],1,length(dims[2])-1)::numeric as height,  substr(dims[3],1,length(dims[3])-1)::numeric as depth  from ( select id, publisher, (string_to_array(dimensions, ' x ')) as dims from books order by id desc ) as t1 ) as t2 where t2.id=books.id ;
alter table books drop column dimensions ; 
\d books
select id, dim_width, dim_height, dim_depth from books limit 10 ; 
select id, dim_width, dim_height, dim_depth, dim_height*dim_width as volume from books limit 10 ; 
select id, dim_width, dim_height, dim_depth, dim_height*dim_width as area from books limit 10 ; 
select id, dim_width, dim_height, dim_depth, dim_height*dim_width as area, dim_height*dim_width*dim_depth as volume from books limit 10 ; 
\?
\s history.txt 
