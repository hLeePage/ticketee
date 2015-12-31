require "rails_helper"

RSpec.feature "Users can view tickets" do
  before do
    author = FactoryGirl.create(:user)

    atom = FactoryGirl.create(:project, name: "Atom")
    assign_role!(author, :viewer, atom)
    FactoryGirl.create(:ticket, project: atom,
                       author: author,
                       name: "Get on up!",
                       description: "You got to stay on the scene.")

    ie = FactoryGirl.create(:project, name: "Internet Explorer")
    assign_role!(author, :viewer, ie)
    FactoryGirl.create(:ticket, project: ie,
                       name: "Standards compliance",
                       author: author,
                       description: "This is so poor, people.")
    login_as(author)
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
