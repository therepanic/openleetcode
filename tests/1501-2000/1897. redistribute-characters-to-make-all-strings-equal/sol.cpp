class Solution {
public:
    bool makeEqual(vector<string>& words) {
        vector<int> freq(26, 0);
        int n = words.size();
        for (const string& word : words) {
            for (char ch : word) {
                freq[ch - 'a']++;
            }
        }
        for (int count : freq) {
            if (count % n != 0) {
                return false;
            }
        }
        return true;
    }
};
