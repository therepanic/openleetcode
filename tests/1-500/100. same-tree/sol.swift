class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let left = p, let right = q else {
            return p == nil && q == nil
        }
        return left.val == right.val &&
            isSameTree(left.left, right.left) &&
            isSameTree(left.right, right.right)
    }
}
