# book_spec.rb

require_relative '../lib/book'

describe Book do
  context 'When testing book class' do
    before :each do
      @book = Book.new('2022/09/14', 'Judah', 'good', 'CPAD')
    end

    it 'Returns an instance of Book' do
      expect(@book).to be_instance_of(Book)
    end

    it 'Can be archived method works correctly' do
      expect(@book.can_be_archived?).to eq false
    end
  end
end
