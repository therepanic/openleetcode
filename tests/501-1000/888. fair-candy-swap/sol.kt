class Solution {
    fun fairCandySwap(aliceSizes: IntArray, bobSizes: IntArray): IntArray {
        val sumA = aliceSizes.sum()
        val sumB = bobSizes.sum()
        val diff = (sumB - sumA) / 2
        val setB = bobSizes.toSet()
        for (a in aliceSizes) {
            if (setB.contains(a + diff)) {
                return intArrayOf(a, a + diff)
            }
        }
        return intArrayOf()
    }
}
