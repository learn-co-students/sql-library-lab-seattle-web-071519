

def select_books_titles_and_years_in_first_series_order_by_year
  "select books.title, books.year
   from series
   inner join books
   on books.series_id = series.id
   where series_id = 1"
end

def select_name_and_motto_of_char_with_longest_motto
  "select characters.name, characters.motto
  from characters
  order by characters.motto asc limit 1"
end


def select_value_and_count_of_most_prolific_species
  "select characters.species, count(characters.species) as count
  from characters
  group by characters.species 
  order by count desc limit 1"
end

def select_name_and_series_subgenres_of_authors
  "select authors.name, subgenres.name
  from series
  inner join authors
  on authors.id = series.author_id
  inner join subgenres 
  on series.subgenre_id = subgenres.id
  group by authors.id"
end

def select_series_title_with_most_human_characters
  "select series.title
  from characters 
  inner join series
  on series.id = characters.series_id
  inner join character_books
  on characters.id = character_books.character_id
  where characters.species = 'human'
  group by series.title
  order by count(characters.species) desc limit 1
"
end
# INSERT INTO series (id, title, author_id, subgenre_id) VALUES (1, "A Song of Ice and Fire", 1, 1), (2, "Second Series", 2, 2);
# INSERT INTO subgenres (id, name) VALUES (1, "medieval"), (2, "space opera");
# INSERT INTO authors (id, name) VALUES (1, "George R. R. Martin"), (2, "Second Author");
# INSERT INTO books (id, title, year, series_id) VALUES (1, "Game of Thrones", 1996, 1), (2, "A Clash of Kings", 1998, 1), (3, "A Storm of Swords", 2000, 1), (4, "First Book", 2002, 2), (5, "Second Book", 2003, 2), (6, "Third Book", 2005, 2);
# INSERT INTO characters (id, name, motto, species, author_id, series_id) VALUES (1, "Lady", "Woof Woof", "direwolf", 1, 1), (2, "Tyrion Lannister", "A Lannister always pays his debts", "human", 1, 1), (3, "Daenerys Targaryen", "If I look back I am lost", "human", 1, 1), (4, "Eddard Stark", "Winter is coming", "human", 1, 1);
# INSERT INTO characters (id, name, motto, species, author_id, series_id) VALUES (5, "Character One", "motto one", "cylon", 2, 2), (6, "Character Two", "motto two", "human", 2, 2), (7, "Character Three", "motto three", "cylon", 2, 2), (8, "Character Four", "motto four", "cylon", 2, 2);
# INSERT INTO character_books (id, book_id, character_id) VALUES (1, 1, 1), (2, 1, 2), (3, 2, 2), (4, 3, 2), (5, 1, 3), (6, 2, 3), (7, 3, 3), (8, 1, 4);
# INSERT INTO character_books (id, book_id, character_id) VALUES (9, 4, 5), (10, 4, 6), (11, 5, 6), (12, 6, 6), (13, 4, 7), (14, 5, 7), (15, 6, 7), (16, 4, 8);


def select_character_names_and_number_of_books_they_are_in
  "select characters.name, count(book_id)
  from character_books
  inner join characters 
  
  on characters.id = character_books.character_id
  group by characters.name
  order by count(book_id) desc"
end
