class Solution {
public:
    int maxDistance(vector<int>& position, int m) {
        sort(position.begin(), position.end());
        int right = position[position.size() - 1] - position[0];
        int left = 1;
        
        while (left <= right) {
            int mid = (left + right) / 2;
            int my_balls = 1;
            int previous = position[0];
            
            for (int i = 1; i < position.size(); i++) {
                if (position[i] - previous >= mid) {
                    my_balls++;
                    previous = position[i];
                }
            }
            
            if (my_balls >= m) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        
        return right;
    }
};
