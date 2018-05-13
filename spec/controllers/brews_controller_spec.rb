require 'rails_helper'

RSpec.describe BrewsController, type: :controller do

  describe "create" do
    let (:brewery) { FactoryBot.create(:brewery) }
    
    it "calls the workflow with parameters" do
      workflow = instance_spy(CreatesBrew, success?: true)
      allow(CreatesBrew).to receive(:new).and_return(workflow)
      post :create, {
        params: {brew: 
          {
            name: "Stubbed brew",
            abv: 0.99.to_s,
            ibus: 1000.00.to_s,
            classification: "Stubbed classification",
            brewery: brewery.id.to_s
          }}
      }
      expect(CreatesBrew).to have_received(:new)
        .with(
          name: "Stubbed brew",
          abv: 0.99.to_s,
          ibus: 1000.00.to_s,
          classification: "Stubbed classification",
          brewery_id: brewery.id.to_s
        )
    end
  end

end
