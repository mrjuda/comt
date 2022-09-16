# attributes.rb

require_relative 'label'
require_relative 'store'

module Attributes
  include Store

  def item_label
    puts 'Would you like to (1)add a new label or (2)choose a label that is already on the list?'
    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      puts 'Please enter a valid option: '
      choice = gets.chomp.to_i
    end
    if choice == 1
      puts 'What is the label name?'
      label_name = gets.chomp
      puts 'What is color?'
      label_color = gets.chomp
      label = Label.new(label_name, label_color)
      @labels << label.label_to_hash
      store_labels(@labels.to_json)
    else
      puts 'List of labels'
      list_all_labels
      index = gets.chomp.to_i
      label = @labels[index]
    end
    label
  end
end
