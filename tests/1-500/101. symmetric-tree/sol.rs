
impl Solution {
    pub fn is_symmetric(root: Option<Rc<RefCell<TreeNode>>>) -> bool {
        fn mirror(left: Option<Rc<RefCell<TreeNode>>>, right: Option<Rc<RefCell<TreeNode>>>) -> bool {
            match (left, right) {
                (None, None) => true,
                (Some(l), Some(r)) => {
                    let (lv, ll, lr) = {
                        let node = l.borrow();
                        (node.val, node.left.clone(), node.right.clone())
                    };
                    let (rv, rl, rr) = {
                        let node = r.borrow();
                        (node.val, node.left.clone(), node.right.clone())
                    };
                    lv == rv && mirror(ll, rr) && mirror(lr, rl)
                }
                _ => false,
            }
        }

        match root {
            None => true,
            Some(node) => {
                let borrowed = node.borrow();
                mirror(borrowed.left.clone(), borrowed.right.clone())
            }
        }
    }
}
