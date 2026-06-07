impl Solution {
    pub fn inorder_traversal(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        fn dfs(node: Option<Rc<RefCell<TreeNode>>>, result: &mut Vec<i32>) {
            if let Some(node_rc) = node {
                let (left, val, right) = {
                    let node = node_rc.borrow();
                    (node.left.clone(), node.val, node.right.clone())
                };
                dfs(left, result);
                result.push(val);
                dfs(right, result);
            }
        }

        let mut result = Vec::new();
        dfs(root, &mut result);
        result
    }
}
