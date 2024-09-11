# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Populate Authors
["Paul Auster", "Salman Rushdie", "Fred Rocha", "Ernest Hemingway", "Gertrude Stein", "Hunter S. Thompson", "Samuel Johnson", "Ray Bradbury", "Juan Ramón Jiménez", "Arundathi Roy", "John Berger", "Justin Torres", "Plato", "Vladimir Nabokov", "James Boswell", "Chang-rae Lee", "Thomas Mann"].each do |author_name|
    Author.find_or_create_by!(name: author_name)
end

# Populate Books
Book.new(title: "Victory City", year: 2023, author_id: 2,).save
Book.new(title: "Ilha da Contera", year: 2022, author_id: 3).save
Book.new(title: "The Satanic Verses", year: 1988, author_id: 2).save
Book.new(title: "The Sun Also Rises", year: 1988, author_id: 4).save
Book.new(title: "Fear and Loathing in Las Vegas", year: 1971, author_id: 6).save
Book.new(title: "Fahrenheit 451", year: 1953, author_id: 8).save
Book.new(title: "The God of Small Things", year: 1997, author_id: 10).save
Book.new(title: "We the Animals", year: 2011, author_id: 12).save
Book.new(title: "Pale Fire", year: 1962, author_id: 14).save
Book.new(title: "My Year Abroad", year: 2021, author_id: 16).save

# Populate Quotes
Quote.new(body: "You are all a lost generation.", book_id: 4, author_id: 5).save
Quote.new(body: "He who makes a beast of himself gets rid of the pain of being a man.", book_id: 5, author_id: 7).save
Quote.new(body: "If they give you ruled paper, write the other way.", book_id: 6, author_id: 9).save
Quote.new(body: "Never again will a single story be told as though it’s the only one.", book_id: 7, author_id: 11).save
Quote.new(body: "Now a boy is of all wild beasts the most difficult to manage. For by how much the more he has the fountain of prudence not fitted up, he becomes crafty and keen, and the most insolent of wild beasts. On this account it is necessary to bind him, as it were, with many chains.", book_id: 8, author_id: 13).save
Quote.new(body: "This reminds me of the ludicrous account he gave Mr. Langton, of the despicable state of a young gentleman of good family. 'sir, when I heard of him last, he was running about town shooting cats.' And then in a sort of kindly reverie, he bethought himself of his own favorite cat, and said, 'But Hodge shan't be shot: no, no, Hodge shall not be shot.", book_id: 9, author_id: 15).save
Quote.new(body: "He who truly loves the world shapes himself to please it.", book_id: 10, author_id: 17).save

