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
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        if let left = root.left, left.val != root.val {
            return false
        }
        if let right = root.right, right.val != root.val {
            return false
        }
        return isUnivalTree(root.left) && isUnivalTree(root.right)
    }
}
