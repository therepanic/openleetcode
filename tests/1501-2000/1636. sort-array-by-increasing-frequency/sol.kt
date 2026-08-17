class Solution {
    fun frequencySort(nums: IntArray): IntArray {
        val freq = HashMap<Int, Int>()
        for (value in nums) freq[value] = (freq[value] ?: 0) + 1
        return nums.sortedWith(compareBy({ freq[it] }, { -it })).toIntArray()
    }
}
