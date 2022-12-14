# store.rb

module Store
  def store_books(obj)
    File.write('./data/books.json', obj)
    File.write('./data/labels.json', obj)
  end

  def load_books
    file = File.open('./data/books.json')
    file_data = file.read
    if file_data == ''
      @books = []
    else
      convert_to_array = JSON.parse(file_data, symbolize_names: true)
      @books = convert_to_array
    end
  end

  def store_labels(obj)
    File.write('./data/labels.json', obj)
  end
end
