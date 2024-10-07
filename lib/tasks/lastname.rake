namespace :lastname do
    desc "Populate Authors Last Name"
    task :run => :environment do 
      puts "Populating authors last names."
      authors = Author.all
      authors.each do |author|
        author.last_name = "Doe"
        author.save!
      end
      puts "Done populating!"
    end
  end