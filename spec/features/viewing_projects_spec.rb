require "rails_helper"

RSpec.feature "Users can view projects" do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, name: "Atom") }

  before do
    login_as(user)
    assign_role!(user, :viewer, project)
  end

  scenario "with project details" do
    visit "/"
    click_link "Atom"
    expect(page.current_url).to eq project_url(project)
  end
end
