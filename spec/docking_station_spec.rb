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
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  it {is_expected.to respond_to(:dock).with(1).argument }

  it 'doesnt release bike if no bikes' do
    expect {subject.release_bike}.to raise_error "no bikes"
  end

  it 'stop accepting bikes if its full' do
    subject.dock(Bike.new)
    expect {subject.dock(Bike.new)}.to raise_error 'Full capacity'
  end

end
