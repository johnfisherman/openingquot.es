# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://openingquot.es"
SitemapGenerator::Sitemap.sitemaps_path = "sitemap/"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add about_path, priority: 0.7, changefreq: "daily"
  add authors_path, priority: 0.7, changefreq: "daily"
  add books_path, priority: 0.7, changefreq: "daily"
  add quotes_path, priority: 0.7, changefreq: "daily"

  # Add dynamic URLs generated by your Rails routes
  Author.find_each do |author|
    add author_path(author), lastmod: author.updated_at
  end
  Book.find_each do |book|
    add book_path(book), lastmod: book.updated_at
  end
  Quote.find_each do |quote|
    add quote_path(quote), lastmod: quote.updated_at
  end
end
