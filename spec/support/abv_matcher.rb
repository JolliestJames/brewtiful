RSpec::Matchers.define :be_abv do |expected|
  match do | actual |
    actual == expected
  end
end