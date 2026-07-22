class Solution {
    fun countTriplets(arr: IntArray): Int {
        var totalCount = 0
        var prefixXor = 0
        val prefixCount = mutableMapOf(0 to 1)
        val indexSum = mutableMapOf(0 to 0)
        for (k in 1..arr.size) {
            prefixXor = prefixXor xor arr[k - 1]
            if (prefixCount.containsKey(prefixXor)) {
                totalCount += prefixCount[prefixXor]!! * (k - 1) - indexSum[prefixXor]!!
            } else {
                prefixCount[prefixXor] = 0
                indexSum[prefixXor] = 0
            }
            prefixCount[prefixXor] = prefixCount[prefixXor]!! + 1
            indexSum[prefixXor] = indexSum[prefixXor]!! + k
        }
        return totalCount
    }
}
