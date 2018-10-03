# testing the docking station
require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'runs method to release bike' do
    subject.dock(Bike.new)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docking bike' do
    bikes = Bike.new
    subject.dock(bikes)
    expect(subject.bikes).to eq [bikes]
  end

  it {is_expected.to respond_to(:dock).with(1).argument }

  it 'doesnt release bike if no bikes' do
    expect {subject.release_bike}.to raise_error "no bikes"
  end

  it 'accepts more than one bike' do
    bike_a = Bike.new
    bike_b = Bike.new
    subject.dock(bike_a)
    expect(subject.dock(bike_b)).to eq [bike_a, bike_b]
  end

  it 'doesnt accept more than 20 bikes' do
    subject.capacity.times {subject.dock(Bike.new)}
    expect {subject.dock(Bike.new)}.to raise_error 'Full capacity'
  end

  it 'has a default capacity, if no params to DockingStation' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

end
