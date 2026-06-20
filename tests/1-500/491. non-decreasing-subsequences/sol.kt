class Solution {
    fun findSubsequences(nums: IntArray): List<List<Int>> {
        val result = mutableSetOf<List<Int>>()
        
        fun backtrack(index: Int, path: MutableList<Int>) {
            if (path.size >= 2) {
                result.add(path.toList())
            }
            for (i in index until nums.size) {
                if (path.isEmpty() || nums[i] >= path.last()) {
                    path.add(nums[i])
                    backtrack(i + 1, path)
                    path.removeAt(path.size - 1)
                }
            }
        }
        
        backtrack(0, mutableListOf())
        return result.toList()
    }
}
