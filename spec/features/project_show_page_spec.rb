require 'rails_helper'

RSpec.describe "When a user visits a project's show page" do
  it "it sees that project's name and material" do
    challenge1 = Challenge.create!(theme: "Apartment Furnishings", project_budget: 10)
    project1 = Project.create!(name: 'Litfit', material: "Lamp Shade", challenge_id: challenge1.id)

    visit "/projects/#{project1.id}"


    expect(page).to have_content("Litfit")
    expect(page).to have_content("Lamp Shade")
  end
end
