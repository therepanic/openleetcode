class Solution {
public:
    int maxScoreWords(vector<string>& words, vector<char>& letters, vector<int>& score) {
        vector<int> freq(26, 0);
        for (char c : letters) {
            freq[c - 'a']++;
        }
        
        int ans = 0;
        
        function<void(int, vector<int>, int)> comb = [&](int i, vector<int> freq, int total) {
            if (i == words.size()) {
                ans = max(ans, total);
                return;
            }
            
            vector<int> same = freq;
            int rem = total;
            vector<int> tempFreq = freq;
            bool full = true;
            int newTotal = total;
            
            for (char ch : words[i]) {
                int idx = ch - 'a';
                if (tempFreq[idx] == 0) {
                    full = false;
                    break;
                }
                tempFreq[idx]--;
                newTotal += score[idx];
            }
            
            if (full) {
                comb(i + 1, tempFreq, newTotal);
                comb(i + 1, same, rem);
            } else {
                comb(i + 1, same, rem);
            }
        };
        
        comb(0, freq, 0);
        return ans;
    }
};
