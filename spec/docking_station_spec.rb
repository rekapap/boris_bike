# testing the docking station
require 'docking_station'
require 'bike'
require 'pry'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  let(:bike) { double(:bike) }
  it 'runs method to release bike' do
    allow(bike).to receive(:working?).and_return(true)
    subject.dock(bike)
    released_bike = subject.release_bike
    expect(released_bike).to be_working
  end

  it 'docking bike' do
    allow(bike).to receive(:working?).and_return(true)
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'doesnt release bike if no bikes' do
    expect { subject.release_bike }.to raise_error 'No bikes'
  end

  it 'accepts more than one bike' do
    allow(bike).to receive(:working?).and_return(true)
    bike_a = bike
    bike_b = bike
    subject.dock(bike_a)
    expect(subject.dock(bike_b)).to eq [bike_a, bike_b]
  end

  it 'doesnt accept more than 20 bikes' do
    allow(bike).to receive(:working?).and_return(true)
    subject.capacity.times { subject.dock(bike) }
    expect { subject.dock(bike) }.to raise_error 'Full capacity'
  end

  it 'has a default capacity, if no params to DockingStation' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'doesnot release broken bikes' do
    allow(bike).to receive(:working?).and_return(false)
    subject.dock(bike)
    expect { subject.release_bike }.to raise_error 'No bikes'
  end

  it 'accepts broken bikes and working bikes' do
    allow(bike).to receive(:working?).and_return(false)
    subject.dock(bike)
  end

end
