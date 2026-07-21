public class Solution {
    public int NumOfMinutes(int n, int headID, int[] manager, int[] informTime) {
        var children = new List<int>[n];
        for (int i = 0; i < n; i++) {
            children[i] = new List<int>();
        }
        for (int employee = 0; employee < n; employee++) {
            int parent = manager[employee];
            if (parent != -1) {
                children[parent].Add(employee);
            }
        }
        var stack = new Stack<(int employee, int elapsed)>();
        stack.Push((headID, 0));
        int answer = 0;
        while (stack.Count > 0) {
            var (employee, elapsed) = stack.Pop();
            answer = Math.Max(answer, elapsed);
            foreach (int child in children[employee]) {
                stack.Push((child, elapsed + informTime[employee]));
            }
        }
        return answer;
    }
}
