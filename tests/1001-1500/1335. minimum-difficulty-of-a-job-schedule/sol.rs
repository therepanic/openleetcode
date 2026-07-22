impl Solution {
    pub fn min_difficulty(job_difficulty: Vec<i32>, d: i32) -> i32 {
        let length = job_difficulty.len();
        let d = d as usize;
        if d > length {
            return -1;
        }

        let mut min_difficulties = vec![vec![i32::MAX; length]; d];

        let mut max_diff = 0;
        let mut i = 0;
        while i <= length - d {
            max_diff = max_diff.max(job_difficulty[i]);
            min_difficulties[0][i] = max_diff;
            i += 1;
        }

        let mut current_day = 1;
        while current_day < d {
            let mut to = current_day;
            while to <= length - d + current_day {
                let mut current_job_difficulty = job_difficulty[to];
                let mut result = i32::MAX;
                let mut j = to as i32 - 1;
                while j >= (current_day as i32 - 1) {
                    let prev = min_difficulties[current_day - 1][j as usize];
                    if prev != i32::MAX {
                        result = result.min(prev + current_job_difficulty);
                    }
                    current_job_difficulty = current_job_difficulty.max(job_difficulty[j as usize]);
                    j -= 1;
                }
                min_difficulties[current_day][to] = result;
                to += 1;
            }
            current_day += 1;
        }

        min_difficulties[d - 1][length - 1]
    }
}
