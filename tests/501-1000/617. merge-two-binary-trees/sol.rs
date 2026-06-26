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
    pub fn merge_trees(root1: Option<Rc<RefCell<TreeNode>>>, root2: Option<Rc<RefCell<TreeNode>>>) -> Option<Rc<RefCell<TreeNode>>> {
        match (root1, root2) {
            (None, None) => None,
            (Some(node), None) => Some(node),
            (None, Some(node)) => Some(node),
            (Some(node1), Some(node2)) => {
                {
                    let mut n1 = node1.borrow_mut();
                    let n2 = node2.borrow();
                    n1.val += n2.val;
                    let left1 = n1.left.clone();
                    let left2 = n2.left.clone();
                    drop(n1);
                    drop(n2);
                    let merged_left = Self::merge_trees(left1, left2);
                    let right1 = node1.borrow().right.clone();
                    let right2 = node2.borrow().right.clone();
                    let merged_right = Self::merge_trees(right1, right2);
                    node1.borrow_mut().left = merged_left;
                    node1.borrow_mut().right = merged_right;
                }
                Some(node1)
            }
        }
    }
}
