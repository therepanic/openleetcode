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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        func helper(_ root: TreeNode?, _ leaves: inout [Int]) {
            guard let root else { return }
            var stack = [root]
            while !stack.isEmpty {
                let curr = stack.removeLast()
                if curr.left == nil && curr.right == nil {
                    leaves.append(curr.val)
                }
                if let right = curr.right {
                    stack.append(right)
                }
                if let left = curr.left {
                    stack.append(left)
                }
            }
        }
        var leaves1: [Int] = []
        var leaves2: [Int] = []
        helper(root1, &leaves1)
        helper(root2, &leaves2)
        return leaves1 == leaves2
    }
}
