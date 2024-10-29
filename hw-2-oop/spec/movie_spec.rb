require File.expand_path('../../hw-2-oop/catalog.rb', __dir__)
require File.expand_path('../../hw-2-oop/movie.rb', __dir__)
require File.expand_path('../../hw-2-oop/music.rb', __dir__)
require File.expand_path('../../hw-2-oop/item.rb', __dir__)

describe Movie do
  context 'when object created' do
    subject { described_class.new(options) }

    let(:options) do
      {
        name: name,
        code: code,
        size: size,
        director: director,
        main_actor: main_actor,
        main_actress: main_actress
      }
    end
    let(:name) { 'Default name' }
    let(:code) { 'Default code' }
    let(:size) { 'Default size' }
    let(:director) { 'Default director' }
    let(:main_actor) { 'Default main_actor' }
    let(:main_actress) { 'Default main_actress' }
    let(:category) { :movie }

    it 'stores its name' do
      expect(subject.name).to eq(name)
    end

    it 'stores its code' do
      expect(subject.code).to eq(code)
    end

    it 'stores its size' do
      expect(subject.size).to eq(size)
    end

    it 'stores its main_actor' do
      expect(subject.main_actor).to eq(main_actor)
    end

    it 'stores its director' do
      expect(subject.director).to eq(director)
    end

    it 'stores its main_actress' do
      expect(subject.main_actress).to eq(main_actress)
    end

    it 'show appropriate category name' do
      expect(subject.category).to eq(category)
    end
  end
end
