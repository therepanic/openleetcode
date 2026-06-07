impl Solution {
    pub fn is_same_tree(
        p: Option<Rc<RefCell<TreeNode>>>,
        q: Option<Rc<RefCell<TreeNode>>>,
    ) -> bool {
        match (p, q) {
            (None, None) => true,
            (Some(a), Some(b)) => {
                let (a_left, a_val, a_right) = {
                    let node = a.borrow();
                    (node.left.clone(), node.val, node.right.clone())
                };
                let (b_left, b_val, b_right) = {
                    let node = b.borrow();
                    (node.left.clone(), node.val, node.right.clone())
                };
                a_val == b_val
                    && Self::is_same_tree(a_left, b_left)
                    && Self::is_same_tree(a_right, b_right)
            }
            _ => false,
        }
    }
}
