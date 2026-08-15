class Solution {
public:
    int boxDelivering(vector<vector<int>>& boxes, int portsCount, int maxBoxes, int maxWeight) {
        int n = boxes.size();
        vector<int> ports(n+1);
        vector<int> weights(n+1);
        for (int i = 0; i < n; i++) {
            ports[i+1] = boxes[i][0];
            weights[i+1] = boxes[i][1];
        }
        vector<int> prefixWeights(n+1);
        for (int i = 1; i <= n; i++) {
            prefixWeights[i] = prefixWeights[i-1] + weights[i];
        }
        vector<int> portsCnt(n+2);
        for (int i = 2; i <= n; i++) {
            portsCnt[i] = portsCnt[i-1] + (ports[i] != ports[i-1] ? 1 : 0);
        }
        portsCnt[n+1] = portsCnt[n];
        vector<int> dp(n+1);
        deque<int> queue;
        queue.push_back(0);
        int left = 0;
        for (int i = 1; i <= n; i++) {
            while (i - left > maxBoxes || prefixWeights[i] - prefixWeights[left] > maxWeight) {
                if (!queue.empty() && queue.front() == left) {
                    queue.pop_front();
                }
                left++;
            }
            dp[i] = 2 + portsCnt[i] + (dp[queue.front()] - portsCnt[queue.front()+1]);
            int idx = dp[i] - portsCnt[i+1];
            while (!queue.empty() && (dp[queue.back()] - portsCnt[queue.back()+1]) >= idx) {
                queue.pop_back();
            }
            queue.push_back(i);
        }
        return dp[n];
    }
};
