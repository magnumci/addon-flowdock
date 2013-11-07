require "spec_helper"

describe Magnum::Addons::Flowdock do
  describe "#initialize" do
    it "raises error if api token is nil" do
      expect { described_class.new }.
        to raise_error Magnum::Addons::Flowdock::Error, "API token required"
    end
  end

  describe "#run" do
    let(:addon)   { described_class.new(api_token: "token") }
    let(:build) { JSON.load(fixture("build.json")) }

    before do
      ::Flowdock::Flow.any_instance.stub(:push_to_team_inbox) { true }
      ::Flowdock::Flow.any_instance.stub(:push_to_chat) { true }
    end

    it "requires hash object" do
      expect { addon.run(nil) }.
        to raise_error ArgumentError, "Hash required"
    end

    it "sends team inbox notification" do
      expect(addon.run(build)).to eq true
      
    end
  end
end