#include <queue>
#include <vector>
#include <tuple>
#include <algorithm>

class Solution {
public:
    vector<int> assignTasks(vector<int>& servers, vector<int>& tasks) {
        int n = servers.size();
        int m = tasks.size();
        
        priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> available;
        for (int i = 0; i < n; i++) {
            available.push({servers[i], i});
        }
        
        priority_queue<tuple<int, int, int>, vector<tuple<int, int, int>>, greater<tuple<int, int, int>>> busy;
        vector<int> ans;
        int time = 0;
        
        for (int i = 0; i < m; i++) {
            time = max(time, i);
            while (!busy.empty() && get<0>(busy.top()) <= time) {
                auto [free_time, weight, idx] = busy.top();
                busy.pop();
                available.push({weight, idx});
            }
            
            if (available.empty()) {
                time = get<0>(busy.top());
                while (!busy.empty() && get<0>(busy.top()) <= time) {
                    auto [free_time, weight, idx] = busy.top();
                    busy.pop();
                    available.push({weight, idx});
                }
            }
            
            auto [weight, idx] = available.top();
            available.pop();
            busy.push({time + tasks[i], weight, idx});
            ans.push_back(idx);
        }
        
        return ans;
    }
};
