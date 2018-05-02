require "rails_helper"

RSpec.describe Brewery do
  let(:brewery) { FactoryBot.build_stubbed(:brewery) }
  let(:brew) { FactoryBot.build(:brew) }
  
  it "considers a brewery with no beers to be out of stock" do
    expect(brewery).to be_out_of_stock
  end

  it "knows that a brewery with beers is not out of stock" do
    brewery.brews << brew
    expect(brewery).not_to be_out_of_stock
  end

  it "knows that a brewery has a location" do
    expect(brewery.location).not_to be_nil
  end

  it "knows that a brewery has a name" do
    expect(brewery.name).not_to be_nil
  end

  let(:low_ibus) { FactoryBot.build(:brew, :low_ibus) }
  let(:med_ibus) { FactoryBot.build(:brew, :med_ibus) }
  let(:high_ibus) { FactoryBot.build(:brew, :high_ibus) }

  it "knows that a brewery knows which of its brews is most bitter" do
    brewery.brews = [low_ibus, med_ibus, high_ibus]
    expect(brewery.most_bitter_brew).to have_same_ibus_as(high_ibus)
  end

  it "knows that a brewery with no brews has no brew which is most bitter" do
    expect(brewery.most_bitter_brew).to be_nil
  end

  it "knows that a brewery knows which of its brews is least bitter" do
    brewery.brews = [low_ibus, med_ibus, high_ibus]
    expect(brewery.least_bitter_brew).to have_same_ibus_as(low_ibus)
  end
  
  it "knows that a brewery with no brews has no brew which is least bitter" do
    expect(brewery.least_bitter_brew).to be_nil
  end

  let(:low_abv) { FactoryBot.build(:brew, :low_abv) }
  let(:med_abv) { FactoryBot.build(:brew, :med_abv) }
  let(:high_abv) { FactoryBot.build(:brew, :high_abv) }
 
  it "knows that a brewery knows which of its brews is the strongest" do
    brewery.brews = [low_abv, med_abv, high_abv]
    expect(brewery.strongest_brew).to have_same_abv_as(high_abv)
  end

  it "knows that a brewery with no brews does not have a strongest brew" do
    expect(brewery.strongest_brew).to be_nil
  end

  it "knows that a brewery knows which of its brews is the weakest" do
    brewery.brews = [low_abv, med_abv, high_abv]
    expect(brewery.weakest_brew).to have_same_abv_as(low_abv)
  end

  it "knows that a brewery with no brews does not have a weakest brew" do
    expect(brewery.weakest_brew).to be_nil
  end

end 