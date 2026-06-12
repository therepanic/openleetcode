
class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var result = [[Int]]()
        var path = [Int]()

        func dfs(_ node: TreeNode?, _ remaining: Int) {
            guard let node = node else { return }
            path.append(node.val)
            let next = remaining - node.val
            if node.left == nil && node.right == nil && next == 0 {
                result.append(path)
            } else {
                dfs(node.left, next)
                dfs(node.right, next)
            }
            path.removeLast()
        }

        dfs(root, targetSum)
        return result
    }
}
