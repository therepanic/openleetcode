impl Solution {
    pub fn minimum_time_required(jobs: Vec<i32>, k: i32) -> i32 {
        let mut jobs = jobs;
        jobs.sort_by(|a, b| b.cmp(a));
        let k = k as usize;
        let mut left = jobs[0];
        let mut right: i32 = jobs.iter().sum();
        
        fn can_distribute(jobs: &Vec<i32>, k: usize, max_workload: i32) -> bool {
            let mut workers = vec![0; k];
            fn assign_job(jobs: &Vec<i32>, workers: &mut Vec<i32>, job_index: usize, max_workload: i32) -> bool {
                if job_index == jobs.len() {
                    return true;
                }
                for i in 0..workers.len() {
                    if workers[i] + jobs[job_index] <= max_workload {
                        workers[i] += jobs[job_index];
                        if assign_job(jobs, workers, job_index + 1, max_workload) {
                            return true;
                        }
                        workers[i] -= jobs[job_index];
                    }
                    if workers[i] == 0 {
                        break;
                    }
                }
                false
            }
            assign_job(jobs, &mut workers, 0, max_workload)
        }
        
        while left < right {
            let mid = (left + right) / 2;
            if can_distribute(&jobs, k, mid) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        left
    }
}
