class Solution {
    fun maxCompatibilitySum(students: Array<IntArray>, mentors: Array<IntArray>): Int {
        val m = students.size
        var maxScore = 0
        val perm = IntArray(m) { it }
        do {
            var total = 0
            for (i in 0 until m) {
                for (j in students[i].indices) {
                    if (students[i][j] == mentors[perm[i]][j]) total++
                }
            }
            maxScore = maxOf(maxScore, total)
        } while (nextPermutation(perm))
        return maxScore
    }
    
    private fun nextPermutation(a: IntArray): Boolean {
        var i = a.size - 2
        while (i >= 0 && a[i] >= a[i+1]) i--
        if (i < 0) return false
        var j = a.size - 1
        while (a[j] <= a[i]) j--
        var t = a[i]; a[i] = a[j]; a[j] = t
        var l = i+1; var r = a.size-1
        while (l < r) {
            t = a[l]; a[l] = a[r]; a[r] = t
            l++; r--
        }
        return true
    }
}
