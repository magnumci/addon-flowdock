require "spec_helper"

describe Magnum::Addons::Flowdock::Message do
  describe "#initialize" do
    it "requires hash" do
      expect { described_class.new(nil) }.
        to raise_error ArgumentError, "Hash required"
    end
  end

  describe "#to_s" do
    let(:payload) { JSON.load(fixture("build.json")) }
    let(:message) { described_class.new(payload) }
    let(:result)  { message.to_s }

    it "returns string" do
      expect(result).to be_a String
    end

    it "includes build title" do
      expect(result).to include '<strong>[PASS] slack-notify #3 (master - 6f102f22) by Dan Sosedoff</strong><br/>'
    end

    it "includes commit url" do
      expect(result).to include "https://github.com/sosedoff/slack-notify/commit/6f102f22caac46945e16ada4f50df29a70ab2799"
    end

    it "includes commit message" do
      expect(result).to include "Version bump: 0.1.1"
    end

    it "includes branch" do
      expect(result).to include "Branch: master"
    end

    it "includes author" do
      expect(result).to include "Author: Dan Sosedoff"
    end

    it "include duration" do
      expect(result).to include "Duration: 11s"
    end

    it "includes view build url" do
      expect(result).to include "https://magnum-ci.com/projects/201/builds/8683"
    end

    it "includes diff view url" do
      expect(result).to include "https://github.com/sosedoff/slack-notify/compare/42f7b7cdfc4b...6f102f22caac"
    end

    it "is html formatted" do
      expect(result).to eq fixture("message.html")
    end
  end
end