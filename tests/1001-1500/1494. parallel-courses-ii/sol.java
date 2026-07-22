class Solution {
    private int n;
    private int k;
    private List<List<Integer>> graph;
    private Map<String, Integer> memo;

    public int minNumberOfSemesters(int n, int[][] relations, int k) {
        this.n = n;
        this.k = k;
        this.graph = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
        }
        int[] inDegrees = new int[n];
        for (int[] rel : relations) {
            int prev = rel[0] - 1;
            int next = rel[1] - 1;
            inDegrees[next]++;
            graph.get(prev).add(next);
        }
        memo = new HashMap<>();
        return recurse((1 << n) - 1, inDegrees);
    }
    
    private int recurse(int mask, int[] inDegrees) {
        if (mask == 0) return 0;
        String key = mask + Arrays.toString(inDegrees);
        if (memo.containsKey(key)) return memo.get(key);
        
        List<Integer> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            if ((mask & (1 << i)) != 0 && inDegrees[i] == 0) {
                nodes.add(i);
            }
        }
        int ans = Integer.MAX_VALUE;
        int combLimit = Math.min(k, nodes.size());
        List<List<Integer>> combinations = getCombinations(nodes, combLimit);
        for (List<Integer> kNodes : combinations) {
            int newMask = mask;
            int[] newInDeg = inDegrees.clone();
            for (int node : kNodes) {
                newMask ^= (1 << node);
                for (int child : graph.get(node)) {
                    newInDeg[child]--;
                }
            }
            ans = Math.min(ans, 1 + recurse(newMask, newInDeg));
        }
        memo.put(key, ans);
        return ans;
    }
    
    private void getCombinationsHelper(List<Integer> nodes, int start, int k, List<Integer> current, List<List<Integer>> result) {
        if (k == 0) {
            result.add(new ArrayList<>(current));
            return;
        }
        for (int i = start; i < nodes.size(); i++) {
            current.add(nodes.get(i));
            getCombinationsHelper(nodes, i + 1, k - 1, current, result);
            current.remove(current.size() - 1);
        }
    }
    
    private List<List<Integer>> getCombinations(List<Integer> nodes, int k) {
        List<List<Integer>> result = new ArrayList<>();
        getCombinationsHelper(nodes, 0, k, new ArrayList<>(), result);
        return result;
    }
}
