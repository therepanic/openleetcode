
impl Solution {
    pub fn level_order(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<Vec<i32>> {
        let mut result = Vec::new();
        let mut queue = VecDeque::new();
        if let Some(node) = root {
            queue.push_back(node);
        } else {
            return result;
        }

        while !queue.is_empty() {
            let size = queue.len();
            let mut level = Vec::with_capacity(size);
            for _ in 0..size {
                let node = queue.pop_front().unwrap();
                let borrowed = node.borrow();
                level.push(borrowed.val);
                if let Some(left) = borrowed.left.clone() {
                    queue.push_back(left);
                }
                if let Some(right) = borrowed.right.clone() {
                    queue.push_back(right);
                }
            }
            result.push(level);
        }
        result
    }
}
