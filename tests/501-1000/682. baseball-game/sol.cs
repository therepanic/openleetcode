public class Solution {
    public int CalPoints(string[] operations) {
        var stack = new List<int>();
        foreach (string op in operations) {
            if (op == "C") {
                stack.RemoveAt(stack.Count - 1);
            } else if (op == "D") {
                stack.Add(stack[stack.Count - 1] * 2);
            } else if (op == "+") {
                stack.Add(stack[stack.Count - 1] + stack[stack.Count - 2]);
            } else {
                stack.Add(int.Parse(op));
            }
        }
        int sum = 0;
        foreach (int v in stack) sum += v;
        return sum;
    }
}
