public class Solution {
    public IList<int> DiffWaysToCompute(string expression) {
        if (expression.All(char.IsDigit)) {
            return new List<int> { int.Parse(expression) };
        }
        
        List<int> results = new List<int>();
        
        for (int i = 0; i < expression.Length; i++) {
            char c = expression[i];
            if (c == '+' || c == '-' || c == '*') {
                IList<int> leftResults = DiffWaysToCompute(expression.Substring(0, i));
                IList<int> rightResults = DiffWaysToCompute(expression.Substring(i + 1));
                
                foreach (int left in leftResults) {
                    foreach (int right in rightResults) {
                        if (c == '+') {
                            results.Add(left + right);
                        } else if (c == '-') {
                            results.Add(left - right);
                        } else if (c == '*') {
                            results.Add(left * right);
                        }
                    }
                }
            }
        }
        
        return results;
    }
}
