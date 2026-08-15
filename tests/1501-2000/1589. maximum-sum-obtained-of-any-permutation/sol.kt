class Solution {
    fun maxSumRangeQuery(nums: IntArray, requests: Array<IntArray>): Int {
        val events = mutableListOf<Pair<Int, Int>>()
        val mod = 1000000007
        
        for (req in requests) {
            events.add(Pair(req[0], 1))
            events.add(Pair(req[1]+1, -1))
        }
        
        events.sortBy { it.first }
        
        var cnt = 0
        var prev = -1
        val weight = mutableMapOf<Int, Long>()
        
        for ((pos, delta) in events) {
            if (prev != -1 && cnt != 0) {
                weight[cnt] = weight.getOrDefault(cnt, 0L) + (pos - prev)
            }
            prev = pos
            cnt += delta
        }
        
        val sorted = weight.toList().sortedByDescending { it.first }
        
        nums.sortDescending()
        var ans = 0L
        var idx = 0
        
        for ((wg, num) in sorted) {
            repeat(num.toInt()) {
                ans = (ans + nums[idx].toLong() * wg) % mod
                idx++
            }
        }
        
        return ans.toInt()
    }
}
