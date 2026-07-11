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
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        func prune(_ node: TreeNode?) -> TreeNode? {
            guard let node = node else {
                return nil
            }
            let left = prune(node.left)
            let right = prune(node.right)
            if node.val == 0 && left == nil && right == nil {
                return nil
            }
            return TreeNode(node.val, left, right)
        }

        return prune(root)
    }
}
