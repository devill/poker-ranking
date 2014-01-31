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
    end
  end
end
