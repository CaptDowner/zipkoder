class Zip < ActiveRecord::Base
include PgSearch
  paginates_per 25
  pg_search_scope :search, :against => [:zip, :state_2, :city]
  $states =
 { 'AL' => 'Alabama',        'AK' => 'Alaska',               'AS' => 'American Samoa',  'AZ' => 'Arizona',  
   'AR' => 'Arkansas',       'CA' => 'California',           'CO' => 'Colorado',        'CT' => 'Connecticut', 
   'DE' => 'Delaware',       'DC' => 'District of Columbia', 'FL' => 'Florida',         'GA' => 'Georgia',
   'GU' => 'Guam',           'HI' => 'Hawaii',               'ID' => 'Idaho',           'IL' => 'Illinois', 
   'IN' => 'Indiana',        'IA' => 'Iowa',                 'KS' => 'Kansas',          'KY' => 'Kentucky', 
   'LA' => 'Louisiana',      'ME' => 'Maine',                'MP' => 'Mariana Islands', 'MD' => 'Maryland',
   'MA' => 'Massachusetts',  'MI' => 'Michigan',             'MN' => 'Minnesota',       'MS' => 'Mississippi',
   'MO' => 'Missouri',       'MT' => 'Montana',              'NE' => 'Nebrasks',        'NV' => 'Nevada',
   'NH' => 'New Hampshire',  'NJ' => 'New Jersey',           'NM' => 'New Mexico',      'NY' => 'New York',
   'NC' => 'North Carolina', 'ND' => 'North Dakota',         'OH' => 'Ohio',            'OK' => 'Oklahoma',
   'OR' => 'Oregon',         'PA' => 'Pennsylvania',         'PR' => 'Puerto Rico',     'RI' => 'Rhode Island',
   'SC' => 'South Carolina', 'SD' => 'South Dakota',         'TN' => 'Tennessee',       'TX' => 'Texas',
   'UT' => 'Utah',           'VT' => 'Vermont',              'VA' => 'Virginia',        'VI' => 'Virgin Islands',
   'WA' => 'Washington',     'WV' => 'West Virginia',        'WI' => 'Wisconsin',       'WY' => 'Wyoming'
};
 
  def self.text_search(query)
#   binding.pry
    if query.present?
      where(%w[zip state_2 city].map {|c| "zips.#{c} LIKE :query" }.join(" OR "), query: "%#{query}%")
    else
      scoped
    end
  end
end
