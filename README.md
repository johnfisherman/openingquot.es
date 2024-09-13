# openingquotes.com (working title)

_Unearthing mankind's best quotes, one epigraph at a time_

This webapp is being developed by me, [Fred Rocha](https://fredrocha.net/), in public. You can tag along
for the adventure [here](https://fredrocha.net/2024/08/07/building-a-crud-application-using-ruby-on-rails-in-2024/).

Some novelists choose to open their books with a quote from another writer. This is called an [epigraph](<https://en.wikipedia.org/wiki/Epigraph_(literature)>). These quotes
taken out of their original context are given a new life, necessarily detached from the former one. Since writers are
the utmost specialists in their fields, and since the beginning of a work has such relevance to the whole, I risk saying
that these selected quotes will necessarily be the crème de la crème of the world’s literature. Change my mind.

This website / webapp will be a repository for those epigraphs. Send your own favorites.

## Running the project

### Install Postgres

### on Ubuntu

`sudo apt update`
`sudo apt install postgresql postgresql-contrib libpq-dev`
`sudo -u postgres createuser -s <your-username> -P`

`bundle install`

### macos, using homebrew

`xcode-select --install`
`brew update`
`brew install postgresql`

From the root of the project, do:

`bundle install`

`brew services start postgresql`
`psql postgres`

Key in:

`CREATE ROLE fred  WITH LOGIN PASSWORD 'pantera1234';`
`ALTER ROLE fred CREATEDB;`

`bin/rails db:create db:migrate db:seed`

You're done

### Compiling SASS styles

### Dev

Run this command from the root of the project (it also runs the Puma server for you):

`./bin/dev`
