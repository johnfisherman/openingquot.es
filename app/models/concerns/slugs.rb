module Slugs
  extend ActiveSupport::Concern

  def create_slug(name)
    name.downcase.strip.gsub(" ", "-").gsub(/[^\w-]/, "")
  end

  def update_slug
    update_attribute :slug, assign_slug(name)
  end

  private def assign_slug(name)
    self.slug = create_slug(name)
  end
end
