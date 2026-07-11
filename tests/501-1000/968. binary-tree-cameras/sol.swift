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
    func minCameraCover(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let res = dfs(node.left) + dfs(node.right)
            var curr = Int.max
            if let left = node.left { curr = min(curr, left.val) }
            if let right = node.right { curr = min(curr, right.val) }
            if curr == 0 {
                node.val = 1
                return res + 1
            } else if curr == 1 {
                node.val = 2
            }
            return res
        }
        return dfs(root) + (root!.val == 0 ? 1 : 0)
    }
}
