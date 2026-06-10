
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func mirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
            if left == nil || right == nil {
                return left == nil && right == nil
            }
            return left!.val == right!.val &&
                mirror(left!.left, right!.right) &&
                mirror(left!.right, right!.left)
        }
        return root == nil || mirror(root!.left, root!.right)
    }
}
