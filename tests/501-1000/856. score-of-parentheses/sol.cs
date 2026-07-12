public class Solution {
    public int ScoreOfParentheses(string s) {
        var scoreStack = new List<int> { 0 };
        
        foreach (char parentheses in s) {
            if (parentheses == '(') {
                scoreStack.Add(0);
            } else if (scoreStack.Count > 0) {
                int lastScore = scoreStack[scoreStack.Count - 1];
                scoreStack.RemoveAt(scoreStack.Count - 1);
                scoreStack[scoreStack.Count - 1] += Math.Max(1, lastScore * 2);
            }
        }
        
        return scoreStack[scoreStack.Count - 1];
    }
}
