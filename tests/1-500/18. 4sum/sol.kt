class Solution {
    fun fourSum(nums: IntArray, target: Int): List<List<Int>> {
        nums.sort()
        val res = mutableListOf<List<Int>>()

        for (i in 0 until nums.size - 3) {
            if (i > 0 && nums[i] == nums[i - 1]) {
                continue
            }
            for (j in i + 1 until nums.size - 2) {
                if (j > i + 1 && nums[j] == nums[j - 1]) {
                    continue
                }
                var left = j + 1
                var right = nums.lastIndex
                while (left < right) {
                    val sum = nums[i].toLong() + nums[j].toLong() + nums[left].toLong() + nums[right].toLong()
                    when {
                        sum == target.toLong() -> {
                            res.add(listOf(nums[i], nums[j], nums[left], nums[right]))
                            left++
                            right--
                            while (left < right && nums[left] == nums[left - 1]) {
                                left++
                            }
                            while (left < right && nums[right] == nums[right + 1]) {
                                right--
                            }
                        }
                        sum < target.toLong() -> left++
                        else -> right--
                    }
                }
            }
        }

        return res
    }
}
