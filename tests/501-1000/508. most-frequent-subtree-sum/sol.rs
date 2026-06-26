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
    pub fn find_frequent_tree_sum(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        fn s(n: Option<Rc<RefCell<TreeNode>>>, c: &mut HashMap<i32, i32>, max: &mut i32) -> i32 {
            match n {
                None => 0,
                Some(node) => {
                    let node = node.borrow();
                    let r = node.val + s(node.left.clone(), c, max) + s(node.right.clone(), c, max);
                    let count = c.entry(r).or_insert(0);
                    *count += 1;
                    if *count > *max {
                        *max = *count;
                    }
                    r
                }
            }
        }
        let mut c = HashMap::new();
        let mut max = 0;
        s(root, &mut c, &mut max);
        c.iter().filter(|&(_, &v)| v == max).map(|(&k, _)| k).collect()
    }
}
