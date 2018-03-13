feature 'adding new links' do
  scenario 'user adds valid link' do
    visit('/')
    fill_in('url', with: 'http://ricky.hewitt.tech')
    click_button('Add')
    expect(page).to have_content('http://ricky.hewitt.tech')
  end

  scenario 'user adds invalid link' do
    visit('/')
    fill_in('url', with: 'invalid_url')
    click_button('Add')
    expect(page).to have_content('Please enter a valid URL')
  end
end
