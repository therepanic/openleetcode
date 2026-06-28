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
    func largestValues(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        func dfs(_ node: TreeNode?, _ level: Int) {
            guard let node = node else { return }
            if level == res.count {
                res.append(node.val)
            } else {
                res[level] = max(res[level], node.val)
            }
            dfs(node.left, level + 1)
            dfs(node.right, level + 1)
        }
        dfs(root, 0)
        return res
    }
}
