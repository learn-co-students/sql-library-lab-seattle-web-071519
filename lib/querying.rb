def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books WHERE books.series_id = 1  "
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters WHERE length(motto) = (SELECT MAX(length(motto)) FROM characters)"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS prevalence FROM characters Group by species ORDER BY prevalence DESC Limit 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM authors JOIN series ON series.author_id = authors.id JOIN subgenres ON subgenres.id = series.subgenre_id"
  # Authors -> series -> subgenre
end

def select_series_title_with_most_human_characters
  sql = <<-SQL
  SELECT series.title FROM characters JOIN series ON series.id = characters.series_id WHERE species = 'human' GROUP BY series_id ORDER BY count(species) DESC LIMIT 1
  SQL

end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, count(character_id) FROM characters JOIN character_books ON character_id = characters.id GROUP BY character_id ORDER BY count(character_id) DESC, characters.name ASC"
end
