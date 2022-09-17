# store.rb

module Store
  def store_books(obj)
    File.write('./data/books.json', obj)
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

  # def load_labels
  #   file = File.open('./data/labels.json')
  #   file_data = file.read
  #   if file_data == ''
  #     @labels = []
  #   else
  #     convert_to_array = JSON.parse(file_data, symbolize_names: true)
  #     @labels = convert_to_array
  #   end
  # end
end
