class Solution {
public:
    vector<int> diStringMatch(string s) {
        int low = 0, high = s.size();
        vector<int> result(s.size() + 1);
        for (int i = 0; i < s.size(); i++) {
            if (s[i] == 'I') {
                result[i] = low++;
            } else {
                result[i] = high--;
            }
        }
        result[s.size()] = low;
        return result;
    }
};
