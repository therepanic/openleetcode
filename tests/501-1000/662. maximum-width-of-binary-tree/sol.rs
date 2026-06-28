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
use std::collections::VecDeque;
impl Solution {
    pub fn width_of_binary_tree(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut q: VecDeque<Option<Rc<RefCell<TreeNode>>>> = VecDeque::new();
        let mut ind: VecDeque<i32> = VecDeque::new();
        let mut res: Vec<Vec<i32>> = Vec::new();
        q.push_back(root);
        ind.push_back(0);
        while !q.is_empty() {
            let mut l: Vec<i32> = Vec::new();
            let size = q.len();
            for _ in 0..size {
                let node = q.pop_front().unwrap();
                let i = ind.pop_front().unwrap();
                if let Some(node_rc) = node {
                    l.push(i);
                    let node_ref = node_rc.borrow();
                    if node_ref.left.is_some() {
                        q.push_back(node_ref.left.clone());
                        ind.push_back(2 * i + 1);
                    }
                    if node_ref.right.is_some() {
                        q.push_back(node_ref.right.clone());
                        ind.push_back(2 * i + 2);
                    }
                }
            }
            res.push(l);
        }
        let mut max_width = 0;
        for r in res {
            if r.len() >= 1 {
                let width = r.last().unwrap() - r.first().unwrap() + 1;
                max_width = max_width.max(width);
            }
        }
        max_width
    }
}
