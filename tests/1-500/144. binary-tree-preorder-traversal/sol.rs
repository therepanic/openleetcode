impl Solution {
    pub fn preorder_traversal(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        let mut result = Vec::new();
        let mut stack = Vec::new();
        if let Some(node) = root {
            stack.push(node);
        } else {
            return result;
        }

        while let Some(node) = stack.pop() {
            let borrowed = node.borrow();
            result.push(borrowed.val);
            if let Some(right) = borrowed.right.clone() {
                stack.push(right);
            }
            if let Some(left) = borrowed.left.clone() {
                stack.push(left);
            }
        }
        result
    }
}
