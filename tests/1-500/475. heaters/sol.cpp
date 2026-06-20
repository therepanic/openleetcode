class Solution {
public:
    int findRadius(vector<int>& houses, vector<int>& heaters) {
        sort(houses.begin(), houses.end());
        sort(heaters.begin(), heaters.end());
        int radius = 0;
        for (int house : houses) {
            int left = 0, right = heaters.size() - 1;
            while (left < right) {
                int mid = (left + right) / 2;
                if (heaters[mid] < house) {
                    left = mid + 1;
                } else {
                    right = mid;
                }
            }
            int dist = abs(heaters[left] - house);
            if (left > 0) {
                dist = min(dist, abs(heaters[left - 1] - house));
            }
            radius = max(radius, dist);
        }
        return radius;
    }
};
