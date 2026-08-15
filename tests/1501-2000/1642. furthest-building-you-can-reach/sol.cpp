#include <queue>

class Solution {
public:
    int furthestBuilding(vector<int>& heights, int bricks, int ladders) {
        priority_queue<int, vector<int>, greater<int>> heap;
        int n = heights.size();
        for (int i = 1; i < n; i++) {
            int climb = heights[i] - heights[i-1];
            if (climb <= 0) continue;
            heap.push(climb);
            if (heap.size() > ladders) {
                int diff = heap.top();
                heap.pop();
                if (bricks >= diff) {
                    bricks -= diff;
                } else {
                    return i-1;
                }
            }
        }
        return n-1;
    }
};
