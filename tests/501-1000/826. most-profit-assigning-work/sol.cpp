class Solution {
public:
    int maxProfitAssignment(vector<int>& difficulty, vector<int>& profit, vector<int>& worker) {
        int n = difficulty.size();
        vector<pair<int, int>> jobs;
        for (int i = 0; i < n; i++) {
            jobs.emplace_back(difficulty[i], profit[i]);
        }
        sort(jobs.begin(), jobs.end());
        sort(worker.begin(), worker.end());
        int ans = 0, best = 0, i = 0;
        for (int ability : worker) {
            while (i < n && jobs[i].first <= ability) {
                best = max(best, jobs[i].second);
                i++;
            }
            ans += best;
        }
        return ans;
    }
};
