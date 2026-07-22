class Solution {
public:
    int maxFreq(string s, int maxLetters, int minSize, int maxSize) {
        unordered_map<string, int> count;
        unordered_map<char, int> unique;
        int left = 0;
        int res = 0;
        for (int right = 0; right < s.size(); right++) {
            unique[s[right]]++;

            while (unique.size() > maxLetters || right - left + 1 > minSize) {
                unique[s[left]]--;
                if (unique[s[left]] == 0) {
                    unique.erase(s[left]);
                }
                left++;
            }

            if (right - left + 1 == minSize && unique.size() <= maxLetters) {
                string curr = s.substr(left, right - left + 1);
                int val = ++count[curr];
                res = max(res, val);
            }
        }
        return res;
    }
};
