class Solution {
public:
    double mincostToHireWorkers(vector<int>& quality, vector<int>& wage, int k) {
        int n = quality.size();
        vector<pair<double, int>> workers;
        for (int i = 0; i < n; ++i) {
            workers.emplace_back((double)wage[i] / quality[i], quality[i]);
        }
        sort(workers.begin(), workers.end());
        
        double min_cost = DBL_MAX;
        long long current_quality_sum = 0;
        priority_queue<int> max_heap;
        
        for (auto& [ratio, q] : workers) {
            current_quality_sum += q;
            max_heap.push(q);
            
            if (max_heap.size() > k) {
                current_quality_sum -= max_heap.top();
                max_heap.pop();
            }
            
            if (max_heap.size() == k) {
                min_cost = min(min_cost, ratio * current_quality_sum);
            }
        }
        
        return min_cost;
    }
};
