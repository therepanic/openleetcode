class Solution {
public:
    bool isRectangleCover(vector<vector<int>>& rectangles) {
        long long area = 0;
        unordered_set<string> corners;
        
        for (auto& rect : rectangles) {
            int x = rect[0], y = rect[1], X = rect[2], Y = rect[3];
            area += (long long)(X - x) * (Y - y);
            
            string p1 = to_string(x) + "," + to_string(y);
            string p2 = to_string(x) + "," + to_string(Y);
            string p3 = to_string(X) + "," + to_string(y);
            string p4 = to_string(X) + "," + to_string(Y);
            
            if (!corners.insert(p1).second) corners.erase(p1);
            if (!corners.insert(p2).second) corners.erase(p2);
            if (!corners.insert(p3).second) corners.erase(p3);
            if (!corners.insert(p4).second) corners.erase(p4);
        }
        
        if (corners.size() != 4) return false;
        
        int minX = INT_MAX, minY = INT_MAX;
        int maxX = INT_MIN, maxY = INT_MIN;
        
        for (auto& point : corners) {
            int comma = point.find(',');
            int x = stoi(point.substr(0, comma));
            int y = stoi(point.substr(comma + 1));
            minX = min(minX, x);
            minY = min(minY, y);
            maxX = max(maxX, x);
            maxY = max(maxY, y);
        }
        
        return (long long)(maxX - minX) * (maxY - minY) == area;
    }
};
