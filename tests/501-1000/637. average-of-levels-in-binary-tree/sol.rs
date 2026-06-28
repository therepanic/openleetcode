impl Solution {
    pub fn average_of_levels(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<f64> {
        if root.is_none() {
            return vec![];
        }

        let mut res = Vec::new();
        let mut queue = std::collections::VecDeque::new();
        queue.push_back(root.unwrap());

        while !queue.is_empty() {
            let mut level_sum: f64 = 0.0;
            let count = queue.len();

            for _ in 0..count {
                let node_rc = queue.pop_front().unwrap();
                let node = node_rc.borrow();
                level_sum += node.val as f64;
                if let Some(left) = &node.left {
                    queue.push_back(left.clone());
                }
                if let Some(right) = &node.right {
                    queue.push_back(right.clone());
                }
            }

            res.push(level_sum / count as f64);
        }

        res
    }
}
