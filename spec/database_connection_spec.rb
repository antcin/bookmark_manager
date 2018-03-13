describe DatabaseConnection do

  describe '#self.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '#self.connection' do
    it 'returns the connection' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  describe '#self.query' do
    it 'executes an SQL query via PG' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with('SELECT * FROM links')
      DatabaseConnection.query('SELECT * FROM links')
    end
  end

end
