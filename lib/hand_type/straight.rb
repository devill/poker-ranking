module PokerRanking
  module HandType
    class Straight < Base

      def handles?
        straight_value > 0
      end

      def rank
        4
      end

      def value
        straight_value
      end

      def name
        'straight'
      end

      private

      def straight_value
        count = 1
        last_value = 0
        value = 0

        if has_ace()
          count += 1
          last_value = 1
        end

        @cards.each do |card|
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
        value
      end

      def has_ace
        @cards[-1].rank == 'Ace'
      end


    end
  end
end
