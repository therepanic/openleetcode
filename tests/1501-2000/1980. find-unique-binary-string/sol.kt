class Solution {
    fun findDifferentBinaryString(nums: Array<String>): String {
        return nums.mapIndexed { i, s -> if (s[i] == '0') '1' else '0' }.joinToString("")
    }
}
