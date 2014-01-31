lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'poker_ranking'

Gem::Specification.new do |s|
  s.name        = 'poker_ranking'
  s.version     = PokerRanking::VERSION
  s.date        = '2014-01-31'
  s.summary     = "Poker cards, and ranking utilities for poker apps."
  s.description = "Poker cards, and ranking utilities for poker apps."
  s.authors     = ["Rafael Ordog aka DeVill", "Paul Yule"]
  s.email       = 'rafael@ordog.tk'
  s.files       = Dir.glob("{lib}/**/*")
  s.homepage    =
      'http://leanpoker.org'
  s.license       = 'MIT'
end