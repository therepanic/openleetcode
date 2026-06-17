class Solution {
public:
    vector<int> diffWaysToCompute(string expression) {
        if (all_of(expression.begin(), expression.end(), ::isdigit)) {
            return {stoi(expression)};
        }
        
        vector<int> results;
        
        for (int i = 0; i < expression.length(); i++) {
            char c = expression[i];
            if (c == '+' || c == '-' || c == '*') {
                vector<int> leftResults = diffWaysToCompute(expression.substr(0, i));
                vector<int> rightResults = diffWaysToCompute(expression.substr(i + 1));
                
                for (int left : leftResults) {
                    for (int right : rightResults) {
                        if (c == '+') {
                            results.push_back(left + right);
                        } else if (c == '-') {
                            results.push_back(left - right);
                        } else if (c == '*') {
                            results.push_back(left * right);
                        }
                    }
                }
            }
        }
        
        return results;
    }
};
