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
use std::collections::{HashMap, HashSet};
impl Solution {
    pub fn find_mode(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        let mut lst = Vec::new();
        fn traverse(curr: Option<Rc<RefCell<TreeNode>>>, lst: &mut Vec<i32>) {
            if let Some(node) = curr {
                let node = node.borrow();
                lst.push(node.val);
                traverse(node.left.clone(), lst);
                traverse(node.right.clone(), lst);
            }
        }
        traverse(root, &mut lst);
        let mut d = HashMap::new();
        for &v in &lst {
            *d.entry(v).or_insert(0) += 1;
        }
        let mut m = 0;
        for &v in &lst {
            m = m.max(d[&v]);
        }
        let mut sol = HashSet::new();
        for &v in &lst {
            if d[&v] == m {
                sol.insert(v);
            }
        }
        sol.into_iter().collect()
    }
}
