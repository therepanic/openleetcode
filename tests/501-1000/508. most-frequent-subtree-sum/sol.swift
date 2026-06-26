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
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        var c = [Int: Int]()
        var maxCnt = 0
        func s(_ n: TreeNode?) -> Int {
            guard let n = n else { return 0 }
            let r = n.val + s(n.left) + s(n.right)
            c[r, default: 0] += 1
            if c[r]! > maxCnt { maxCnt = c[r]! }
            return r
        }
        s(root)
        var res = [Int]()
        for (k, v) in c {
            if v == maxCnt { res.append(k) }
        }
        return res
    }
}
