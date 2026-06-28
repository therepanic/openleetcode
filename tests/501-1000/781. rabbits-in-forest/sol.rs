impl Solution {
    pub fn num_rabbits(answers: Vec<i32>) -> i32 {
        use std::collections::HashMap;
        let mut mpp: HashMap<i32, i32> = HashMap::new();
        for a in answers {
            *mpp.entry(a).or_insert(0) += 1;
        }
        let mut total = 0;
        for (x, count) in mpp {
            total += ((count as f64 / (x + 1) as f64).ceil() as i32) * (x + 1);
        }
        total
    }
}
