func inorderTraversal(root *TreeNode) []int {
	result := []int{}

	var dfs func(*TreeNode)
	dfs = func(node *TreeNode) {
		if node == nil {
			return
		}
		dfs(node.Left)
		result = append(result, node.Val)
		dfs(node.Right)
	}

	dfs(root)
	return result
}
