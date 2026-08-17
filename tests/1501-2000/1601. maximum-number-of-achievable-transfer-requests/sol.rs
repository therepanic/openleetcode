impl Solution {
    pub fn maximum_requests(n: i32, requests: Vec<Vec<i32>>) -> i32 {
        let mut ans = 0;
        let mut indegree = vec![0; n as usize];
        Self::helper(0, &requests, &mut indegree, n as usize, 0, &mut ans);
        ans
    }
    
    fn helper(start: usize, requests: &Vec<Vec<i32>>, indegree: &mut Vec<i32>, n: usize, count: i32, ans: &mut i32) {
        if start == requests.len() {
            for i in 0..n {
                if indegree[i] != 0 {
                    return;
                }
            }
            if count > *ans {
                *ans = count;
            }
            return;
        }
        
        // Take
        indegree[requests[start][0] as usize] -= 1;
        indegree[requests[start][1] as usize] += 1;
        Self::helper(start + 1, requests, indegree, n, count + 1, ans);
        
        // Not-take
        indegree[requests[start][0] as usize] += 1;
        indegree[requests[start][1] as usize] -= 1;
        Self::helper(start + 1, requests, indegree, n, count, ans);
    }
}
