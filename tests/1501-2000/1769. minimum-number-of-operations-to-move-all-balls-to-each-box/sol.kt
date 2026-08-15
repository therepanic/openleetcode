class Solution {
    fun minOperations(boxes: String): IntArray {
        val n = boxes.length
        val distances = IntArray(n)
        
        var prefixCount = 0
        var prefixSum = 0
        
        for (i in 0 until n) {
            distances[i] = prefixCount * i - prefixSum
            if (boxes[i] == '1') {
                prefixCount++
                prefixSum += i
            }
        }
        
        var suffixCount = 0
        var suffixSum = 0
        
        for (i in n - 1 downTo 0) {
            distances[i] += suffixSum - suffixCount * i
            if (boxes[i] == '1') {
                suffixCount++
                suffixSum += i
            }
        }
        
        return distances
    }
}
