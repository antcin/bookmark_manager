describe Link do
  before(:each) do
    @link = Link.add(url: 'http://ricky.hewitt.tech', title: 'Ricky Hewitt Tech')
  end


  describe '#self.all' do
    it 'returns links' do
      links = Link.all

      urls = links.map(&:url)

      expect(urls).to include("http://ricky.hewitt.tech")
    end
  end

  describe '#self.add' do
    it 'adds a link' do
      Link.add(url: 'http://ricky.hewitt.tech')
      links = Link.all
      urls = links.map(&:url)

      expect(urls).to include('http://ricky.hewitt.tech')
    end

    it 'does not add invalid link' do
      Link.add(url: 'fake_link')

      links = Link.all
      urls = links.map(&:url)

      expect(urls).not_to include('fake_link')
    end
  end

  describe '#self.delete' do
    it 'deletes a link' do
      Link.delete(1)

      links = Link.all
      urls = links.map(&:url)

      expect(urls).not_to include 'http://www.makersacademy.com'

    end
  end

  describe '#self.update' do
  it "updates a link" do
    link = Link.add(url: 'https://youtube.com', title: 'Youtube')
    Link.update(link.id, url: 'http://www.notyoutube.com', title: 'Not Youtube')
    links = Link.all
    urls = links.map(&:url)
    titles = links.map(&:title)

    expect(urls).not_to include "https://youtube.com"
    expect(titles).not_to include "Youtube"
    expect(urls).to include "http://www.notyoutube.com"
    expect(titles).to include "Not Youtube"
  end
end

describe '.find' do
  it 'finds a link' do
    new_link = Link.add(url: 'https://youtube.com', title: 'Youtube')
    link = Link.find(new_link.id)

    expect(link.url).to eq "https://youtube.com"
    expect(link.title).to eq "Youtube"
  end
end
end
