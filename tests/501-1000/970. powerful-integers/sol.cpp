class Solution {
public:
    vector<int> powerfulIntegers(int x, int y, int bound) {
        unordered_set<int> result;
        int i = 1;

        while (i <= bound) {
            int j = 1;
            while (i + j <= bound) {
                result.insert(i + j);
                if (y == 1) break;
                j *= y;
            }
            if (x == 1) break;
            i *= x;
        }
        
        return vector<int>(result.begin(), result.end());
    }
};
