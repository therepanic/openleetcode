class Solution {
    public String crackSafe(int n, int k) {
        if (n == 1) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < k; i++) {
                sb.append(i);
            }
            return sb.toString();
        }

        java.util.Map<String, java.util.ArrayDeque<Integer>> adj = new java.util.HashMap<>();
        String startNode = "0".repeat(n - 1);
        java.util.ArrayDeque<String> path = new java.util.ArrayDeque<>();
        java.util.ArrayDeque<Integer> edgePath = new java.util.ArrayDeque<>();
        StringBuilder res = new StringBuilder();

        path.addLast(startNode);
        while (!path.isEmpty()) {
            String node = path.peekLast();
            if (!adj.containsKey(node)) {
                adj.put(node, new java.util.ArrayDeque<>());
                for (int i = k - 1; i >= 0; i--) {
                    adj.get(node).addLast(i);
                }
            }
            if (!adj.get(node).isEmpty()) {
                int digit = adj.get(node).removeLast();
                path.addLast((node + digit).substring(1));
                edgePath.addLast(digit);
            } else {
                path.removeLast();
                if (!edgePath.isEmpty()) {
                    res.append(edgePath.removeLast());
                }
            }
        }

        return res.toString() + startNode;
    }
}
