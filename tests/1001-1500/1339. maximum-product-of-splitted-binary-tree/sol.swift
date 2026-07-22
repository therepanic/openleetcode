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
    func maxProduct(_ root: TreeNode?) -> Int {
        let mod = 1_000_000_007
        var nodes: [TreeNode] = []
        var stack: [TreeNode?] = [root]

        while !stack.isEmpty {
            guard let node = stack.removeLast() else { continue }
            nodes.append(node)
            stack.append(node.left)
            stack.append(node.right)
        }

        var sums: [ObjectIdentifier: Int] = [:]
        for node in nodes.reversed() {
            let leftSum = node.left.map { sums[ObjectIdentifier($0)] ?? 0 } ?? 0
            let rightSum = node.right.map { sums[ObjectIdentifier($0)] ?? 0 } ?? 0
            sums[ObjectIdentifier(node)] = node.val + leftSum + rightSum
        }

        let total = sums[ObjectIdentifier(root!)]!
        var best = 0
        for sub in sums.values {
            best = max(best, sub * (total - sub))
        }
        return best % mod
    }
}
