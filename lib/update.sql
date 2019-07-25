-- # series (id PRIMARY KEY INTEGER,title TEXT, author_id INTEGER, subgenre_id INTEGER);
-- # subgenres (id PRIMARY KEY INTEGER, name TEXT);
-- # authors (id PRIMARY KEY INTEGER,name TEXT);
-- # books (id PRIMARY KEY INTEGER, title TEXT, year REAL, series_id TEXT);
-- # characters (id PRIMARY KEY INTEGER, name TEXT,motto TEXT,species TEXT,author_id TEXT,series_id INTEGER); 
-- # character_books (id PRIMARY KEY INTEGER,book_id INTEGER,character_id INTEGER);

update characters
set species = 'Martian'
where id = (select id from characters order by id desc limit 1);

