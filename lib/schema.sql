-- Build out the schema for our Fantasy Library database:

-- 1. All tables must have a `PRIMARY KEY` on the id
-- 2. `Series` have a title and belong to an author and a sub-genre
-- 3. A `Sub-Genre` has a name
-- 4. `Authors` have a name
-- 5. `Books` have a title and year and belong to a series
-- 6. `Characters` have a name, motto, and species and belong to an author and a series
-- 7. `Books` have many characters and characters are in many books in a series. How do we accomplish this complex association? With a join table between Characters and Books. This join table (let's call it character_books) will just have -in addition to its primary key- two foreign key columns for the character and book ids. Each row in this join table acts as a relation between a book and a character.

create table series (
id INTEGER PRIMARY KEY,
title TEXT, 
author_id INTEGER, 
subgenre_id INTEGER);

create table subgenres (
id INTEGER PRIMARY KEY, 

name TEXT);

create table authors (
id INTEGER PRIMARY KEY, 

name TEXT);

create table books (
id INTEGER PRIMARY KEY, 
title TEXT, 
year REAL, 
series_id TEXT);

create table characters (
id INTEGER PRIMARY KEY,
name TEXT,
motto TEXT,
species TEXT,
author_id TEXT,
series_id INTEGER); 

create table character_books (
id INTEGER PRIMARY KEY, 
book_id INTEGER,
character_id INTEGER);



