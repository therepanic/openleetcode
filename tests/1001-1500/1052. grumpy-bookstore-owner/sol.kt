class Solution {
    fun maxSatisfied(customers: IntArray, grumpy: IntArray, minutes: Int): Int {
        val n = customers.size
        var totalSatisfied = 0
        var currentWindowGain = 0
        
        for (i in 0 until n) {
            if (grumpy[i] == 0) {
                totalSatisfied += customers[i]
            } else if (i < minutes) {
                currentWindowGain += customers[i]
            }
        }
        
        var maxWindowGain = currentWindowGain
        
        for (i in minutes until n) {
            if (grumpy[i] == 1) {
                currentWindowGain += customers[i]
            }
            if (grumpy[i - minutes] == 1) {
                currentWindowGain -= customers[i - minutes]
            }
            if (currentWindowGain > maxWindowGain) {
                maxWindowGain = currentWindowGain
            }
        }
        
        return totalSatisfied + maxWindowGain
    }
}
