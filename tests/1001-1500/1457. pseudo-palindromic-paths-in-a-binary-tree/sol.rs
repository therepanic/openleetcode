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
    pub fn pseudo_palindromic_paths (root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut count = 0;
        let mut counter = [0; 10];

        fn check_palindromic(counter: &[i32; 10]) -> bool {
            let mut odd = 0;
            for i in 1..=9 {
                if counter[i] % 2 == 1 {
                    odd += 1;
                    if odd > 1 {
                        return false;
                    }
                }
            }
            true
        }

        fn dfs(node: Option<Rc<RefCell<TreeNode>>>, counter: &mut [i32; 10], count: &mut i32) {
            if let Some(node) = node {
                let node = node.borrow();
                counter[node.val as usize] += 1;

                if node.left.is_none() && node.right.is_none() {
                    if check_palindromic(counter) {
                        *count += 1;
                    }
                } else {
                    dfs(node.left.clone(), counter, count);
                    dfs(node.right.clone(), counter, count);
                }

                counter[node.val as usize] -= 1;
            }
        }

        dfs(root, &mut counter, &mut count);
        count
    }
}
