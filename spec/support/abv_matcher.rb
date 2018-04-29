RSpec::Matchers.define :have_same_abv_as do |expected|
  match do | actual |
    actual.abv == expected.abv
  end

  description do
    "have abv equaling #{expected.abv}"
  end

  failure_message do |actual|
    "expected brew #{actual.name} to have abv #{expected.abv}, was #{actual.abv}"
  end

  failure_message_when_negated do |actual|
    "expected brew #{actual.name} not to have abv #{expected.abv}, but it was"
  end

end