class Solution {
    fun threeConsecutiveOdds(arr: IntArray): Boolean {
        return arr.joinToString("") { (it and 1).toString() }.contains("111")
    }
}
