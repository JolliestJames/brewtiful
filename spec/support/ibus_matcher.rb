RSpec::Matchers.define :have_same_ibus_as do |expected|
  match do | actual |
    actual.ibus == expected.ibus
  end

  description do
    "have ibus equaling #{expected.ibus}"
  end

  failure_message do |actual|
    "expected brew #{actual.name} to have ibus #{expected.ibus}, was #{actual.ibus}"
  end

  failure_message_when_negated do |actual|
    "expected brew #{actual.name} not to have ibus #{expected.ibus}, but it was"
  end

end