module PokerRanking
  module HandType
    class HighCard < Base

      def handles?
        true
      end

      def rank
        0
      end

      def name
        'high card'
      end

      def cards_used
        cards[-5..-1]
      end
    end
  end
end
