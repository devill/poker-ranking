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

      def cards_for_values_and_kickers(*values)
        result = cards.select { |card| not values.include? card.value }
        values.reverse.each do |value|
          result += cards.select { |card| card.value == value }
        end
        result[-5..-1]
      end

      def straight_value_of(card_set)
        cards_in_straight = cards_in_straight(card_set)

        cards_in_straight.empty? ? 0 : cards_in_straight[-1].value
      end

      def cards_in_straight(card_set)
        return [] if card_set.empty?

        cards_in_streak = []
        cards_in_straight = []
        last_value = 0

        if card_set[-1].rank == 'Ace'
          cards_in_streak << card_set[-1]
          last_value = 1
        end

        card_set.each do |card|
          if cards_in_streak.empty? or card.value == last_value + 1
            cards_in_streak << card
          elsif card.value > last_value
            cards_in_streak = [card]
          end
          last_value = cards_in_streak[-1].value

          if cards_in_streak.length >= 5
            cards_in_straight = cards_in_streak.clone
          end
        end
        cards_in_straight
      end
    end
  end
end
