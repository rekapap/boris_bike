require 'bike'

describe Bike do
  it { is_expected.to respond_to :working?}

  it 'has a default status, if no params given' do
    expect(subject.working?).to eq Bike::DEFAULT_STATUS
  end

  it { is_expected.to respond_to :working_status= }

  it { is_expected.to respond_to :report_broken }

  it 'reports broken if it\'s broken' do
    bike = Bike.new(false)
    expect(bike.report_broken).to eq true
  end

end
