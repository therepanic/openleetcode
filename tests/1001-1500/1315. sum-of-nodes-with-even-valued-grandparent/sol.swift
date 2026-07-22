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
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        var queue: [(node: TreeNode?, parent: Int, grandparent: Int)] = [(root, -1, -1)]
        var res = 0
        while !queue.isEmpty {
            let (node, parent, grandparent) = queue.removeFirst()
            guard let node = node else { continue }
            if grandparent % 2 == 0 {
                res += node.val
            }
            if node.left != nil {
                queue.append((node.left, node.val, parent))
            }
            if node.right != nil {
                queue.append((node.right, node.val, parent))
            }
        }
        return res
    }
}
