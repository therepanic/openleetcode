func generateTrees(_ n: Int) -> [TreeNode?] {
    if n == 0 {
        return []
    }
    return buildTrees(1, n)
}

private func buildTrees(_ start: Int, _ end: Int) -> [TreeNode?] {
    if start > end {
        return [nil]
    }

    var result = [TreeNode?]()
    for rootValue in start...end {
        let leftTrees = buildTrees(start, rootValue - 1)
        let rightTrees = buildTrees(rootValue + 1, end)
        for left in leftTrees {
            for right in rightTrees {
                let root = TreeNode(rootValue)
                root.left = left
                root.right = right
                result.append(root)
            }
        }
    }

    return result
}
