class Solution {
    fun twoEggDrop(n: Int): Int {
        var l = 1
        var r = n
        var res = 0
        while (l <= r) {
            val moves = (l + r) / 2
            if ((1L + moves) * moves / 2 >= n) {
                res = moves
                r = moves - 1
            } else {
                l = moves + 1
            }
        }
        return res
    }
}
