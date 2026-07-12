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
    pub fn insert_into_max_tree(root: Option<Rc<RefCell<TreeNode>>>, val: i32) -> Option<Rc<RefCell<TreeNode>>> {
        fn dfs(node: Option<Rc<RefCell<TreeNode>>>, val: i32) -> Option<Rc<RefCell<TreeNode>>> {
            match node {
                None => Some(Rc::new(RefCell::new(TreeNode::new(val)))),
                Some(n) => {
                    if n.borrow().val > val {
                        let right = n.borrow().right.clone();
                        let new_right = dfs(right, val);
                        n.borrow_mut().right = new_right;
                        Some(n)
                    } else {
                        let temp = Rc::new(RefCell::new(TreeNode::new(val)));
                        temp.borrow_mut().left = Some(n);
                        Some(temp)
                    }
                }
            }
        }
        dfs(root, val)
    }
}
