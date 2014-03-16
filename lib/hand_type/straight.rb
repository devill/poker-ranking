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

      private

      def straight_value_of(card_set)
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

        cards_in_straight.empty? ? 0 : cards_in_straight[-1].value
      end

    end
  end
end
