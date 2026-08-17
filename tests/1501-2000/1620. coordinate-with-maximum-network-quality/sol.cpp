class Solution {
public:
    vector<int> bestCoordinate(vector<vector<int>>& towers, int radius) {
        int max_x = 0;
        int max_y = 0;
        for (const auto& t : towers) {
            max_x = max(max_x, t[0]);
            max_y = max(max_y, t[1]);
        }
        
        int best_quality = 0;
        vector<int> best_coord = {0, 0};
        
        for (int x = 0; x <= max_x; x++) {
            for (int y = 0; y <= max_y; y++) {
                int quality = 0;
                for (const auto& t : towers) {
                    double dist = sqrt(pow(t[0] - x, 2) + pow(t[1] - y, 2));
                    if (dist <= radius) {
                        quality += (int)(t[2] / (1 + dist));
                    }
                }
                if (quality > best_quality || (quality == best_quality && (x < best_coord[0] || (x == best_coord[0] && y < best_coord[1])))) {
                    best_quality = quality;
                    best_coord[0] = x;
                    best_coord[1] = y;
                }
            }
        }
        
        return best_coord;
    }
};
