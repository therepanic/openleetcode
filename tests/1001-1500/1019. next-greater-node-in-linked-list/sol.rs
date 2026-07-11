impl Solution {
    pub fn next_larger_nodes(head: Option<Box<ListNode>>) -> Vec<i32> {
        let mut arr = Vec::new();
        let mut curr = &head;
        while let Some(node) = curr {
            arr.push(node.val);
            curr = &node.next;
        }
        let n = arr.len();
        let mut ans = vec![0; n];
        let mut stack: Vec<usize> = Vec::new();
        for i in 0..n {
            while let Some(&top) = stack.last() {
                if arr[i] > arr[top] {
                    ans[stack.pop().unwrap()] = arr[i];
                } else {
                    break;
                }
            }
            stack.push(i);
        }
        ans
    }
}
