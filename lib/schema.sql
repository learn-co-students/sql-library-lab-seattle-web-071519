CREATE TABLE series ( id INTEGER PRIMARY KEY, title TEXT, author_id int, subgenre_id int) ;
CREATE TABLE subgenres ( id INTEGER PRIMARY KEY, name TEXT); 
CREATE TABLE authors ( id INTEGER PRIMARY KEY, name TEXT) ;
CREATE TABLE books ( id INTEGER PRIMARY KEY, title TEXT, year int, series_id int) ;
CREATE TABLE characters ( id INTEGER PRIMARY KEY, name, motto TEXT, species TEXT, author_id int, series_id int) ;
CREATE TABLE character_books ( id INTEGER PRIMARY KEY, book_id int, character_id int) ;