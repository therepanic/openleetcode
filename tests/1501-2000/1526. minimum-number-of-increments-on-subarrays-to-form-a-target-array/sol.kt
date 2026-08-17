class Solution {
    fun minNumberOperations(target: IntArray): Int {
        var total = target[0]
        for (i in 1 until target.size) {
            if (target[i] > target[i - 1]) {
                total += target[i] - target[i - 1]
            }
        }
        return total
    }
}
