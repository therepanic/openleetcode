import java.util.*;

class Solution {
    public boolean canMeasureWater(int x, int y, int target) {
        if (target > x + y) {
            return false;
        }
        Deque<int[]> stack = new ArrayDeque<>();
        Set<String> visited = new HashSet<>();
        stack.push(new int[]{0, 0});
        while (!stack.isEmpty()) {
            int[] state = stack.pop();
            int a = state[0], b = state[1];
            if (a + b == target) {
                return true;
            }
            String key = a + "," + b;
            if (visited.contains(key)) {
                continue;
            }
            visited.add(key);
            stack.push(new int[]{x, b});
            stack.push(new int[]{a, y});
            stack.push(new int[]{0, b});
            stack.push(new int[]{a, 0});
            int w = Math.min(a, y - b);
            stack.push(new int[]{a - w, b + w});
            w = Math.min(b, x - a);
            stack.push(new int[]{a + w, b - w});
        }
        return false;
    }
}
