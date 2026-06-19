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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?, _ isLeft: Bool) -> Int {
            guard let node = node else { return 0 }
            if node.left == nil && node.right == nil {
                return isLeft ? node.val : 0
            }
            return dfs(node.left, true) + dfs(node.right, false)
        }
        return dfs(root, false)
    }
}
