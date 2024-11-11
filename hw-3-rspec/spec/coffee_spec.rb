require_relative '../lib/coffee'

describe Coffee do
  let(:params) { { sugar: true, beans: :arabica, name: :espresso } }
  let(:coffee) { Coffee.new(params, barista) }
  let(:barista) { false }

  describe '.call' do
    it 'створює і повертає екземпляр Coffee' do
      expect(described_class.call(params)).to be_a(Coffee)
    end
  end

  describe '#initialize' do
    context 'коли передано правильні параметри' do
      it 'правильно встановлює beans' do
        expect(coffee.beans).to eq('Bourbon')
      end

      it 'правильно встановлює name' do
        expect(coffee.name).to eq('Espresso')
      end
    end

    context 'коли передано невідомий тип кави' do
      let(:params) { { sugar: true, beans: :arabica, name: :unknown_type } }

      it 'встановлює name на nil' do
        expect(coffee.name).to be_nil
      end
    end
  end

  describe '#call' do
    it 'викликає методи для приготування кави' do
      expect(coffee).to receive(:grind_beans)
      expect(coffee).to receive(:validate_coffee_name)
      expect(coffee).to receive(:prepare_coffee_drink)
      expect(coffee).to receive(:add_sugar)
      expect(coffee).to receive(:check_software_updates)
      expect(coffee).to receive(:tell_bye)

      coffee.call
    end
  end

  describe '#with_sugar?' do
    context 'коли sugar є true' do
      it 'повертає true' do
        expect(coffee.with_sugar?).to be(true)
      end
    end

    context 'коли sugar є false' do
      let(:params) { { sugar: false, beans: :arabica, name: :espresso } }

      it 'повертає false' do
        expect(coffee.with_sugar?).to be(false)
      end
    end
  end

  describe '#check_software_updates' do
    context 'коли barista є true' do
      let(:barista) { true }

      it 'перевіряє оновлення та викликає timeout' do
        allow(coffee).to receive(:time_for_update).and_return(true)
        expect(coffee).to receive(:timeout)
        coffee.check_software_updates
      end
    end

    context 'коли barista є false' do
      let(:barista) { false }

      it 'не викликає timeout' do
        # Забезпечимо, що `time_for_update` повертає `false`, щоб уникнути виклику `timeout`
        allow(coffee).to receive(:time_for_update).and_return(false)
        expect(coffee).not_to receive(:timeout)
        coffee.check_software_updates
      end
    end
  end


  describe '#timeout' do
    context 'коли barista є true' do
      let(:barista) { true }

      it 'виводить повідомлення про завантаження оновлень' do
        allow(coffee).to receive(:time_for_update).and_return(true)
        expect { coffee.send(:timeout) }.to output(/=== Updates were loaded... ===/).to_stdout
      end
    end

    context 'коли barista є false' do
      let(:barista) { false }

      it 'виводить повідомлення "лише для бариста"' do
        expect { coffee.send(:timeout) }.to output(/Updates only for BARISTA!!!/).to_stdout
      end
    end
  end
end
