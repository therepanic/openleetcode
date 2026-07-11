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
    func recoverFromPreorder(_ traversal: String) -> TreeNode? {
        var stack = [TreeNode]()
        var root: TreeNode?
        let chars = Array(traversal)
        var i = 0
        while i < chars.count {
            var depth = 0
            while i < chars.count && chars[i] == "-" {
                depth += 1
                i += 1
            }
            var num = 0
            while i < chars.count && chars[i].isNumber {
                num = num * 10 + chars[i].wholeNumberValue!
                i += 1
            }
            let node = TreeNode(num)
            while stack.count > depth {
                stack.removeLast()
            }
            if stack.isEmpty {
                root = node
            } else {
                let parent = stack.last!
                if parent.left == nil {
                    parent.left = node
                } else {
                    parent.right = node
                }
            }
            stack.append(node)
        }
        return root
    }
}
