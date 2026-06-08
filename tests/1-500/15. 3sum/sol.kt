class Solution {
    fun threeSum(nums: IntArray): List<List<Int>> {
        nums.sort()
        val res = mutableListOf<List<Int>>()

        for (i in 0 until nums.size - 2) {
            if (i > 0 && nums[i] == nums[i - 1]) {
                continue
            }
            var left = i + 1
            var right = nums.lastIndex
            while (left < right) {
                val sum = nums[i] + nums[left] + nums[right]
                when {
                    sum == 0 -> {
                        res.add(listOf(nums[i], nums[left], nums[right]))
                        left++
                        right--
                        while (left < right && nums[left] == nums[left - 1]) {
                            left++
                        }
                        while (left < right && nums[right] == nums[right + 1]) {
                            right--
                        }
                    }
                    sum < 0 -> left++
                    else -> right--
                }
            }
        }

        return res
    }
}
