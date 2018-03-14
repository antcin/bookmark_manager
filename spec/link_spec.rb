describe Link do


  describe '#self.all' do
    it 'returns links' do
      links = Link.all

      urls = links.map(&:url)

      expect(urls).to include("http://www.makersacademy.com")
      expect(urls).to include("http://www.facebook.com")
      expect(urls).to include("http://www.google.com")
    end
  end

  describe '#self.add' do
    it 'adds a link' do
      Link.add(url: 'http://www.ricky.hewitt.tech')
      links = Link.all
      urls = links.map(&:url)

      expect(urls).to include('http://www.ricky.hewitt.tech')
    end

    it 'does not add invalid link' do
      Link.add(url: 'fake_link')

      links = Link.all
      urls = links.map(&:url)

      expect(urls).not_to include('fake_link')
    end
  end

end
