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
    pub fn subtree_with_all_deepest(root: Option<Rc<RefCell<TreeNode>>>) -> Option<Rc<RefCell<TreeNode>>> {
        fn helper(node: Option<Rc<RefCell<TreeNode>>>) -> (Option<Rc<RefCell<TreeNode>>>, i32) {
            match node {
                None => (None, 0),
                Some(node) => {
                    let (left, right) = {
                        let node_ref = node.borrow();
                        (node_ref.left.clone(), node_ref.right.clone())
                    };
                    let (l_node, l_depth) = helper(left);
                    let (r_node, r_depth) = helper(right);
                    if l_depth > r_depth {
                        (l_node, l_depth + 1)
                    } else if r_depth > l_depth {
                        (r_node, r_depth + 1)
                    } else {
                        (Some(node), l_depth + 1)
                    }
                }
            }
        }

        helper(root).0
    }
}
