
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        func build(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right { return nil }
            let mid = left + (right - left + 1) / 2
            let root = TreeNode(nums[mid])
            root.left = build(left, mid - 1)
            root.right = build(mid + 1, right)
            return root
        }
        return build(0, nums.count - 1)
    }
}
