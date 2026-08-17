class Solution {
    fun closestToTarget(arr: IntArray, target: Int): Int {
        var answer = Int.MAX_VALUE
        var previous = IntArray(0)
        for (value in arr) {
            val current = ArrayList<Int>()
            current.add(value)
            for (old in previous) {
                val candidate = old and value
                if (current.last() != candidate) current.add(candidate)
            }
            for (candidate in current) answer = minOf(answer, kotlin.math.abs(candidate - target))
            previous = current.toIntArray()
        }
        return answer
    }
}
