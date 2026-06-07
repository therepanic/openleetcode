class Solution {
public:
  vector<vector<int>> combine(int n, int k) {
    vector<vector<int>> res;
    vector<int> cur;
    function<void(int)> dfs = [&](int start) {
      if ((int)cur.size() == k) {
        res.push_back(cur);
        return;
      }
      for (int i = start; i <= n; ++i) {
        cur.push_back(i);
        dfs(i + 1);
        cur.pop_back();
      }
    };
    dfs(1);
    return res;
  }
};
