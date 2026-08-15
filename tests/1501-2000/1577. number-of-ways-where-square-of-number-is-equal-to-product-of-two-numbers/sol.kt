class Solution {
    fun numTriplets(nums1: IntArray, nums2: IntArray): Int {
        fun countPairs(numsA: IntArray, numsB: IntArray): Int {
            val freq = mutableMapOf<Long, Int>()
            for (i in numsB.indices) {
                for (j in i + 1 until numsB.size) {
                    val prod = numsB[i].toLong() * numsB[j]
                    freq[prod] = freq.getOrDefault(prod, 0) + 1
                }
            }
            var count = 0
            for (num in numsA) {
                count += freq.getOrDefault(num.toLong() * num, 0)
            }
            return count
        }
        return countPairs(nums1, nums2) + countPairs(nums2, nums1)
    }
}
