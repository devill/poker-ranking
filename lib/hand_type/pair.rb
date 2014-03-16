
module PokerRanking
  module HandType
    class Pair < Base

      def handles?
        n_of_a_kind? 2
      end

      def rank
        1
      end

      def value
        highest_same_value 2
      end

      def number_of_kickers
        3
      end

      def name
        'pair'
      end

      def cards_used
        cards_for_values_and_kickers value
      end
    end
  end
end
