require 'pry'

def select_books_titles_and_years_in_first_series_order_by_year
  sql = <<-SQL
    SELECT books.title, books.year FROM books WHERE books.series_id = 1 ORDER BY books.year;
  SQL
end

def select_name_and_motto_of_char_with_longest_motto
  sql = <<-SQL
    SELECT characters.name, characters.motto 
    FROM characters 
    ORDER BY LENGTH(characters.motto) DESC LIMIT 1;
  SQL
end


def select_value_and_count_of_most_prolific_species
  sql = <<-SQL
    SELECT characters.species, COUNT(characters.species) 
    FROM characters 
    GROUP BY characters.species 
    ORDER BY COUNT(*) DESC LIMIT 1;
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
  sql = <<-SQL
    SELECT series.title FROM series
    JOIN books ON books.series_id = series.id
    JOIN character_books ON character_books.book_id = books.id
    JOIN characters ON character_books.character_id = characters.id
    WHERE characters.species = "human"
    GROUP BY series.title
    ORDER BY COUNT(*) DESC LIMIT 1;
  SQL

  # sql = "SELECT series.title, COUNT(characters.species) FROM series JOIN characters ON series.id = characters.series_id WHERE characters.species = 'human';"
end

def select_character_names_and_number_of_books_they_are_in
  sql = <<-SQL
  SELECT characters.name, COUNT(character_books.book_id) FROM characters JOIN character_books ON character_books.character_id = characters.id GROUP BY characters.name ORDER BY COUNT(*) DESC;
  SQL
end
