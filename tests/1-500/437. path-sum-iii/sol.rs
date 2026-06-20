// Definition for a binary tree node.
// #[derive(Debug, PartialEq, Eq)]
// pub struct TreeNode {
//   pub val: i32,
//   pub left: Option<Rc<RefCell<TreeNode>>>,
//   pub right: Option<Rc<RefCell<TreeNode>>>,
// }
// 
// impl TreeNode {
//   #[inline]
//   pub fn new(val: i32) -> Self {
//     TreeNode {
//       val,
//       left: None,
//       right: None
//     }
//   }
// }
use std::collections::HashMap;

impl Solution {
    pub fn path_sum(root: Option<Rc<RefCell<TreeNode>>>, target_sum: i32) -> i32 {
        let mut prefix_sums: HashMap<i64, i32> = HashMap::new();
        prefix_sums.insert(0, 1);
        
        fn dfs(node: Option<&Rc<RefCell<TreeNode>>>, current_sum: i64, target_sum: i64, prefix_sums: &mut HashMap<i64, i32>) -> i32 {
            match node {
                None => 0,
                Some(rc) => {
                    let node_ref = rc.borrow();
                    let new_sum = current_sum + node_ref.val as i64;
                    let mut count = *prefix_sums.get(&(new_sum - target_sum)).unwrap_or(&0);
                    *prefix_sums.entry(new_sum).or_insert(0) += 1;
                    count += dfs(node_ref.left.as_ref(), new_sum, target_sum, prefix_sums);
                    count += dfs(node_ref.right.as_ref(), new_sum, target_sum, prefix_sums);
                    *prefix_sums.get_mut(&new_sum).unwrap() -= 1;
                    count
                }
            }
        }
        
        dfs(root.as_ref(), 0, target_sum as i64, &mut prefix_sums)
    }
}
