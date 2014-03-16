
module PokerRanking
  module HandType
    class ThreeOfAKind < Base

      def handles?
        n_of_a_kind? 3
      end

      def number_of_kickers
        2
      end

      def rank
        3
      end

      def value
        highest_same_value 3
      end

      def name
        'three of a kind'
      end

      def cards_used
        cards_for_values_and_kickers value
      end
    end
  end
end
