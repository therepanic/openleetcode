class Solution {
public:
    int longestWPI(vector<int>& hours) {
        int score = 0;
        int longest_interval = 0;
        unordered_map<int, int> seen_at;
        seen_at[0] = -1;
        
        for (int i = 0; i < hours.size(); i++) {
            score += hours[i] > 8 ? 1 : -1;
            
            if (score > 0) {
                longest_interval = i + 1;
            } else if (seen_at.count(score - 1)) {
                longest_interval = max(longest_interval, i - seen_at[score - 1]);
            }
            
            if (!seen_at.count(score)) {
                seen_at[score] = i;
            }
        }
        
        return longest_interval;
    }
};
