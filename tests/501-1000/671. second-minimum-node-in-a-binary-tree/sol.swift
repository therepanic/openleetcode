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
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        let first = root!.val
        var second = Int.max
        
        func dfs(_ node: TreeNode?) {
            guard let node = node else { return }
            if first < node.val && node.val < second {
                second = node.val
            }
            dfs(node.left)
            dfs(node.right)
        }
        
        dfs(root)
        return second == Int.max ? -1 : second
    }
}
