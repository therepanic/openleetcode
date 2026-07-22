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
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        var depthMap: [Int: Int] = [:]
        
        func dfs(_ node: TreeNode?, _ depth: Int) {
            guard let node = node else { return }
            if node.left == nil && node.right == nil {
                depthMap[depth, default: 0] += node.val
            }
            dfs(node.left, depth + 1)
            dfs(node.right, depth + 1)
        }
        
        dfs(root, 0)
        let maxDepth = depthMap.keys.max() ?? 0
        return depthMap[maxDepth] ?? 0
    }
}
