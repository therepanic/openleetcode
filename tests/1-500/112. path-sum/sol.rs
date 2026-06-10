
impl Solution {
    pub fn has_path_sum(root: Option<Rc<RefCell<TreeNode>>>, target_sum: i32) -> bool {
        match root {
            None => false,
            Some(node) => {
                let (val, left, right) = {
                    let borrowed = node.borrow();
                    (borrowed.val, borrowed.left.clone(), borrowed.right.clone())
                };
                if left.is_none() && right.is_none() {
                    return val == target_sum;
                }
                let remaining = target_sum - val;
                Self::has_path_sum(left, remaining) || Self::has_path_sum(right, remaining)
            }
        }
    }
}
