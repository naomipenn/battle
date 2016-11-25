feature "Attacking" do
  scenario "attack Player 2" do
    sign_in_and_play
    click_link "Attack"
    expect(page).to have_content "Sara attacked Zelda"
  end
end
