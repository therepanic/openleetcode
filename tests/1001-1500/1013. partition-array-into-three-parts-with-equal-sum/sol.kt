class Solution {
    fun canThreePartsEqualSum(arr: IntArray): Boolean {
        val total = arr.sum()
        if (total % 3 != 0) {
            return false
        }
        val target = total / 3
        var currentSum = 0
        var partitions = 0
        for (i in arr.indices) {
            currentSum += arr[i]
            if (currentSum == target) {
                partitions++
                currentSum = 0
                if (partitions == 2 && i < arr.size - 1) {
                    return true
                }
            }
        }
        return false
    }
}
