require "rails_helper"

RSpec.feature "Users can edit existing projects" do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, name: "Atom") }

  before do
    login_as(user)
    assign_role!(user, :viewer, project)
    visit "/"
    click_link "Atom"
    click_link "Edit Project"
  end

  scenario "with valid attributes" do

    fill_in "Name", with: "Atom Atom Atom"
    click_button "Update Project"
    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "Atom Atom Atom"
  end

  scenario "when providing invalid attributes" do

    fill_in "Name", with: ""
    click_button "Update Project"
    expect(page).to have_content "Project has not been updated"
  end
end
