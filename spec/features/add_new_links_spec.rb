feature 'adding new links' do
  scenario 'user can add a new link' do
    visit('/')
    fill_in('url', with: 'http://ricky.hewitt.tech')
    click_button('Add')
    expect(page).to have_content('http://ricky.hewitt.tech')
  end
end
