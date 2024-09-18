# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

include Slugs

# Populate Authors
[ "Ernest Hemingway", "Gertrude Stein", "Hunter S. Thompson", "Samuel Johnson", "Ray Bradbury", "Juan Ramón Jiménez", "Arundathi Roy", "John Berger", "Justin Torres", "Plato", "Vladimir Nabokov", "James Boswell", "Chang-rae Lee", "Thomas Mann", "Graham Greene", "James Hardy", "Dawn O'Porter" ].each do |author_name|
    # Author.find_or_create_by!(name: author_name)
    Author.find_or_create_by!(name: author_name, slug: create_slug(author_name))
end

# Populate Books
Book.new(title: "The Sun Also Rises", year: 1988, author_id: 1, slug: create_slug("The Sun Also Rises"), isbn: 666).save
Book.new(title: "Fear and Loathing in Las Vegas", year: 1971, author_id: 3, slug: create_slug("Fear and Loathing in Las Vegas"), isbn: 666).save
Book.new(title: "Fahrenheit 451", year: 1953, author_id: 5, slug: create_slug("Fahrenheit 451"), isbn: 666).save
Book.new(title: "The God of Small Things", year: 1997, author_id: 7, slug: create_slug("The God of Small Things"), isbn: 666).save
Book.new(title: "We the Animals", year: 2011, author_id: 9, slug: create_slug("We the Animals"), isbn: 666).save
Book.new(title: "Pale Fire", year: 1962, author_id: 11, slug: create_slug("Pale Fire"), isbn: 666).save
Book.new(title: "My Year Abroad", year: 2021, author_id: 13, slug: create_slug("My Year Abroad"), isbn: 666).save
Book.new(title: "The Comedians", year: 1966, author_id: 15, slug: create_slug("The Comedians"), isbn: 666).save
Book.new(title: "So Lucky", year: 2020, author_id: 17, slug: create_slug("So Lucky"), isbn: 666).save

# Populate Quotes
quoteBody = "You are all a lost generation."
Quote.new(body: quoteBody, book_id: 1, author_id: 2, slug: create_slug(quoteBody.truncate_words(12))).save
quoteBody = "He who makes a beast of himself gets rid of the pain of being a man."
Quote.new(body: quoteBody, book_id: 2, author_id: 4, slug: create_slug(quoteBody.truncate_words(12))).save
quoteBody = "If they give you ruled paper, write the other way."
Quote.new(body: quoteBody, book_id: 3, author_id: 6, slug: create_slug(quoteBody.truncate_words(12))).save
quoteBody = "Never again will a single story be told as though it’s the only one."
Quote.new(body: quoteBody, book_id: 4, author_id: 8, slug: create_slug(quoteBody.truncate_words(12))).save
quoteBody = "Now a boy is of all wild beasts the most difficult to manage. For by how much the more he has the fountain of prudence not fitted up, he becomes crafty and keen, and the most insolent of wild beasts. On this account it is necessary to bind him, as it were, with many chains."
Quote.new(body: quoteBody, book_id: 5, author_id: 10, slug: create_slug(quoteBody.truncate_words(12))).save
quoteBody = "This reminds me of the ludicrous account he gave Mr. Langton, of the despicable state of a young gentleman of good family. 'sir, when I heard of him last, he was running about town shooting cats.' And then in a sort of kindly reverie, he bethought himself of his own favorite cat, and said, 'But Hodge shan't be shot: no, no, Hodge shall not be shot."
Quote.new(body: quoteBody, book_id: 6, author_id: 12, slug: create_slug(quoteBody.truncate_words(12))).save
quoteBody = "He who truly loves the world\nshapes \r\nhimself to please it."
Quote.new(body: quoteBody, book_id: 7, author_id: 14, slug: create_slug(quoteBody.truncate_words(12))).save
quoteBody = "Aspects are within us\r\nand who seems\r\nMost kingly is the King."
Quote.new(body: quoteBody, book_id: 8, author_id: 16, slug: create_slug(quoteBody.truncate_words(12))).save
quoteBody = "Luck: Success or failure apparently brought by chance rather than through one's own actions."
Quote.new(body: quoteBody, book_id: 9, author_id: 17, slug: create_slug(quoteBody.truncate_words(12))).save
