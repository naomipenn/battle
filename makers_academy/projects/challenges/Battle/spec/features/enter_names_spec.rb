feature "Enter names" do
  scenario "submitting names" do
    visit "/"
    fill_in :player_1_name, with: "Sara"
    fill_in :player_2_name, with: "Zelda"
    click_button "Submit"
    expect(page).to have_content "Sara vs. Zelda"
  end
end
