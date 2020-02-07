require 'rails_helper'

RSpec.describe "When a user visits the contestant index page", type: :feature do
  it "sees the name of the contestant and all projects they've been on" do

    challenge1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    project1 = Project.create!(name: 'Litfit', material: "Lamp Shade", challenge_id: challenge1.id)
    project2 = Project.create!(name: 'Upholstery Tuxedo', material: "Couch", challenge_id: challenge1.id)
    contestant1 = Contestant.create!(name: "Kentaro Kameyama", age: 34, hometown: "Denver", years_of_experience: "7")
    contestant2 = Contestant.create!(name: "Jay McCarrol", age: 40, hometown: "Aspen", years_of_experience: "10")
    contestant_project1 = ContestantProject.create!(contestant_id: contestant1.id, project_id: project1.id)
    contestant_project2 = ContestantProject.create!(contestant_id: contestant2.id, project_id: project1.id)
    contestant_project3 = ContestantProject.create!(contestant_id: contestant2.id, project_id: project2.id)

    visit "/contestants"

    within "#contestant-#{contestant1.id}" do
      expect(page).to have_content("Kentaro Kameyama")
      expect(page).to have_content("Litfit")
    end

    within "#contestant-#{contestant2.id}" do
      expect(page).to have_content("Jay McCarrol")
      expect(page).to have_content("Litfit", "Upholstery Tuxedo")
    end
  end
end
