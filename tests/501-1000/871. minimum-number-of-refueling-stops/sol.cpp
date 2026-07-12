class Solution {
public:
    int minRefuelStops(int target, int startFuel, vector<vector<int>>& stations) {
        priority_queue<int> heap;
        int fuel = startFuel;
        int count = 0;
        stations.push_back({target, 0});
        int i = 0;
        while (i < stations.size()) {
            if (fuel >= target) return count;
            while (i < stations.size() && stations[i][0] <= fuel) {
                heap.push(stations[i][1]);
                i++;
            }
            if (heap.empty()) return -1;
            fuel += heap.top();
            heap.pop();
            count++;
        }
        return -1;
    }
};
