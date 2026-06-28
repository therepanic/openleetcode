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
impl Solution {
    pub fn min_diff_in_bst(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut prev: Option<i32> = None;
        let mut min_diff = i32::MAX;
        
        fn inorder(node: Option<Rc<RefCell<TreeNode>>>, prev: &mut Option<i32>, min_diff: &mut i32) {
            if let Some(n) = node {
                let n = n.borrow();
                inorder(n.left.clone(), prev, min_diff);
                if let Some(p) = prev {
                    let diff = n.val - *p;
                    if diff < *min_diff {
                        *min_diff = diff;
                    }
                }
                *prev = Some(n.val);
                inorder(n.right.clone(), prev, min_diff);
            }
        }
        
        inorder(root, &mut prev, &mut min_diff);
        min_diff
    }
}
