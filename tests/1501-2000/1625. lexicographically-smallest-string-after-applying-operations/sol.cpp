class Solution {
public:
    string findLexSmallestString(string s, int a, int b) {
        int n = s.size();
        unordered_set<string> seen;
        function<void(string)> dfs = [&](string cur){
            if(seen.count(cur)) return;
            seen.insert(cur);
            string add = cur;
            for(int i=1;i<n;i+=2){
                add[i] = '0' + (add[i]-'0'+a)%10;
            }
            dfs(add);
            dfs(cur.substr(n-b)+cur.substr(0,n-b));
        };
        dfs(s);
        return *min_element(seen.begin(), seen.end());
    }
};
