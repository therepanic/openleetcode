# @param {Integer[]} deck
# @return {Integer[]}
def deck_revealed_increasing(deck)
    deck.sort!
    rebuild = [deck[-1]]
    deck[0...-1].reverse_each do |card|
        rebuild.unshift(rebuild.pop)
        rebuild.unshift(card)
    end
    rebuild
end
