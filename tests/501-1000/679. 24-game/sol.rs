impl Solution {
    pub fn judge_point24(cards: Vec<i32>) -> bool {
        const EPS: f64 = 1e-6;

        fn dfs(nums: &[f64]) -> bool {
            if nums.len() == 1 {
                return (nums[0] - 24.0).abs() < EPS;
            }

            for i in 0..nums.len() {
                for j in 0..nums.len() {
                    if i == j {
                        continue;
                    }

                    let mut next_nums: Vec<f64> = Vec::new();
                    for k in 0..nums.len() {
                        if k != i && k != j {
                            next_nums.push(nums[k]);
                        }
                    }

                    let a = nums[i];
                    let b = nums[j];
                    let mut candidates = vec![a + b, a - b, b - a, a * b];
                    if b.abs() > EPS {
                        candidates.push(a / b);
                    }
                    if a.abs() > EPS {
                        candidates.push(b / a);
                    }

                    for val in candidates {
                        let mut new_nums = next_nums.clone();
                        new_nums.push(val);
                        if dfs(&new_nums) {
                            return true;
                        }
                    }
                }
            }
            false
        }

        let nums: Vec<f64> = cards.iter().map(|&x| x as f64).collect();
        dfs(&nums)
    }
}
