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
    pub fn diameter_of_binary_tree(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        fn height(node: &Option<Rc<RefCell<TreeNode>>>) -> i32 {
            match node {
                None => 0,
                Some(n) => {
                    let n = n.borrow();
                    1 + std::cmp::max(height(&n.left), height(&n.right))
                }
            }
        }
        
        fn diameter(node: &Option<Rc<RefCell<TreeNode>>>) -> i32 {
            match node {
                None => 0,
                Some(n) => {
                    let n = n.borrow();
                    let diameter_through_node = height(&n.left) + height(&n.right);
                    let left_diameter = diameter(&n.left);
                    let right_diameter = diameter(&n.right);
                    std::cmp::max(diameter_through_node, std::cmp::max(left_diameter, right_diameter))
                }
            }
        }
        
        diameter(&root)
    }
}
