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
end
