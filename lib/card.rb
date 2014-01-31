
module PokerRanking
  class PokerRanking::Card

    RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
    SUITS = %w(Hearts Diamonds Spades Clubs)

    def initialize(id)
      if id.is_a? String
        rank, suit = id.split /\s+of\s+/
        set_value_by_rank_name(rank)
        @suit = suit
      end

      @rank = RANKS[@value - 2]
    end

    def set_value_by_rank_name(rank)
      if rank == "Jack" then
        @value = 11
      elsif rank == "Queen" then
        @value = 12
      elsif rank == "King" then
        @value = 13
      elsif rank == "Ace" then
        @value = 14
      else
        @value = rank.to_i
      end
    end

    def worth_less_than(other_hand)
      @value < other_hand.value
    end

    def to_s
      "#@rank of #@suit"
    end

    def ==(other_card)
      @value == other_card.value && @rank == other_card.rank
    end

    attr_reader :value
    attr_reader :rank
    attr_reader :suit


  end
end