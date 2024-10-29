require File.expand_path('../../hw-2-oop/catalog.rb', __dir__)
require File.expand_path('../../hw-2-oop/movie.rb', __dir__)
require File.expand_path('../../hw-2-oop/music.rb', __dir__)
require File.expand_path('../../hw-2-oop/item.rb', __dir__)

describe Item do
  context 'when object created' do
    subject { described_class.new(options) }

    let(:options) do
      {
        name: name,
        code: code,
        size: size
      }
    end
    let(:name) { 'Default name' }
    let(:code) { 'Default code' }
    let(:size) { 'Default size' }

    it 'stores its name' do
      expect(subject.name).to eq(name)
    end

    it 'stores its code' do
      expect(subject.code).to eq(code)
    end

    it 'stores its size' do
      expect(subject.size).to eq(size)
    end

    context 'on category retrieving' do
      it 'throws an NotImplementedError' do
        expect { subject.category }.to(
          raise_error(NotImplementedError, 'For subclasses only!')
        )
      end
    end
  end
end
