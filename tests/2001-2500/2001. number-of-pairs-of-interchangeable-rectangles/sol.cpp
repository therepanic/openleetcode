class Solution {
public:
    long long interchangeableRectangles(vector<vector<int>>& rectangles) {
        auto gcd = [](int a, int b) {
            while (b != 0) {
                int temp = a % b;
                a = b;
                b = temp;
            }
            return a;
        };
        
        unordered_map<pair<int, int>, long long, hash_pair> ratioCount;
        long long result = 0;
        
        for (const auto& rect : rectangles) {
            int width = rect[0], height = rect[1];
            int g = gcd(width, height);
            auto reduced = make_pair(width / g, height / g);
            result += ratioCount[reduced];
            ratioCount[reduced]++;
        }
        
        return result;
    }
    
private:
    struct hash_pair {
        size_t operator()(const pair<int, int>& p) const {
            return ((size_t)p.first << 32) ^ p.second;
        }
    };
};
