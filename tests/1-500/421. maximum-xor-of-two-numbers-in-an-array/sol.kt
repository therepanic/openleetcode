class Solution {
    fun findMaximumXOR(nums: IntArray): Int {
        val mxBit = nums.max().countOneBits().let { 32 - Integer.numberOfLeadingZeros(nums.max()) }
        val trie = mutableListOf(intArrayOf(-1, -1))
        
        fun insert(num: Int) {
            var node = 0
            for (i in mxBit - 1 downTo 0) {
                val bit = (num shr i) and 1
                if (trie[node][bit] == -1) {
                    trie[node][bit] = trie.size
                    trie.add(intArrayOf(-1, -1))
                }
                node = trie[node][bit]
            }
        }
        
        fun getMax(num: Int): Int {
            var node = 0
            var ans = 0
            for (i in mxBit - 1 downTo 0) {
                val bit = (num shr i) and 1
                val opp = 1 - bit
                if (trie[node][opp] != -1) {
                    ans = ans or (1 shl i)
                    node = trie[node][opp]
                } else {
                    node = trie[node][bit]
                }
            }
            return ans
        }
        
        for (num in nums) insert(num)
        
        var res = 0
        for (num in nums) res = maxOf(res, getMax(num))
        
        return res
    }
}
