class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var result: [Int] = []
        var queue: [TreeNode] = [root]
        var index = 0
        while index < queue.count {
            let levelEnd = queue.count
            var rightmost = 0
            while index < levelEnd {
                let node = queue[index]
                index += 1
                rightmost = node.val
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(rightmost)
        }
        return result
    }
}
