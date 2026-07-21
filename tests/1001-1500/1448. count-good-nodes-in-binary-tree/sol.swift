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
    func goodNodes(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?, _ maxSoFar: Int) -> Int {
            guard let node = node else { return 0 }
            var count = node.val >= maxSoFar ? 1 : 0
            let newMax = max(maxSoFar, node.val)
            count += dfs(node.left, newMax)
            count += dfs(node.right, newMax)
            return count
        }
        return dfs(root, root!.val)
    }
}
