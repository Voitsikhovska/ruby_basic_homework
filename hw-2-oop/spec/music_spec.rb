require File.expand_path('../../hw-2-oop/catalog.rb', __dir__)
require File.expand_path('../../hw-2-oop/movie.rb', __dir__)
require File.expand_path('../../hw-2-oop/music.rb', __dir__)
require File.expand_path('../../hw-2-oop/item.rb', __dir__)

describe Music do
  context 'when object created' do
    subject { described_class.new(options) }

    let(:options) do
      {
        name: name,
        code: code,
        size: size,
        singer: singer,
        duration: duration
      }
    end
    let(:name) { 'Default name' }
    let(:code) { 'Default code' }
    let(:size) { 'Default size' }
    let(:singer) { 'Default singer' }
    let(:duration) { 12 }
    let(:category) { :music }

    it 'stores its name' do
      expect(subject.name).to eq(name)
    end

    it 'stores its code' do
      expect(subject.code).to eq(code)
    end

    it 'stores its size' do
      expect(subject.size).to eq(size)
    end

    it 'stores its singer' do
      expect(subject.singer).to eq(singer)
    end

    it 'stores its duration' do
      expect(subject.duration).to eq(duration)
    end

    it 'show appropriate category name' do
      expect(subject.category).to eq(category)
    end
  end
end
