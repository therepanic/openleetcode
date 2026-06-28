class Solution {
public:
    string predictPartyVictory(string senate) {
        std::deque<int> r;
        std::deque<int> d;
        int n = senate.length();
        
        for (int i = 0; i < n; i++) {
            if (senate[i] == 'R') {
                r.push_back(i);
            } else {
                d.push_back(i);
            }
        }
        
        while (!r.empty() && !d.empty()) {
            int rIdx = r.front(); r.pop_front();
            int dIdx = d.front(); d.pop_front();
            
            if (rIdx < dIdx) {
                r.push_back(rIdx + n);
            } else {
                d.push_back(dIdx + n);
            }
        }
        
        return r.empty() ? "Dire" : "Radiant";
    }
};
