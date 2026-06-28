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
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        var q: [TreeNode?] = [root]
        var ind: [Int] = [0]
        var res: [[Int]] = []
        while !q.isEmpty {
            var l: [Int] = []
            let size = q.count
            for _ in 0..<size {
                let node = q.removeFirst()
                let i = ind.removeFirst()
                if let node = node {
                    l.append(i)
                    if let left = node.left {
                        q.append(left)
                        ind.append(2 * i + 1)
                    }
                    if let right = node.right {
                        q.append(right)
                        ind.append(2 * i + 2)
                    }
                }
            }
            res.append(l)
        }
        var maxWidth = 0
        for r in res {
            if r.count >= 1 {
                let width = r.last! - r.first! + 1
                maxWidth = max(maxWidth, width)
            }
        }
        return maxWidth
    }
}
