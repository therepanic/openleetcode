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
    private func findHeight(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        var height = 0
        if let left = node.left {
            height = max(height, 1 + findHeight(left))
        }
        if let right = node.right {
            height = max(height, 1 + findHeight(right))
        }
        return height
    }

    func printTree(_ root: TreeNode?) -> [[String]] {
        let height = findHeight(root)
        let m = height + 1
        let n = (1 << (height + 1)) - 1
        var matrix = Array(repeating: Array(repeating: "", count: n), count: m)
        var queue = [(TreeNode, Int, Int)]()
        queue.append((root!, 0, (n - 1) / 2))
        while !queue.isEmpty {
            let levelSize = queue.count
            for _ in 0..<levelSize {
                let (frontNode, x, y) = queue.removeFirst()
                matrix[x][y] = String(frontNode.val)
                if let left = frontNode.left {
                    queue.append((left, x + 1, y - (1 << (height - x - 1))))
                }
                if let right = frontNode.right {
                    queue.append((right, x + 1, y + (1 << (height - x - 1))))
                }
            }
        }
        return matrix
    }
}
