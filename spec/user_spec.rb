require 'user'

describe User do
  it {is_expected.to respond_to :report}

  it {is_expected.to respond_to :return_bike}
end
