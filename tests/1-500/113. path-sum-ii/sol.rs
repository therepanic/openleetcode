
impl Solution {
    pub fn path_sum(root: Option<Rc<RefCell<TreeNode>>>, target_sum: i32) -> Vec<Vec<i32>> {
        fn dfs(
            node: Option<Rc<RefCell<TreeNode>>>,
            remaining: i32,
            path: &mut Vec<i32>,
            result: &mut Vec<Vec<i32>>,
        ) {
            if let Some(node) = node {
                let (val, left, right) = {
                    let borrowed = node.borrow();
                    (borrowed.val, borrowed.left.clone(), borrowed.right.clone())
                };
                path.push(val);
                let next = remaining - val;
                if left.is_none() && right.is_none() && next == 0 {
                    result.push(path.clone());
                } else {
                    dfs(left, next, path, result);
                    dfs(right, next, path, result);
                }
                path.pop();
            }
        }

        let mut result = Vec::new();
        let mut path = Vec::new();
        dfs(root, target_sum, &mut path, &mut result);
        result
    }
}
