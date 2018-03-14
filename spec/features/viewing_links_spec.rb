feature 'viewing links' do
  scenario 'user can see list of links' do
    link = Link.add(url: 'http://ricky.hewitt.tech', title: 'Ricky Hewitt Tech')
    visit '/'

    expect(page).to have_content "Ricky Hewitt Tech"
  end
end
