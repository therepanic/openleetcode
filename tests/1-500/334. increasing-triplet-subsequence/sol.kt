class Solution {
    fun increasingTriplet(nums: IntArray): Boolean {
        var a = Int.MAX_VALUE
        var b = Int.MAX_VALUE
        var f = false
        for (x in nums) {
            if (x <= a) {
                a = x
            } else if (x <= b) {
                b = x
            } else {
                f = true
            }
        }
        return f
    }
}
