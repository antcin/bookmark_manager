feature 'deleting a link' do
  scenario 'a user can delete a link' do
    link = Link.add(url: 'http://testexample.com', title: 'Test Link')
    visit('/')

    within "#link-#{link.id}" do
      click_button 'Delete'
    end

    expect(current_path).to eq '/'
    expect(page).not_to have_content 'Test Link'
  end
end
