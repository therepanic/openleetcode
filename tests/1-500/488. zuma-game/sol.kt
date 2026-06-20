class Solution {
    private fun removeSame(s: String, i: Int): String {
        if (i < 0) return s
        var left = i
        var right = i
        while (left > 0 && s[left - 1] == s[i]) left--
        while (right + 1 < s.length && s[right + 1] == s[i]) right++
        val length = right - left + 1
        return if (length >= 3) {
            val newS = s.substring(0, left) + s.substring(right + 1)
            removeSame(newS, left - 1)
        } else s
    }

    fun findMinStep(board: String, hand: String): Int {
        val sortedHand = hand.toCharArray().sorted().joinToString("")
        val q: java.util.ArrayDeque<Triple<String, String, Int>> = java.util.ArrayDeque()
        val visited = HashSet<String>()
        q.add(Triple(board, sortedHand, 0))
        visited.add("$board#$sortedHand")

        while (q.isNotEmpty()) {
            val (currBoard, currHand, step) = q.removeFirst()
            for (i in 0..currBoard.length) {
                for (j in currHand.indices) {
                    if (j > 0 && currHand[j] == currHand[j - 1]) continue
                    if (i > 0 && currBoard[i - 1] == currHand[j]) continue

                    var pick = false
                    if (i < currBoard.length && currBoard[i] == currHand[j]) pick = true
                    if (i > 0 && i < currBoard.length &&
                        currBoard[i - 1] == currBoard[i] &&
                        currBoard[i] != currHand[j]) pick = true

                    if (pick) {
                        val newBoard = removeSame(
                            currBoard.substring(0, i) + currHand[j] + currBoard.substring(i), i
                        )
                        val newHand = currHand.substring(0, j) + currHand.substring(j + 1)
                        if (newBoard.isEmpty()) return step + 1
                        val key = "$newBoard#$newHand"
                        if (key !in visited) {
                            visited.add(key)
                            q.add(Triple(newBoard, newHand, step + 1))
                        }
                    }
                }
            }
        }
        return -1
    }
}
