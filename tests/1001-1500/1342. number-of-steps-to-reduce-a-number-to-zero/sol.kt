class Solution {
    fun numberOfSteps(num: Int): Int {
        if (num == 0) return 0
        return num.countLeadingZeroBits().let { 32 - it - 1 } + num.countOneBits()
    }
}
