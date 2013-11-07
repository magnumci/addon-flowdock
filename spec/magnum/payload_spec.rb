require "spec_helper"

describe Magnum::Addons::Flowdock::Payload do
  let(:build)   { JSON.load(fixture("build.json")) }
  let(:message) { Magnum::Addons::Flowdock::Message.new(build) }
  let(:payload) { described_class.new(build, message) }

  describe "#to_hash" do
    let(:result) { payload.to_hash }

    it "returns a hash" do
      expect(result).to be_a Hash
    end

    it "includes subject" do
      expect(result[:subject]).to eq "[PASS] slack-notify #3 (master - 6f102f22) by Dan Sosedoff"
    end

    it "includes message content" do
      expect(result[:content]).to be_a String
    end

    it "includes from details" do
      expect(result[:from]).to be_a Hash
    end

    it "includes from email address" do
      expect(result[:from][:address]).to eq "notifications@magnum-ci.com"
    end

    it "includes source name" do
      expect(result[:source]).to eq "Magnum CI"
    end

    it "includes tags" do
      expect(result[:tags]).to be_an Array
    end

    context "tags" do
      let(:tags) { result[:tags] }

      it "includes build branch" do
        expect(tags[0]).to eq "master"
      end

      it "includes build status" do
        expect(tags[1]).to eq "pass"
      end

      it "includes ci" do
        expect(tags[2]).to eq "ci"
      end
    end
  end
end