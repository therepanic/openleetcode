class Solution {
public:
    int distanceBetweenBusStops(vector<int>& distance, int start, int destination) {
        if (destination < start) {
            swap(start, destination);
        }
        int s = 0;
        for (int i = start; i < destination; i++) {
            s += distance[i];
        }
        int total = 0;
        for (int d : distance) {
            total += d;
        }
        return min(s, total - s);
    }
};
