impl Solution {
    pub fn box_delivering(boxes: Vec<Vec<i32>>, ports_count: i32, max_boxes: i32, max_weight: i32) -> i32 {
        let n = boxes.len();
        let mut ports = vec![0; n+1];
        let mut weights = vec![0; n+1];
        for (i, box_) in boxes.iter().enumerate() {
            ports[i+1] = box_[0];
            weights[i+1] = box_[1];
        }
        let mut prefix_weights = vec![0; n+1];
        for i in 1..=n {
            prefix_weights[i] = prefix_weights[i-1] + weights[i];
        }
        let mut ports_cnt = vec![0; n+2];
        for i in 2..=n {
            ports_cnt[i] = ports_cnt[i-1] + if ports[i] != ports[i-1] {1} else {0};
        }
        ports_cnt[n+1] = ports_cnt[n];
        let mut dp = vec![0; n+1];
        let mut queue = Vec::with_capacity(n+1);
        queue.push(0);
        let mut left = 0;
        for i in 1..=n {
            while (i as i32 - left as i32) > max_boxes || (prefix_weights[i] - prefix_weights[left]) > max_weight {
                if !queue.is_empty() && queue[0] == left {
                    queue.remove(0);
                }
                left += 1;
            }
            dp[i] = 2 + ports_cnt[i] + (dp[queue[0]] - ports_cnt[queue[0]+1]);
            let idx = dp[i] - ports_cnt[i+1];
            while !queue.is_empty() && (dp[*queue.last().unwrap()] - ports_cnt[*queue.last().unwrap()+1]) >= idx {
                queue.pop();
            }
            queue.push(i);
        }
        dp[n]
    }
}
