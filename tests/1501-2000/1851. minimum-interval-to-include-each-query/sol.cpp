#include <vector>
#include <queue>
#include <algorithm>
#include <unordered_map>

class Solution {
public:
    vector<int> minInterval(vector<vector<int>>& intervals, vector<int>& queries) {
        sort(intervals.begin(), intervals.end());
        priority_queue<pair<int,int>, vector<pair<int,int>>, greater<pair<int,int>>> minHeap;
        unordered_map<int,int> res;
        int i = 0;
        vector<int> sortedQueries = queries;
        sort(sortedQueries.begin(), sortedQueries.end());
        for (int q : sortedQueries) {
            while (i < intervals.size() && intervals[i][0] <= q) {
                int l = intervals[i][0];
                int r = intervals[i][1];
                minHeap.push({r - l + 1, r});
                i++;
            }
            while (!minHeap.empty() && minHeap.top().second < q) {
                minHeap.pop();
            }
            res[q] = minHeap.empty() ? -1 : minHeap.top().first;
        }
        vector<int> ans(queries.size());
        for (int j = 0; j < queries.size(); j++) {
            ans[j] = res[queries[j]];
        }
        return ans;
    }
};
