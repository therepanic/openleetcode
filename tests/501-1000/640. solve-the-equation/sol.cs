public class Solution {
    public string SolveEquation(string equation) {
        string[] parts = equation.Split('=');
        var (leftCoeff, leftConst) = ParseSide(parts[0]);
        var (rightCoeff, rightConst) = ParseSide(parts[1]);
        
        int coeff = leftCoeff - rightCoeff;
        int constant = rightConst - leftConst;
        
        if (coeff == 0) {
            return constant != 0 ? "No solution" : "Infinite solutions";
        }
        return "x=" + (constant / coeff).ToString();
    }
    
    private (int, int) ParseSide(string side) {
        int coeff = 0;
        int constant = 0;
        string num = "";
        int sign = 1;
        side += '+';
        
        foreach (char ch in side) {
            if (ch == '+' || ch == '-') {
                if (num.Length > 0) {
                    constant += sign * int.Parse(num);
                    num = "";
                }
                sign = ch == '+' ? 1 : -1;
            } else if (char.IsDigit(ch)) {
                num += ch;
            } else if (ch == 'x') {
                coeff += sign * (num.Length > 0 ? int.Parse(num) : 1);
                num = "";
            }
        }
        return (coeff, constant);
    }
}
