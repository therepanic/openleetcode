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
    var count = 0
    var counter = [Int](repeating: 0, count: 10)

    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        dfs(root)
        return count
    }

    func dfs(_ node: TreeNode?) {
        guard let node = node else { return }

        counter[node.val] += 1

        if node.left == nil && node.right == nil {
            if checkPalindromic() {
                count += 1
            }
        } else {
            dfs(node.left)
            dfs(node.right)
        }

        counter[node.val] -= 1
    }

    func checkPalindromic() -> Bool {
        var odd = 0
        for i in 1...9 {
            if counter[i] % 2 == 1 {
                odd += 1
                if odd > 1 {
                    return false
                }
            }
        }
        return true
    }
}
