describe Link do

  describe '#self.all' do
    it 'returns links' do
      links = Link.all
      expect(links).to include("http://www.makersacademy.com")
      expect(links).to include("http://www.facebook.com")
      expect(links).to include("http://www.google.com")
    end
  end

  describe '#self.add' do
    it 'adds a link' do
      Link.add('http://www.ricky.hewitt.tech')
      links = Link.all
      expect(links).to include('http://www.ricky.hewitt.tech')
    end

    it 'does not add invalid link' do
      Link.add('fake_link')
      expect(Link.all).not_to include('fake_link')
    end
  end

end
