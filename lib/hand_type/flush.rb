module PokerRanking
  module HandType
    class Flush < Base
    
      attr_reader :flush_suit 

      def handles?
        count = { 'Hearts' => 0, 'Clubs' => 0, 'Diamonds' => 0, 'Spades' => 0 }
        cards.each do |card|
          count[card.suit] += 1
        end

        count.each do |suit, suit_count|
          if suit_count >= 5
            @flush_suit = suit
            return true
          end
        end

        return false
      end

      def value
        kickers.first
      end

      #only use kickers that are of the suit
      def kickers
        kick = []
        cards.reverse.each do |card|
          if card.suit == @flush_suit
            kick << card.value
          end
        end
        kick[0..number_of_kickers-1]
      end

      def rank
        5
      end

      def name
        'flush'
      end
    end
  end
end
