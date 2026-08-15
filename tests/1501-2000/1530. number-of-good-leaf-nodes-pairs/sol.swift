class Solution {
    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
        var answer = 0
        func dfs(_ node: TreeNode?) -> [Int] {
            guard let node = node else { return [] }
            if node.left == nil && node.right == nil { return [1] }
            let left = dfs(node.left)
            let right = dfs(node.right)
            for a in left {
                for b in right where a + b <= distance { answer += 1 }
            }
            return (left + right).compactMap { $0 < distance ? $0 + 1 : nil }
        }
        _ = dfs(root)
        return answer
    }
}
