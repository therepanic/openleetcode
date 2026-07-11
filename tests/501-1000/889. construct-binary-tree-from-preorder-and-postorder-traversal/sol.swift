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
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty else { return nil }
        let root = TreeNode()
        root.val = preorder[0]
        var stack: [TreeNode] = [root]
        var postIndex = 0

        for value in preorder.dropFirst() {
            let node = TreeNode()
            node.val = value
            while let last = stack.last, postIndex < postorder.count, last.val == postorder[postIndex] {
                stack.removeLast()
                postIndex += 1
            }
            if let parent = stack.last {
                if parent.left == nil {
                    parent.left = node
                } else {
                    parent.right = node
                }
            }
            stack.append(node)
        }

        while let last = stack.last, postIndex < postorder.count, last.val == postorder[postIndex] {
            stack.removeLast()
            postIndex += 1
        }

        return root
    }
}
