require 'garage'

describe Garage do
  let(:bike) { double(:bike) }
  let(:van) { double(:van) }
  it 'accepts broken bikes' do
    allow(bike).to receive(:working?).and_return(false)
    broken_bikes = [bike, bike]
    subject.dock(broken_bikes)
  end

  it 'shows the current bikes in the garage' do
    broken_bikes = [bike, bike]
    subject.dock(broken_bikes)
    expect(subject.bikes).to eq broken_bikes
  end

  it 'accept working bikes' do
    allow(bike).to receive(:working?).and_return(true)
    working_bikes = [bike, bike]
    subject.dock(working_bikes)
  end

  it 'releases working bikes' do
    subject.release_bikes
    expect(subject.bikes).to eq []
  end
end
