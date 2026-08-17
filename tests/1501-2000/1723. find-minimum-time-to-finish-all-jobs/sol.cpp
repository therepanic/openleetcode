class Solution {
public:
    int minimumTimeRequired(vector<int>& jobs, int k) {
        sort(jobs.rbegin(), jobs.rend());
        int left = jobs[0];
        int right = accumulate(jobs.begin(), jobs.end(), 0);
        
        function<bool(int)> canDistribute = [&](int maxWorkload) {
            vector<int> workers(k, 0);
            function<bool(int)> assignJob = [&](int jobIndex) {
                if (jobIndex == jobs.size()) return true;
                for (int i = 0; i < k; i++) {
                    if (workers[i] + jobs[jobIndex] <= maxWorkload) {
                        workers[i] += jobs[jobIndex];
                        if (assignJob(jobIndex + 1)) return true;
                        workers[i] -= jobs[jobIndex];
                    }
                    if (workers[i] == 0) break;
                }
                return false;
            };
            return assignJob(0);
        };
        
        while (left < right) {
            int mid = (left + right) / 2;
            if (canDistribute(mid)) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        return left;
    }
};
