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
    func longestZigZag(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var best = 0
        var stack: [(node: TreeNode, endedLeft: Int, endedRight: Int)] = [(root, 0, 0)]
        while !stack.isEmpty {
            let (node, endedLeft, endedRight) = stack.removeLast()
            best = max(best, max(endedLeft, endedRight))
            if let left = node.left {
                stack.append((left, endedRight + 1, 0))
            }
            if let right = node.right {
                stack.append((right, 0, endedLeft + 1))
            }
        }
        return best
    }
}
