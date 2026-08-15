#include <queue>
#include <vector>

class Solution {
public:
    double maxAverageRatio(vector<vector<int>>& classes, int extraStudents) {
        auto cmp = [](const array<double,3>& a, const array<double,3>& b) {
            return a[0] < b[0];
        };
        priority_queue<array<double,3>, vector<array<double,3>>, decltype(cmp)> pq(cmp);
        for (auto& c : classes) {
            double p = c[0], t = c[1];
            double gain = (p+1)/(t+1) - p/t;
            pq.push({gain, p, t});
        }
        while (extraStudents--) {
            auto top = pq.top(); pq.pop();
            double p = top[1]+1, t = top[2]+1;
            double gain = (p+1)/(t+1) - p/t;
            pq.push({gain, p, t});
        }
        double sum = 0.0;
        while (!pq.empty()) {
            auto item = pq.top(); pq.pop();
            sum += item[1]/item[2];
        }
        return sum / classes.size();
    }
};
