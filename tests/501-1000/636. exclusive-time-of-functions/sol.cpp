class Solution {
public:
    vector<int> exclusiveTime(int n, vector<string>& logs) {
        vector<vector<int>> callstack;
        vector<int> exectime(n, 0);
        
        for (const string& log : logs) {
            stringstream ss(log);
            string token;
            vector<string> parts;
            while (getline(ss, token, ':')) {
                parts.push_back(token);
            }
            
            int idn = stoi(parts[0]);
            string status = parts[1];
            int curtime = stoi(parts[2]);
            
            if (status == "start") {
                callstack.push_back({idn, curtime});
            } else {
                vector<int> top = callstack.back();
                callstack.pop_back();
                int x = top[0];
                int y = top[1];
                int time = curtime - y + 1;
                exectime[x] += time;
                if (!callstack.empty()) {
                    x = callstack.back()[0];
                    exectime[x] -= time;
                }
            }
        }
        
        return exectime;
    }
};
