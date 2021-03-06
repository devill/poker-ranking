module PokerRanking
  module HandType
    class FullHouse < Base

      def handles?
        return false unless n_of_a_kind? 3
        second_value > 0
      end

      def rank
        6
      end

      def second_value
        highest_same_value_except(2, value)
      end

      def value
        highest_same_value 3
      end

      def kickers
        []
      end

      def name
        'full house'
      end

      def cards_used
        cards_for_values_and_kickers value, second_value
      end
    end
  end
end
