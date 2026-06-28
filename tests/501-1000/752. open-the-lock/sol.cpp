class Solution {
public:
    int openLock(vector<string>& deadends, string target) {
        if (target == "0000") return 0;
        unordered_set<string> dead(deadends.begin(), deadends.end());
        if (dead.count("0000")) return -1;
        
        int moves = 0;
        queue<string> q;
        unordered_set<string> visited;
        q.push("0000");
        visited.insert("0000");
        
        while (!q.empty()) {
            int size = q.size();
            for (int k = 0; k < size; k++) {
                string cur = q.front(); q.pop();
                if (cur == target) return moves;
                
                for (int i = 0; i < 4; i++) {
                    int val = cur[i] - '0';
                    int up = (val + 1) % 10;
                    int down = (val - 1 + 10) % 10;
                    
                    string nxt1 = cur;
                    nxt1[i] = up + '0';
                    string nxt2 = cur;
                    nxt2[i] = down + '0';
                    
                    if (!dead.count(nxt1) && !visited.count(nxt1)) {
                        visited.insert(nxt1);
                        q.push(nxt1);
                    }
                    if (!dead.count(nxt2) && !visited.count(nxt2)) {
                        visited.insert(nxt2);
                        q.push(nxt2);
                    }
                }
            }
            moves++;
        }
        return -1;
    }
};
