import java.util.ArrayDeque;
import java.util.ArrayList;

class Solution {
    public int minReorder(int n, int[][] connections) {
        ArrayList<ArrayList<int[]>> graph = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
        }

        for (int[] connection : connections) {
            int from = connection[0];
            int to = connection[1];
            graph.get(from).add(new int[] {to, 1});
            graph.get(to).add(new int[] {from, 0});
        }

        boolean[] seen = new boolean[n];
        ArrayDeque<Integer> stack = new ArrayDeque<>();
        stack.push(0);
        seen[0] = true;
        int changes = 0;

        while (!stack.isEmpty()) {
            int city = stack.pop();
            for (int[] edge : graph.get(city)) {
                int next = edge[0];
                if (!seen[next]) {
                    seen[next] = true;
                    changes += edge[1];
                    stack.push(next);
                }
            }
        }

        return changes;
    }
}
