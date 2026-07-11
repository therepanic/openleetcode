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
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        func helper(_ node: TreeNode?) -> (TreeNode?, Int) {
            guard let node = node else { return (nil, 0) }
            let left = helper(node.left)
            let right = helper(node.right)
            if left.1 > right.1 {
                return (left.0, left.1 + 1)
            }
            if right.1 > left.1 {
                return (right.0, right.1 + 1)
            }
            return (node, left.1 + 1)
        }

        return helper(root).0
    }
}
