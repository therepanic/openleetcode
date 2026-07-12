class Solution {
public:
    bool carPooling(vector<vector<int>>& trips, int capacity) {
        sort(trips.begin(), trips.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[1] < b[1];
        });
        priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> heap;
        int currentPassengers = 0;
        for (const auto& trip : trips) {
            int num = trip[0], src = trip[1], dest = trip[2];
            while (!heap.empty() && heap.top().first <= src) {
                currentPassengers -= heap.top().second;
                heap.pop();
            }
            if (currentPassengers + num > capacity) {
                return false;
            }
            currentPassengers += num;
            heap.push({dest, num});
        }
        return true;
    }
};
