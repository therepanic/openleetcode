class Solution {
public:
    vector<int> busiestServers(int k, vector<int>& arrival, vector<int>& load) {
        priority_queue<int, vector<int>, greater<int>> available;
        for (int i = 0; i < k; i++) available.push(i);
        priority_queue<pair<int,int>, vector<pair<int,int>>, greater<pair<int,int>>> busy;
        vector<int> res(k, 0);
        for (int i = 0; i < (int)arrival.size(); i++) {
            int a = arrival[i];
            while (!busy.empty() && busy.top().first <= a) {
                int x = busy.top().second;
                busy.pop();
                available.push(i + ((x - i) % k + k) % k);
            }
            if (!available.empty()) {
                int j = available.top() % k;
                available.pop();
                busy.push({a + load[i], j});
                res[j]++;
            }
        }
        int mx = *max_element(res.begin(), res.end());
        vector<int> ans;
        for (int i = 0; i < k; i++) if (res[i] == mx) ans.push_back(i);
        return ans;
    }
};
