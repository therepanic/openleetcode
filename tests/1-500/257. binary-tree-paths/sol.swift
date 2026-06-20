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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var res = [String]()
        guard let root = root else {
            return res
        }
        var stack = [(node: TreeNode, path: String)]()
        stack.append((root, String(root.val)))
        while !stack.isEmpty {
            let (node, path) = stack.removeLast()
            if node.left == nil && node.right == nil {
                res.append(path)
            }
            if let right = node.right {
                stack.append((right, path + "->" + String(right.val)))
            }
            if let left = node.left {
                stack.append((left, path + "->" + String(left.val)))
            }
        }
        return res
    }
}
