feature "Attacking" do

  scenario "attack Player 2" do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content "Sara attacked Zelda"
  end

  scenario "be attacked by Player 2" do
    sign_in_and_play
    click_button "Attack"
    click_button "OK"
    click_button "Attack"
    expect(page).to have_content "Zelda attacked Sara"
  end

  scenario "reduce Player 2 HP by 10" do
    sign_in_and_play
    click_button "Attack"
    click_button "OK"
    expect(page).not_to have_content "Zelda: 60HP"
    expect(page).to have_content "Zelda: 50HP"
  end

  scenario "reduce Player 1 HP by 10" do
    sign_in_and_play
    click_button "Attack"
    click_button "OK"
    click_button "Attack"
    click_button "OK"
    expect(page).not_to have_content "Sara: 60HP"
    expect(page).to have_content "Sara: 50HP"
  end

end
