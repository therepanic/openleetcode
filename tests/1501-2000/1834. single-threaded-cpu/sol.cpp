class Solution {
public:
    vector<int> getOrder(vector<vector<int>>& tasks) {
        int n = tasks.size();
        vector<vector<int>> indexed(n, vector<int>(3));
        for (int i = 0; i < n; i++) {
            indexed[i][0] = tasks[i][0];
            indexed[i][1] = tasks[i][1];
            indexed[i][2] = i;
        }
        sort(indexed.begin(), indexed.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[0] < b[0];
        });
        
        vector<int> result;
        priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> heap;
        long long time = 0;
        int idx = 0;
        
        while (idx < n || !heap.empty()) {
            if (heap.empty() && time < indexed[idx][0]) {
                time = indexed[idx][0];
            }
            
            while (idx < n && indexed[idx][0] <= time) {
                heap.push({indexed[idx][1], indexed[idx][2]});
                idx++;
            }
            
            auto [process, index] = heap.top();
            heap.pop();
            result.push_back(index);
            time += process;
        }
        
        return result;
    }
};
