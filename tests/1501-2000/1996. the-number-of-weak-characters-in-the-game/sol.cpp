class Solution {
public:
    int numberOfWeakCharacters(vector<vector<int>>& properties) {
        sort(properties.begin(), properties.end(), [](const vector<int>& a, const vector<int>& b) {
            if (a[0] != b[0]) return a[0] > b[0];
            return a[1] < b[1];
        });
        
        int maxDefense = 0;
        int weakCount = 0;
        
        for (const auto& prop : properties) {
            if (prop[1] < maxDefense) {
                weakCount++;
            } else {
                maxDefense = prop[1];
            }
        }
        
        return weakCount;
    }
};
