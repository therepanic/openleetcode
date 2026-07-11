/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil {
            return true
        } else if root1 == nil || root2 == nil || root1!.val != root2!.val {
            return false
        } else {
            let noFlip = flipEquiv(root1!.left, root2!.left) && flipEquiv(root1!.right, root2!.right)
            let yesFlip = flipEquiv(root1!.left, root2!.right) && flipEquiv(root1!.right, root2!.left)
            return noFlip || yesFlip
        }
    }
}
