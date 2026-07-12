class Solution {
    fun deckRevealedIncreasing(deck: IntArray): IntArray {
        deck.sort()
        val rebuild = ArrayDeque<Int>()
        rebuild.addLast(deck.last())
        for (i in deck.size - 2 downTo 0) {
            rebuild.addFirst(rebuild.removeLast())
            rebuild.addFirst(deck[i])
        }
        return rebuild.toIntArray()
    }
}
