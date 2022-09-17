# label_spec.rb

require_relative '../lib/label'

describe Label do
  context 'When testing Label class' do
    before :each do
      @label = Label.new('thriller', 'pink')
    end

    it 'Returns an instance of Label' do
      expect(@label).to be_instance_of(Label)
    end

    it 'Has correct name' do
      expect(@label.title).to eq 'thriller'
    end

    it 'Returns correct hash' do
      hash = { title: 'thriller', color: 'pink' }
      expect(@label.label_to_hash).to eq hash
    end
  end
end
