require 'rails_helper'

RSpec.describe "When a user visits a project's show page", type: :feature do
  it "it sees that project's name, material, and theme of the challenge" do
    challenge1 = Challenge.create!(theme: "Apartment Furnishings", project_budget: 10)
    project1 = challenge1.projects.create!(name: 'Litfit', material: "Lamp Shade")

    visit "/projects/#{project1.id}"

    expect(page).to have_content(project1.name)
    expect(page).to have_content(project1.material)
    expect(page).to have_content(project1.challenge.theme)
  end
end
