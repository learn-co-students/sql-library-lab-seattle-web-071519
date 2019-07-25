def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books WHERE books.series_id = 1 ORDER BY books.year"
end

def  select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters GROUP BY name HAVING LENGTH(motto) = (SELECT MAX(LENGTH(motto)) FROM characters)"
end


def select_value_and_count_of_most_prolific_species
  <<-SQL
  SELECT characters.species, COUNT(characters.species) 
  FROM characters 
  GROUP BY characters.species ORDER BY COUNT(characters.species) DESC LIMIT 1
  SQL
end

def select_name_and_series_subgenres_of_authors
  <<-SQL 
    SELECT authors.name, subgenres.name 
    FROM authors 
    JOIN series 
    ON authors.id = series.author_id JOIN subgenres 
    ON series.subgenre_id = subgenres.id
  SQL
end

def select_series_title_with_most_human_characters
  <<-SQL
  SELECT series.title 
  FROM series 
  JOIN characters ON series.id = characters.series_id 
  WHERE characters.species = 'human' 
  GROUP BY series.title
  ORDER BY COUNT(*) DESC LIMIT 1
  SQL
end

def select_character_names_and_number_of_books_they_are_in
  <<-SQL
  SELECT characters.name, COUNT(*) as book_count
  FROM character_books 
  JOIN characters ON characters.id = character_books.character_id 
  GROUP BY characters.name ORDER BY COUNT(*) DESC
  SQL
end
