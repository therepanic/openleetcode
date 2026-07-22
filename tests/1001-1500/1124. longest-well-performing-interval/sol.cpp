class Solution {
public:
    int longestWPI(vector<int>& hours) {
        int score = 0;
        int longestInterval = 0;
        unordered_map<int, int> seenAt;
        seenAt[0] = -1;
        
        for (int i = 0; i < hours.size(); i++) {
            score += hours[i] > 8 ? 1 : -1;
            
            if (score > 0) {
                longestInterval = i + 1;
            } else if (seenAt.count(score - 1)) {
                longestInterval = max(longestInterval, i - seenAt[score - 1]);
            }
            
            if (!seenAt.count(score)) {
                seenAt[score] = i;
            }
        }
        
        return longestInterval;
    }
};
