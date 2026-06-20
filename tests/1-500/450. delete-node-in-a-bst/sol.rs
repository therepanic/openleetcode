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
    pub fn delete_node(root: Option<Rc<RefCell<TreeNode>>>, key: i32) -> Option<Rc<RefCell<TreeNode>>> {
        match root {
            None => None,
            Some(node) => {
                let val = node.borrow().val;
                if key < val {
                    let left = {
                        let mut node_ref = node.borrow_mut();
                        Self::delete_node(node_ref.left.take(), key)
                    };
                    node.borrow_mut().left = left;
                    Some(node)
                } else if key > val {
                    let right = {
                        let mut node_ref = node.borrow_mut();
                        Self::delete_node(node_ref.right.take(), key)
                    };
                    node.borrow_mut().right = right;
                    Some(node)
                } else {
                    let (left, right) = {
                        let mut node_ref = node.borrow_mut();
                        (node_ref.left.take(), node_ref.right.take())
                    };

                    match (left, right) {
                        (None, None) => None,
                        (Some(left_node), None) => Some(left_node),
                        (None, Some(right_node)) => Some(right_node),
                        (Some(left_node), Some(right_node)) => {
                            Self::attach_rightmost(left_node.clone(), right_node);
                            Some(left_node)
                        }
                    }
                }
            }
        }
    }

    fn attach_rightmost(mut node: Rc<RefCell<TreeNode>>, right_subtree: Rc<RefCell<TreeNode>>) {
        loop {
            let next_right = node.borrow().right.clone();
            match next_right {
                Some(right) => node = right,
                None => {
                    node.borrow_mut().right = Some(right_subtree);
                    return;
                }
            }
        }
    }
}
