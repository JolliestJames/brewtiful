RSpec::Matchers.define :be_brew do |expected|
  match do | actual |
    actual == expected
  end

  description do
    "have brew equaling #{expected}"
  end

  failure_message do |actual|
    "expected brew #{actual.name} to be brew #{expected}, was #{actual}"
  end

  failure_message_when_negated do |actual|
    "expected brew #{actual.name} not to be brew #{expected}, but it was"
  end

end