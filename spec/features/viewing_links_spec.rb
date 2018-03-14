feature 'viewing links' do
  scenario 'user can see list of links' do
    visit '/'
    expect(page).to have_content("Makers Academy")
    expect(page).to have_content("Facebook")
    expect(page).to have_content("Google")
  end
end
