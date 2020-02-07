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

RSpec.describe "When a user visits a project's show page", type: :feature do
  it "it sees the number of contestants on this project" do
    challenge1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    project1 = Project.create!(name: 'Litfit', material: "Lamp Shade", challenge_id: challenge1.id)
    project2 = Project.create!(name: 'Upholstery Tuxedo', material: "Couch", challenge_id: challenge1.id)
    contestant1 = Contestant.create!(name: "Kentaro Kameyama", age: 34, hometown: "Denver", years_of_experience: "7")
    contestant2 = Contestant.create!(name: "Jay McCarrol", age: 40, hometown: "Aspen", years_of_experience: "10")
    contestant_project1 = ContestantProject.create!(contestant_id: contestant1.id, project_id: project1.id)
    contestant_project2 = ContestantProject.create!(contestant_id: contestant2.id, project_id: project1.id)
    contestant_project3 = ContestantProject.create!(contestant_id: contestant2.id, project_id: project2.id)

    visit "/projects/#{project1.id}"

    expect(page).to have_content("Number of Contestants: 2")
  end
end
