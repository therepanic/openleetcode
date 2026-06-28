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
    var prev: Int?
    var ans = Int.max

    func getMinimumDifference(_ root: TreeNode?) -> Int {
        dfs(root)
        return ans
    }

    private func dfs(_ node: TreeNode?) {
        guard let node = node else { return }
        dfs(node.left)
        if let prev = prev {
            ans = min(ans, node.val - prev)
        }
        prev = node.val
        dfs(node.right)
    }
}
