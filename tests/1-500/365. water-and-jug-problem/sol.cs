using System.Collections.Generic;

public class Solution {
    public bool CanMeasureWater(int x, int y, int target) {
        if (target > x + y) {
            return false;
        }
        Stack<(int, int)> stack = new Stack<(int, int)>();
        HashSet<string> visited = new HashSet<string>();
        stack.Push((0, 0));
        while (stack.Count > 0) {
            var (a, b) = stack.Pop();
            if (a + b == target) {
                return true;
            }
            string key = $"{a},{b}";
            if (visited.Contains(key)) {
                continue;
            }
            visited.Add(key);
            stack.Push((x, b));
            stack.Push((a, y));
            stack.Push((0, b));
            stack.Push((a, 0));
            int w = System.Math.Min(a, y - b);
            stack.Push((a - w, b + w));
            w = System.Math.Min(b, x - a);
            stack.Push((a + w, b - w));
        }
        return false;
    }
}
