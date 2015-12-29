require "rails_helper"

RSpec.feature "Users can view tickets" do
  before do
    atom = FactoryGirl.create(:project, name: "Atom")
    FactoryGirl.create(:ticket, project: atom,
                       name: "Get on up!",
                       description: "You got to stay on the scene.")

    ie = FactoryGirl.create(:project, name: "Internet Explorer")
    FactoryGirl.create(:ticket, project: ie,
                       name: "Standards compliance",
                       description: "This is so poor, people.")
    visit "/"
  end

  scenario "for a given project" do
    click_link "Atom"

    expect(page).to have_content "Get on up!"
    expect(page).to_not have_content "Standards compliance"

    click_link "Get on up!"
    within("#ticket h2") do
      expect(page).to have_content "Get on up!"
    end
    expect(page).to have_content "You got to stay on the scene."
  end
end
