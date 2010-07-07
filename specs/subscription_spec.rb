require File.dirname(__FILE__) + '/../lib/masstransit'
require 'spec'

describe MassTransit::Subscription, "#address" do
	it "returns the address" do
		subscription = MassTransit::Subscription.new "address", "message"
		subscription.address.should == "address"
	end
end