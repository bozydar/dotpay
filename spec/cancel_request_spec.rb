require 'spec_helper'

describe Dotpay::CancelRequest do
  before :each do
    Dotpay.configure do |config|
      config.account_id             = 1234
      config.pin                    = 'testtesttesttest'
      config.cancel_login           = 'testlogin'
      config.cancel_password        = 'testpass'
    end
  end

  describe ".new" do
    let(:t_id) { "TST01" }
    let(:amount) { "1.00" }
    let(:control) { "ABCD" }

    subject { Dotpay::CancelRequest.new(t_id, amount, control) }

    it { is_expected.to have_attributes(t_id: t_id) }
    it { is_expected.to have_attributes(amount: amount) }
    it { is_expected.to have_attributes(control: control) }
    it { is_expected.to have_attributes(type: Dotpay::CancelRequest::TYPE_FULL) }
    it { is_expected.to have_attributes(checksum: '5f6b85d31fa19ee60db2e2bcc9c595f6') }
  end
end
