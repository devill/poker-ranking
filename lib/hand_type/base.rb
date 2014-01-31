module PokerRanking
  module HandType
    class Base
      attr_reader :cards

      def initialize(cards)
        @cards = cards
      end

      def value
        cards[-1].value
      end

      def n_of_a_kind?(n)
        highest_same_value(n) > 0
      end

      def highest_same_value(n)
        highest_same_value_except n, 0
      end

      def number_of_kickers
        5
      end

      def second_value
        value
      end

      def highest_same_value_except(n, skipped_values)
        skipped_values = [skipped_values] unless skipped_values.respond_to? :include?
        value = 0
        count = 1
        last_value = 0
        @cards.each do |card|
          if card.value == last_value && !(skipped_values.include? card.value)
            count += 1
            value = last_value if count == n
          else
            count = 1
            last_value = card.value
          end
        end
        value
      end

      def kickers
        kickers = []
        @cards.map(&:value).reverse.each do |value|
          kickers << value if @cards.map(&:value).count(value) == 1
        end
        kickers[0..number_of_kickers-1]
      end


    end
  end
end
