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
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        var m = [0]
        dfs(root, &m)
        return m[0]
    }
    
    private func dfs(_ root: TreeNode?, _ m: inout [Int]) -> (Int, Int) {
        guard let root = root else {
            return (Int.max, Int.min)
        }
        let left = dfs(root.left, &m)
        let right = dfs(root.right, &m)
        let minVal = min(root.val, min(left.0, right.0))
        let maxVal = max(root.val, max(left.1, right.1))
        m[0] = max(m[0], max(abs(minVal - root.val), abs(maxVal - root.val)))
        return (minVal, maxVal)
    }
}
