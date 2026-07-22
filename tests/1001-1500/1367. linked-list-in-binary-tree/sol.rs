// Definition for singly-linked list.
// #[derive(PartialEq, Eq, Clone, Debug)]
// pub struct ListNode {
//   pub val: i32,
//   pub next: Option<Box<ListNode>>
// }
// 
// impl ListNode {
//   #[inline]
//   fn new(val: i32) -> Self {
//     ListNode {
//       next: None,
//       val
//     }
//   }
// }
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
    fn matches(node: &Option<Rc<RefCell<TreeNode>>>, current: Option<&Box<ListNode>>) -> bool {
        match current {
            None => true,
            Some(curr) => match node {
                None => false,
                Some(rc_node) => {
                    let node_ref = rc_node.borrow();
                    if node_ref.val != curr.val {
                        return false;
                    }
                    Self::matches(&node_ref.left, curr.next.as_ref()) || 
                    Self::matches(&node_ref.right, curr.next.as_ref())
                }
            }
        }
    }

    pub fn is_sub_path(head: Option<Box<ListNode>>, root: Option<Rc<RefCell<TreeNode>>>) -> bool {
        match root {
            None => false,
            Some(ref rc_root) => {
                Self::matches(&Some(rc_root.clone()), head.as_ref()) ||
                Self::is_sub_path(head.clone(), rc_root.borrow().left.clone()) ||
                Self::is_sub_path(head.clone(), rc_root.borrow().right.clone())
            }
        }
    }
}
