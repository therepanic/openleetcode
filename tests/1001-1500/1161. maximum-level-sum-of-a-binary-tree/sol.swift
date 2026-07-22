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
    func maxLevelSum(_ root: TreeNode?) -> Int {
        var idx = 0
        var maxSum = Int.min
        var q = [root!]
        var level = 1
        while !q.isEmpty {
            let qz = q.count
            var curSum = 0
            for _ in 0..<qz {
                let node = q.removeFirst()
                curSum += node.val
                if let left = node.left { q.append(left) }
                if let right = node.right { q.append(right) }
            }
            if curSum > maxSum {
                idx = level
                maxSum = curSum
            }
            level += 1
        }
        return idx
    }
}
