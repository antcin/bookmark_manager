require 'link'

describe Link do

  describe '#all' do
    it 'returns links' do
      links = Link.all
      expect(links).to include("http://www.makersacademy.com")
      expect(links).to include("http://www.facebook.com")
      expect(links).to include("http://www.google.com")
    end
  end
end
