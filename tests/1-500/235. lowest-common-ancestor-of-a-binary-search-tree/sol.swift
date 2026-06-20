/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var current = root
        while let node = current {
            if min(p!.val, q!.val) > node.val {
                current = node.right
            } else if max(p!.val, q!.val) < node.val {
                current = node.left
            } else {
                return node
            }
        }
        return nil
    }
}
