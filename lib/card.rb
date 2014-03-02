
module PokerRanking
  class PokerRanking::Card

    RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
    SHORT_RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    SUITS = %w(Hearts Diamonds Spades Clubs)

    def initialize(card_data)
      @suit = card_data.has_key?(:suit) ? card_data[:suit] : card_data['suit']
      @rank = card_data.has_key?(:rank) ? card_data[:rank].to_s : card_data['rank'].to_s
      set_value_by_rank_name(@rank)
    end

    def set_value_by_rank_name(rank)
      @value = RANKS.index(rank) + 2
    end

    def worth_less_than(other_hand)
      @value < other_hand.value
    end

    def to_s
      "#{@rank} of #{@suit}"
    end

    def data
      { rank: SHORT_RANKS[@value - 2], suit: @suit.downcase }
    end

    def ==(other_card)
      @value == other_card.value && @rank == other_card.rank
    end

    attr_reader :value
    attr_reader :rank
    attr_reader :suit

    def self.by_name(name)
      rank, suit = name.split /\s+of\s+/
      PokerRanking::Card.new({rank: rank, suit: suit})
    end

    def self.by_id(id)
      PokerRanking::Card.new({rank: RANKS[id % 13], suit: SUITS[id / 13]})
    end

  end
end