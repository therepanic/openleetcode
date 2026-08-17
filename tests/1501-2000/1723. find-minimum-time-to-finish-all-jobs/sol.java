class Solution {
    public int minimumTimeRequired(int[] jobs, int k) {
        java.util.Arrays.sort(jobs);
        for (int i = 0, j = jobs.length - 1; i < j; i++, j--) {
            int temp = jobs[i];
            jobs[i] = jobs[j];
            jobs[j] = temp;
        }
        
        int left = jobs[0];
        long right = 0;
        for (int j : jobs) right += j;
        
        while (left < right) {
            int mid = (int) ((left + right) / 2);
            if (canDistribute(mid, jobs, k)) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        return left;
    }
    
    private boolean canDistribute(int maxWorkload, int[] jobs, int k) {
        int[] workers = new int[k];
        return assignJob(0, maxWorkload, jobs, workers);
    }
    
    private boolean assignJob(int jobIndex, int maxWorkload, int[] jobs, int[] workers) {
        if (jobIndex == jobs.length) return true;
        for (int i = 0; i < workers.length; i++) {
            if (workers[i] + jobs[jobIndex] <= maxWorkload) {
                workers[i] += jobs[jobIndex];
                if (assignJob(jobIndex + 1, maxWorkload, jobs, workers)) return true;
                workers[i] -= jobs[jobIndex];
            }
            if (workers[i] == 0) break;
        }
        return false;
    }
}
