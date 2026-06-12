
class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        if root.left == nil && root.right == nil { return root.val == targetSum }
        let remaining = targetSum - root.val
        return hasPathSum(root.left, remaining) || hasPathSum(root.right, remaining)
    }
}
