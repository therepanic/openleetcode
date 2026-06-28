class Solution {
public:
    string solveEquation(string equation) {
        size_t eq_pos = equation.find('=');
        string left = equation.substr(0, eq_pos);
        string right = equation.substr(eq_pos + 1);
        
        auto [left_coeff, left_const] = parseSide(left);
        auto [right_coeff, right_const] = parseSide(right);
        
        int coeff = left_coeff - right_coeff;
        int constant = right_const - left_const;
        
        if (coeff == 0) {
            return constant != 0 ? "No solution" : "Infinite solutions";
        }
        return "x=" + to_string(constant / coeff);
    }
    
private:
    pair<int, int> parseSide(const string& side) {
        int coeff = 0;
        int constant = 0;
        string num = "";
        int sign = 1;
        string s = side + '+';
        
        for (char ch : s) {
            if (ch == '+' || ch == '-') {
                if (!num.empty()) {
                    constant += sign * stoi(num);
                    num = "";
                }
                sign = (ch == '+') ? 1 : -1;
            } else if (isdigit(ch)) {
                num += ch;
            } else if (ch == 'x') {
                coeff += sign * (num.empty() ? 1 : stoi(num));
                num = "";
            }
        }
        return {coeff, constant};
    }
};
