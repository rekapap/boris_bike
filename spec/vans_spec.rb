require 'van'
require 'garage'

describe Van do

  let(:bike) { double(:bike) }
  let(:garage) { double(:garage) }
  let(:dockingstation) { double(:dockingstation) }
  
  it 'delivers broken bikes to garage' do
    bikes = [bike, bike, bike]
    allow(bike).to receive(:working?).and_return(false)
    allow(garage).to receive(:bikes).and_return(bikes)
    allow(garage).to receive(:dock).and_return(bikes)
    subject.deliver_bikes(bikes, garage)
    expect(garage.bikes).to eq bikes
  end

  it 'distribute working bikes from garage' do
    bikes = [bike, bike, bike]
    allow(dockingstation).to receive(:bikes).and_return(bikes)
    allow(dockingstation).to receive(:dock).and_return(bikes)
    subject.distribute(bikes, dockingstation)
    expect(dockingstation.bikes).to eq bikes
  end

end
