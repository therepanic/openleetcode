class Solution {
    public int numOfMinutes(int n, int headID, int[] manager, int[] informTime) {
        List<List<Integer>> children = new ArrayList<>(n);
        for (int i = 0; i < n; i++) {
            children.add(new ArrayList<>());
        }
        for (int employee = 0; employee < n; employee++) {
            int parent = manager[employee];
            if (parent != -1) {
                children.get(parent).add(employee);
            }
        }
        Deque<int[]> stack = new ArrayDeque<>();
        stack.push(new int[]{headID, 0});
        int answer = 0;
        while (!stack.isEmpty()) {
            int[] pair = stack.pop();
            int employee = pair[0];
            int elapsed = pair[1];
            answer = Math.max(answer, elapsed);
            for (int child : children.get(employee)) {
                stack.push(new int[]{child, elapsed + informTime[employee]});
            }
        }
        return answer;
    }
}
