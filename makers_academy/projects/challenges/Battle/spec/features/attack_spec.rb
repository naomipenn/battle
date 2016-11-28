feature "Attacking" do

  scenario "attack Player 2" do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content "Sara attacked Zelda"
  end

  scenario "be attacked by Player 2" do
    sign_in_and_play
    attack_and_confirm
    click_button "Attack"
    expect(page).to have_content "Zelda attacked Sara"
  end

  context 'when dealing set damage' do
    before do
      allow(Kernel).to receive(:rand).and_return(10)
    end

  scenario "reduce Player 2 HP by 10" do
    sign_in_and_play
    attack_and_confirm
    expect(page).not_to have_content "Zelda: 60HP"
    expect(page).to have_content "Zelda: 50HP"
  end

  scenario "reduce Player 1 HP by 10" do
    sign_in_and_play
    2.times { attack_and_confirm }
    expect(page).not_to have_content "Sara: 60HP"
    expect(page).to have_content "Sara: 50HP"
  end
end

  context 'when dealing with random damage' do
    scenario 'reduce Player 2 HP by a random amount' do
      sign_in_and_play
      attack_and_confirm
      expect(page).not_to have_content 'Zelda: 60HP'
    end

    scenario 'reduce Player 1 HP by a random amount' do
      sign_in_and_play
      2.times { attack_and_confirm }
      expect(page).not_to have_content 'Sara: 60HP'
    end
  end

end
