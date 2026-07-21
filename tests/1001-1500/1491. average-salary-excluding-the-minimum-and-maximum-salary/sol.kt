class Solution {
    fun average(salary: IntArray): Double {
        val max = salary.max()
        val min = salary.min()
        var total = 0.0
        var count = 0
        for (s in salary) {
            if (s != max && s != min) {
                total += s
                count++
            }
        }
        return total / count
    }
}
