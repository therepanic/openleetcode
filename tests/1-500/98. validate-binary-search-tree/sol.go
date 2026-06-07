func isValidBST(root *TreeNode) bool {
	var validate func(*TreeNode, *int64, *int64) bool
	validate = func(node *TreeNode, lower *int64, upper *int64) bool {
		if node == nil {
			return true
		}
		value := int64(node.Val)
		if (lower != nil && value <= *lower) || (upper != nil && value >= *upper) {
			return false
		}
		return validate(node.Left, lower, &value) && validate(node.Right, &value, upper)
	}

	return validate(root, nil, nil)
}
