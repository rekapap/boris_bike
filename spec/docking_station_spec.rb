# testing the docking station
require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'runs method to release bike' do
    subject.dock(double(:bike))
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docking bike' do
    bikes = double(:bike)
    subject.dock(bikes)
    expect(subject.bikes).to eq [bikes]
  end

  it {is_expected.to respond_to(:dock).with(1).argument }

  it 'doesnt release bike if no bikes' do
    expect {subject.release_bike}.to raise_error "No bikes"
  end

  it 'accepts more than one bike' do
    bike_a = (double(:bike))
    bike_b = (double(:bike))
    subject.dock(bike_a)
    expect(subject.dock(bike_b)).to eq [bike_a, bike_b]
  end

  it 'doesnt accept more than 20 bikes' do
    subject.capacity.times {subject.dock(double(:bike))}
    expect {subject.dock(double(:bike))}.to raise_error 'Full capacity'
  end

  it 'has a default capacity, if no params to DockingStation' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'doesnot release broken bikes' do
    # bike = Bike.new(false)
    subject.dock(double(:bike))
    expect {subject.release_bike}.to raise_error 'No bikes'
  end

  it 'accepts broken bikes and working bikes' do
    # bike = Bike.new(false)
    subject.dock(double(:bike))
  end

end
