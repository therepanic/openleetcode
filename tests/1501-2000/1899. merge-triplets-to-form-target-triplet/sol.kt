class Solution {
    fun mergeTriplets(triplets: Array<IntArray>, target: IntArray): Boolean {
        if (triplets.any { it.contentEquals(target) }) return true
        var curr = intArrayOf(0, 0, 0)
        for (t in triplets) {
            var flag = false
            if (target[0] == t[0] && curr[0] != target[0]) flag = true
            if (target[1] == t[1] && curr[1] != target[1]) flag = true
            if (target[2] == t[2] && curr[2] != target[2]) flag = true
            if (flag) {
                val temp = curr.copyOf()
                curr[0] = maxOf(curr[0], t[0])
                curr[1] = maxOf(curr[1], t[1])
                curr[2] = maxOf(curr[2], t[2])
                if (curr[0] > target[0] || curr[1] > target[1] || curr[2] > target[2]) {
                    curr = temp
                }
            }
        }
        return curr.contentEquals(target)
    }
}
