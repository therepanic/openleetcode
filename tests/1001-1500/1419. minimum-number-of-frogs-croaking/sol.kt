class Solution {
    fun minNumberOfFrogs(croakOfFrogs: String): Int {
        var maxi = 0
        var curr = 0
        var c = 0
        var r = 0
        var o = 0
        var a = 0
        var k = 0
        for (ch in croakOfFrogs) {
            when (ch) {
                'c' -> {
                    c++
                    curr++
                }
                'r' -> r++
                'o' -> o++
                'a' -> a++
                'k' -> {
                    k++
                    curr--
                }
            }
            maxi = maxOf(maxi, curr)
            if (c < r || r < o || o < a || a < k) {
                return -1
            }
        }
        if (curr == 0 && c == r && r == o && o == a && a == k) {
            return maxi
        } else {
            return -1
        }
    }
}
