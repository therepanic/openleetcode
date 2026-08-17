impl Solution {
    pub fn merge_triplets(triplets: Vec<Vec<i32>>, target: Vec<i32>) -> bool {
        for t in &triplets {
            if *t == target {
                return true;
            }
        }
        let mut curr = vec![0, 0, 0];
        for t in &triplets {
            let mut flag = false;
            if target[0] == t[0] && curr[0] != target[0] {
                flag = true;
            }
            if target[1] == t[1] && curr[1] != target[1] {
                flag = true;
            }
            if target[2] == t[2] && curr[2] != target[2] {
                flag = true;
            }
            if flag {
                let temp = curr.clone();
                curr[0] = curr[0].max(t[0]);
                curr[1] = curr[1].max(t[1]);
                curr[2] = curr[2].max(t[2]);
                if curr[0] > target[0] || curr[1] > target[1] || curr[2] > target[2] {
                    curr = temp;
                }
            }
        }
        curr == target
    }
}
