class Solution {
    fun numTeams(rating: IntArray): Int {
        var total = 0
        val n = rating.size
        for (j in 1 until n - 1) {
            var leftLess = 0
            var leftGreater = 0
            for (i in 0 until j) {
                if (rating[i] < rating[j]) {
                    leftLess++
                } else if (rating[i] > rating[j]) {
                    leftGreater++
                }
            }
            
            var rightLess = 0
            var rightGreater = 0
            for (k in j + 1 until n) {
                if (rating[k] < rating[j]) {
                    rightLess++
                } else if (rating[k] > rating[j]) {
                    rightGreater++
                }
            }
            
            total += leftLess * rightGreater + leftGreater * rightLess
        }
        return total
    }
}
