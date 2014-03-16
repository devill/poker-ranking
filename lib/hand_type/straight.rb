module PokerRanking
  module HandType
    class Straight < Base

      def handles?
        value > 0
      end

      def rank
        4
      end

      def value
        straight_value_of cards
      end

      def name
        'straight'
      end
    end
  end
end
