class Solution {
    fun findingUsersActiveMinutes(logs: Array<IntArray>, k: Int): IntArray {
        val mp = HashMap<Int, HashSet<Int>>()
        for (log in logs) {
            mp.getOrPut(log[0]) { HashSet() }.add(log[1])
        }
        val ans = IntArray(k)
        for (set in mp.values) {
            val size = set.size
            if (size <= k) {
                ans[size - 1]++
            }
        }
        return ans
    }
}
