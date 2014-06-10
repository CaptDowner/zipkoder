class Zip < ActiveRecord::Base
include PgSearch
  paginates_per 25
  pg_search_scope :search, :against => [:zip, :state_2, :city]

  def self.text_search(query)
#    binding.pry
    if query.present?
      where(%w[zip state_2 city].map {|c| "zips.#{c} LIKE :query" }.join(" OR "), query: "%#{query}%")
    else
      scoped
    end
  end

end
