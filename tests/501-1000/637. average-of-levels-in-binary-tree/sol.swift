class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }

        var res: [Double] = []
        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            var levelSum = 0
            let count = queue.count

            for _ in 0..<count {
                let node = queue.removeFirst()
                levelSum += node.val
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }

            res.append(Double(levelSum) / Double(count))
        }

        return res
    }
}
