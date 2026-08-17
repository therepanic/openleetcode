#include <queue>
using namespace std;

class Solution {
public:
    int eatenApples(vector<int>& apples, vector<int>& days) {
        priority_queue<pair<int,int>, vector<pair<int,int>>, greater<pair<int,int>>> pq;
        int n = apples.size();
        int res = 0;
        int day = 0;
        while (!pq.empty() || day < n) {
            if (day < n && apples[day] > 0) {
                pq.push({day + days[day], apples[day]});
            }
            while (!pq.empty() && pq.top().first <= day) {
                pq.pop();
            }
            if (!pq.empty()) {
                auto [expire, count] = pq.top();
                pq.pop();
                res++;
                count--;
                if (count > 0) {
                    pq.push({expire, count});
                }
            }
            day++;
        }
        return res;
    }
};
