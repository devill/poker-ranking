module PokerRanking

  module HandType
    class TwoPair < Base

      def handles?
        has_two_pair?
      end

      def rank
        2
      end

      def value
        highest_same_value 2
      end

      def number_of_kickers
        1
      end

      def second_value
        highest_same_value_except(2, value)
      end

      def kickers
        [[super,highest_same_value_except(2,[value,second_value])].flatten.max]
      end

      def name
        'two pairs'
      end

      private

      def has_two_pair?
        pair_count = 0
        last_value = 0
        cards.each do |card|
          if card.value == last_value
            pair_count += 1
          end
          last_value = card.value
        end
        return pair_count >= 2
      end

    end
  end
end
