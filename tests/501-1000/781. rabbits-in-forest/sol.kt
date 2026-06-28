class Solution {
    fun numRabbits(answers: IntArray): Int {
        val mpp = mutableMapOf<Int, Int>()
        for (a in answers) {
            mpp[a] = mpp.getOrDefault(a, 0) + 1
        }
        var total = 0
        for ((x, count) in mpp) {
            total += Math.ceil(count.toDouble() / (x + 1)).toInt() * (x + 1)
        }
        return total
    }
}
