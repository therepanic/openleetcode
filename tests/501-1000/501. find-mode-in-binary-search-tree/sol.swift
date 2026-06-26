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
    func findMode(_ root: TreeNode?) -> [Int] {
        var lst = [Int]()
        func traverse(_ curr: TreeNode?) {
            if let curr = curr {
                lst.append(curr.val)
                traverse(curr.left)
                traverse(curr.right)
            }
        }
        traverse(root)
        var d = [Int: Int]()
        for v in lst {
            d[v, default: 0] += 1
        }
        var m = 0
        for v in lst {
            m = max(m, d[v]!)
        }
        var sol = Set<Int>()
        for v in lst {
            if d[v] == m {
                sol.insert(v)
            }
        }
        return Array(sol)
    }
}
