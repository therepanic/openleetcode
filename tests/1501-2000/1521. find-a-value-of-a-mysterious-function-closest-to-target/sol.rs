impl Solution {
    pub fn closest_to_target(arr: Vec<i32>, target: i32) -> i32 {
        let mut answer = i32::MAX;
        let mut previous: Vec<i32> = Vec::new();
        for value in arr {
            let mut current = vec![value];
            for &old in &previous {
                let next = old & value;
                if current.last() != Some(&next) {
                    current.push(next);
                }
            }
            for &value in &current {
                answer = answer.min((value - target).abs());
            }
            previous = current;
        }
        answer
    }
}
