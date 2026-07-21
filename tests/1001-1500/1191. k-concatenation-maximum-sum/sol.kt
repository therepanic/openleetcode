class Solution {
    fun kConcatenationMaxSum(arr: IntArray, k: Int): Int {
        val MOD = 1000000007
        
        fun kadanes(nums: IntArray): Long {
            var best = 0L
            var total = 0L
            for (x in nums) {
                total += x
                if (total < 0) total = 0
                best = maxOf(best, total)
            }
            return best
        }
        
        if (k <= 3) {
            val extended = IntArray(arr.size * k) { arr[it % arr.size] }
            return (kadanes(extended) % MOD).toInt()
        }
        
        val sum = arr.fold(0L) { acc, x -> acc + x }
        val s = maxOf(0L, sum * (k - 1)) % MOD
        
        val doubleArr = IntArray(arr.size * 2) { arr[it % arr.size] }
        
        return (maxOf(s + kadanes(arr), kadanes(doubleArr)) % MOD).toInt()
    }
}
