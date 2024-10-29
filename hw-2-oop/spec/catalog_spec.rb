require File.expand_path('../../hw-2-oop/catalog.rb', __dir__)
require File.expand_path('../../hw-2-oop/movie.rb', __dir__)
require File.expand_path('../../hw-2-oop/music.rb', __dir__)
require File.expand_path('../../hw-2-oop/item.rb', __dir__)

describe Catalog do
  let(:catalog_object) { described_class.new }
  let(:music) { Music.new(name: music_name, code: music_code) }
  let(:movie) { Movie.new(name: movie_name, code: movie_code) }
  let(:music_name) { 'Some music' }
  let(:music_code) { 1 }
  let(:movie_name) { 'Some movie' }
  let(:movie_code) { 2 }

  context 'when object initialized' do
    it 'has an empty list of items' do
      expect(catalog_object.items_list).to eq([])
    end
  end

  describe '#add' do
    subject { catalog_object.add(music) }

    it 'adds items to the list' do
      expect { subject }.to(
        change { catalog_object.items_list.length }.from(0).to(1)
      )
    end

    it 'adds correct item' do
      subject

      expect(catalog_object.items_list.last).to eq(music)
      expect(catalog_object.items_list).not_to include(movie)
    end
  end

  describe '#remove' do
    subject { catalog_object.remove(music_code) }

    before do
      catalog_object.add(music)
      catalog_object.add(movie)
    end

    it 'removes only 1 item' do
      expect { subject }.to(
        change { catalog_object.items_list.length }.from(2).to(1)
      )
    end

    it 'removes item by its code' do
      subject

      expect(catalog_object.items_list).not_to include(music)
    end

    it 'does not remove not needed items' do
      subject

      expect(catalog_object.items_list).to include(movie)
    end
  end

  describe '#show' do
    it 'has show feature' do
      expect(catalog_object).to respond_to(:show)
    end
  end

  describe '#list' do
    it 'has list feature' do
      expect(catalog_object).to respond_to(:list)
    end
  end
end
