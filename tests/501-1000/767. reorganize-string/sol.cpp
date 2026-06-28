class Solution {
public:
    string reorganizeString(string s) {
        unordered_map<char, int> charFreq;
        for (char c : s) {
            charFreq[c]++;
        }
        
        priority_queue<pair<int, char>> maxHeap;
        for (auto& [ch, freq] : charFreq) {
            maxHeap.push({freq, ch});
        }
        
        string res = "";
        int prevFreq = 0;
        char prevChar = ' ';
        
        while (!maxHeap.empty()) {
            auto [freq, ch] = maxHeap.top();
            maxHeap.pop();
            
            res += ch;
            
            if (prevFreq > 0) {
                maxHeap.push({prevFreq, prevChar});
            }
            
            prevFreq = freq - 1;
            prevChar = ch;
        }
        
        if (res.length() != s.length()) {
            return "";
        }
        
        return res;
    }
};
