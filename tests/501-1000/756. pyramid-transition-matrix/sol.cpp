class Solution {
public:
    bool pyramidTransition(string bottom, vector<string>& allowed) {
        unordered_map<string, unordered_set<char>> tab;
        for (const auto& a : allowed) {
            string key = string(1, a[0]) + a[1];
            tab[key].insert(a[2]);
        }
        
        unordered_set<string> visited;
        return dfs(bottom, tab, visited);
    }
    
private:
    bool dfs(const string& node, 
             unordered_map<string, unordered_set<char>>& tab,
             unordered_set<string>& visited) {
        if (node.length() == 1) return true;
        if (visited.count(node)) return false;
        
        vector<string> neighbors = getNeighbors(node, tab);
        for (const auto& nxt : neighbors) {
            if (dfs(nxt, tab, visited)) return true;
        }
        
        visited.insert(node);
        return false;
    }
    
    vector<string> getNeighbors(const string& node,
                                unordered_map<string, unordered_set<char>>& tab) {
        vector<string> res = {""};
        for (int i = 1; i < node.length(); i++) {
            string key = string(1, node[i-1]) + node[i];
            if (!tab.count(key) || tab[key].empty()) return {};
            
            vector<string> newRes;
            for (const auto& r : res) {
                for (char c : tab[key]) {
                    newRes.push_back(r + c);
                }
            }
            res = newRes;
        }
        return res;
    }
};
