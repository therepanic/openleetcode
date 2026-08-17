class Solution {
public:
    int scoreOfStudents(string s, vector<int>& answers) {
        unordered_map<string, unordered_set<int>> memo;
        
        function<unordered_set<int>(int,int)> dp = [&](int lo, int hi) -> unordered_set<int> {
            string key = to_string(lo) + "," + to_string(hi);
            if (memo.count(key)) return memo[key];
            if (lo + 1 == hi) {
                unordered_set<int> tmp = {s[lo] - '0'};
                memo[key] = tmp;
                return tmp;
            }
            unordered_set<int> result;
            for (int mid = lo + 1; mid < hi; mid += 2) {
                auto left = dp(lo, mid);
                auto right = dp(mid + 1, hi);
                for (int x : left) {
                    for (int y : right) {
                        if (s[mid] == '+' && x + y <= 1000) {
                            result.insert(x + y);
                        } else if (s[mid] == '*' && x * y <= 1000) {
                            result.insert(x * y);
                        }
                    }
                }
            }
            memo[key] = result;
            return result;
        };
        
        // evaluate target with precedence
        vector<int> nums;
        vector<char> ops;
        for (char c : s) {
            if (isdigit(c)) {
                nums.push_back(c - '0');
            } else if (c == '+' || c == '*') {
                while (!ops.empty() && precedence(ops.back()) >= precedence(c)) {
                    apply(nums, ops);
                }
                ops.push_back(c);
            }
        }
        while (!ops.empty()) apply(nums, ops);
        int target = nums.back();
        
        auto cand = dp(0, s.size());
        int score = 0;
        for (int x : answers) {
            if (x == target) score += 5;
            else if (cand.count(x)) score += 2;
        }
        return score;
    }
    
private:
    int precedence(char c) {
        return c == '*' ? 2 : 1;
    }
    
    void apply(vector<int>& nums, vector<char>& ops) {
        int b = nums.back(); nums.pop_back();
        int a = nums.back(); nums.pop_back();
        char op = ops.back(); ops.pop_back();
        nums.push_back(op == '+' ? a + b : a * b);
    }
};
