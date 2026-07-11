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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var res: [(parent: TreeNode?, depth: Int)] = []
        var stack: [(node: TreeNode, parent: TreeNode?, depth: Int)] = [(root!, nil, 0)]
        while !stack.isEmpty {
            let (curr, parent, depth) = stack.removeLast()
            if curr.val == x || curr.val == y {
                res.append((parent, depth))
            }
            if let left = curr.left {
                stack.append((left, curr, depth + 1))
            }
            if let right = curr.right {
                stack.append((right, curr, depth + 1))
            }
        }
        return res.count == 2 && res[0].depth == res[1].depth && res[0].parent?.val != res[1].parent?.val
    }
}
