feature 'viewing links' do
  scenario 'user can see list of links' do
    visit '/'
    expect(page).to have_content("http://www.makerscademy.com")
    expect(page).to have_content("http://www.facebook.com")
    expect(page).to have_content("http://www.google.com")
  end
end
