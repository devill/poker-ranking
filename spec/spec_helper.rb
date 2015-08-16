require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

$:.push(File.join(File.dirname(__FILE__), '../../lib'))

module Helpers
  def hand(*cards)
    PokerRanking::Hand.new(cards)
  end

  def cards(*cards)
    cards.map { |card_name| PokerRanking::Card::by_name(card_name) }
  end
end

require 'rspec'
include Helpers

require_relative '../lib/hand'

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = [:should,:expect] }
end


module PokerRanking
  class Hand
    
    def should_defeat(otherHand)
      self.defeats?(otherHand).should == true
      otherHand.defeats?(self).should == false
    end

    def should_tie_with(otherHand)
      self.defeats?(otherHand).should == false
      otherHand.defeats?(self).should == false
    end

  end
end
