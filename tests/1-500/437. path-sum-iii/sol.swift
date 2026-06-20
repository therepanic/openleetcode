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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var prefixSums: [Int: Int] = [0: 1]
        func dfs(_ node: TreeNode?, _ currentSum: Int) -> Int {
            guard let node = node else { return 0 }
            let sum = currentSum + node.val
            var count = prefixSums[sum - targetSum] ?? 0
            prefixSums[sum, default: 0] += 1
            count += dfs(node.left, sum)
            count += dfs(node.right, sum)
            prefixSums[sum]! -= 1
            return count
        }
        return dfs(root, 0)
    }
}
