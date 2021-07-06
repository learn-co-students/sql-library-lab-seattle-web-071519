require 'pry'

def select_books_titles_and_years_in_first_series_order_by_year
  sql = <<-SQL
  SELECT books.title, books.year
  FROM books
  WHERE books.series_id = 1 
  ORDER BY books.year;
  SQL
end

# use the .length to represent the full length of the characters moto 
# use DESC to select name 
def select_name_and_motto_of_char_with_longest_motto
  sql = <<-SQL
  SELECT characters.name, motto
  FROM characters
  ORDER BY LENGTH(characters.motto)
  DESC LIMIT 1;
  SQL 

end

def select_value_and_count_of_most_prolific_species
  sql = <<-SQL
  SELECT characters.species, count(character.species)
  FROM characters
  GROUP BY character.species
  ORDER BY count(*) 
  DESC LIMIT -1;
  SQL
end

def select_name_and_series_subgenres_of_authors
  sql = <<-SQL
  SELECT authors.name, subgenres.name
  FROM authors
  INNER JOIN series ON series.author_id = authors.id
  INNER JOIN subgenres ON subgenres.id = series.subgenre_id;
SQL
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

def select_character_names_and_number_of_books_they_are_in
  "select characters.name, count(book_id)
  from character_books
  inner join characters 
  on characters.id = character_books.character_id
  group by characters.name
  order by count(book_id) desc"
end
