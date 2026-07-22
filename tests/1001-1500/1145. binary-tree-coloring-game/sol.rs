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
    pub fn btree_game_winning_move(root: Option<Rc<RefCell<TreeNode>>>, n: i32, x: i32) -> bool {
        fn subtree_count(node: Option<&Rc<RefCell<TreeNode>>>) -> i32 {
            match node {
                None => 0,
                Some(n) => {
                    let n = n.borrow();
                    let left_count = subtree_count(n.left.as_ref());
                    let right_count = subtree_count(n.right.as_ref());
                    left_count + right_count + 1
                }
            }
        }

        let mut queue = std::collections::VecDeque::new();
        queue.push_back(root.clone());
        let mut target: Option<Rc<RefCell<TreeNode>>> = None;
        while let Some(front) = queue.pop_front() {
            if let Some(f) = front {
                if f.borrow().val == x {
                    target = Some(f.clone());
                    break;
                }
                let f = f.borrow();
                if f.left.is_some() {
                    queue.push_back(f.left.clone());
                }
                if f.right.is_some() {
                    queue.push_back(f.right.clone());
                }
            }
        }

        let target = target.unwrap();
        let target = target.borrow();
        let left_count = subtree_count(target.left.as_ref());
        let right_count = subtree_count(target.right.as_ref());
        let parent_count = n - left_count - right_count - 1;
        if parent_count > left_count + right_count {
            return true;
        } else if left_count > parent_count + right_count {
            return true;
        } else if right_count > parent_count + left_count {
            return true;
        }
        false
    }
}
