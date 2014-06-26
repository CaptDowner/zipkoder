def zip_attributes(overrides = {})
  random_number = (0..9).to_a.shuffle[0..10].join
  {
    city:      "Alcatraz #{random_number}",
    state:     "Zidaho",
    state_2:   "ZO",
    zip:       "99999",
    lat:       "38.000000",
    long:      "122.00000",
    tz_offset: "+11:00",
    dst:       "y"
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    firstname: "Capt.",
    lastname: "Downer",
    email: "captdowner@gmail.com",
    password: "sailing",
    password_confirmation: "sailing",
    grand_poobah: true
  }.merge(overrides)
end
