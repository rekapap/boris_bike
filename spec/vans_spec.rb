require 'van'
require 'garage'

describe Van do

  let(:bike) { double(:bike) }
  let(:garage) { double(:garage) }
  it 'delivers broken bikes to garage' do
    bikes = [bike, bike, bike]
    allow(garage).to receive(:bikes).and_return(bikes)
    subject.deliver_bikes(bikes, garage)
    expect(garage.bikes).to eq bikes
  end

end
