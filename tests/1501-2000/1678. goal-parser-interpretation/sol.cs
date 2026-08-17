public class Solution {
    public string Interpret(string command) {
        var result = new StringBuilder();
        int i = 0;
        while (i < command.Length) {
            if (command[i] == 'G') {
                result.Append("G");
                i++;
            } else if (i + 1 < command.Length && command[i] == '(' && command[i+1] == ')') {
                result.Append("o");
                i += 2;
            } else {
                result.Append("al");
                i += 4;
            }
        }
        return result.ToString();
    }
}
