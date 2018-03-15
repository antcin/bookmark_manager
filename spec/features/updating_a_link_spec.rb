feature 'updating a link' do
  scenario 'user can update link' do
    visit '/update-link/1'

    fill_in('url', with: 'http://ricky.hewitt.tech')
    fill_in('title', with: 'Ant Cin')
    click_button('Submit')

    expect(current_path).to eq '/'
    expect(page).not_to have_content 'Ricky Hewitt Tech'
    expect(page).to have_content 'Ant Cin'
  end
end
