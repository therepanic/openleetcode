impl Solution {
    pub fn count_pairs(root: Option<Rc<RefCell<TreeNode>>>, distance: i32) -> i32 {
        fn dfs(node: Option<Rc<RefCell<TreeNode>>>, distance: i32, answer: &mut i32) -> Vec<i32> {
            let Some(node) = node else { return Vec::new() };
            let (left, right) = {
                let node = node.borrow();
                (node.left.clone(), node.right.clone())
            };
            if left.is_none() && right.is_none() { return vec![1]; }
            let left_distances = dfs(left, distance, answer);
            let right_distances = dfs(right, distance, answer);
            for &a in &left_distances {
                for &b in &right_distances {
                    if a + b <= distance { *answer += 1; }
                }
            }
            let mut result = Vec::new();
            for value in left_distances.into_iter().chain(right_distances) {
                if value < distance { result.push(value + 1); }
            }
            result
        }

        let mut answer = 0;
        dfs(root, distance, &mut answer);
        answer
    }
}
