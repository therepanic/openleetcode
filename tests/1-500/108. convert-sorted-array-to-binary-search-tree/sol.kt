
class Solution {
    private lateinit var numsRef: IntArray

    fun sortedArrayToBST(nums: IntArray): TreeNode? {
        numsRef = nums
        return build(0, nums.size - 1)
    }

    private fun build(left: Int, right: Int): TreeNode? {
        if (left > right) return null
        val mid = left + (right - left + 1) / 2
        val root = TreeNode(numsRef[mid])
        root.left = build(left, mid - 1)
        root.right = build(mid + 1, right)
        return root
    }
}
