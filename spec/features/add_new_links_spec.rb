feature 'adding new links' do
  scenario 'user adds valid link' do
    visit('/')
    fill_in('url', with: 'http://ricky.hewitt.tech')
    fill_in('title', with: 'Ricky Hewitt Tech')
    click_button('Add')
    expect(page).to have_content('Ricky Hewitt Tech')
  end

  scenario 'user adds invalid link' do
    visit('/')
    fill_in('url', with: 'invalid_url')
    fill_in('title', with: 'invalid url')
    click_button('Add')
    expect(page).to have_content('Please enter a valid URL')
  end
end
