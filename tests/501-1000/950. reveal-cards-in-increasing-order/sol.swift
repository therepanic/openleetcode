class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        var deck = deck.sorted()
        var rebuild = [deck.removeLast()]
        while let card = deck.popLast() {
            rebuild.insert(rebuild.removeLast(), at: 0)
            rebuild.insert(card, at: 0)
        }
        return rebuild
    }
}
