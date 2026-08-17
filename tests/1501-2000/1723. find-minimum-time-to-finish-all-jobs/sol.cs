public class Solution {
    public int MinimumTimeRequired(int[] jobs, int k) {
        Array.Sort(jobs);
        Array.Reverse(jobs);
        int left = jobs[0];
        int right = jobs.Sum();
        
        bool CanDistribute(int maxWorkload) {
            int[] workers = new int[k];
            bool AssignJob(int jobIndex) {
                if (jobIndex == jobs.Length) return true;
                for (int i = 0; i < k; i++) {
                    if (workers[i] + jobs[jobIndex] <= maxWorkload) {
                        workers[i] += jobs[jobIndex];
                        if (AssignJob(jobIndex + 1)) return true;
                        workers[i] -= jobs[jobIndex];
                    }
                    if (workers[i] == 0) break;
                }
                return false;
            }
            return AssignJob(0);
        }
        
        while (left < right) {
            int mid = (left + right) / 2;
            if (CanDistribute(mid)) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        return left;
    }
}
