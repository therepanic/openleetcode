class Solution {
    fun judgeCircle(moves: String): Boolean {
        return moves.count { it == 'L' } == moves.count { it == 'R' } &&
               moves.count { it == 'U' } == moves.count { it == 'D' }
    }
}
