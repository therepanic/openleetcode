class Solution {
    fun minDays(n: Int): Int {
        var ans = 0
        var queue = mutableListOf(n)
        val seen = mutableSetOf<Int>()
        while (queue.isNotEmpty()) {
            val newq = mutableListOf<Int>()
            for (x in queue) {
                if (x == 0) return ans
                seen.add(x)
                if (x-1 !in seen) newq.add(x-1)
                if (x % 2 == 0 && x/2 !in seen) newq.add(x/2)
                if (x % 3 == 0 && x/3 !in seen) newq.add(x/3)
            }
            ans++
            queue = newq
        }
        return ans
    }
}
