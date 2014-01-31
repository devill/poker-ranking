module PokerRanking
  module HandType
    class StraightFlush < Base

      SUITS = %w(Hearts Diamonds Spades Clubs)

      def handles?
        (value > 0)
      end

      def rank
        8
      end

      def value
        SUITS.each do |suit|
          value_for_suit = straight_value_for_suit(suit)
          return value_for_suit if value_for_suit > 0
        end
        0
      end

      def name
        'straight flush'
      end

      private

      def straight_value_for_suit(suit)
        count = 1
        last_value = 0
        value = 0

        if has_ace_of_suit(suit)
          count += 1
          last_value = 1
        end

        cards.each do |card|
          if card.suit == suit
            if card.value == last_value + 1
              count += 1
            else
              count = 1
            end
            last_value = card.value

            if count >= 5
              value = card.value
            end
          end
        end
        value
      end

      def has_ace_of_suit(suit)
        cards.each do |card|
          return true if card.value == 14 && card.suit == suit
        end

        false
      end
    end
  end
end
