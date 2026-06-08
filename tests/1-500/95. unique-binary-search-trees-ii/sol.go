func generateTrees(n int) []*TreeNode {
	if n == 0 {
		return []*TreeNode{}
	}
	return buildTrees(1, n)
}

func buildTrees(start int, end int) []*TreeNode {
	if start > end {
		return []*TreeNode{nil}
	}

	result := []*TreeNode{}
	for rootValue := start; rootValue <= end; rootValue++ {
		leftTrees := buildTrees(start, rootValue-1)
		rightTrees := buildTrees(rootValue+1, end)
		for _, left := range leftTrees {
			for _, right := range rightTrees {
				root := &TreeNode{Val: rootValue}
				root.Left = left
				root.Right = right
				result = append(result, root)
			}
		}
	}

	return result
}
