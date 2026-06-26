class Solution {
    public int[][] outerTrees(int[][] trees) {
        if (trees.length == 1) {
            return trees;
        }

        java.util.Arrays.sort(trees, (a, b) -> a[0] == b[0] ? a[1] - b[1] : a[0] - b[0]);

        java.util.List<int[]> lower = new java.util.ArrayList<>();
        for (int[] p : trees) {
            while (lower.size() >= 2 && cross(lower.get(lower.size() - 2), lower.get(lower.size() - 1), p) < 0) {
                lower.remove(lower.size() - 1);
            }
            lower.add(p);
        }

        java.util.List<int[]> upper = new java.util.ArrayList<>();
        for (int i = trees.length - 1; i >= 0; i--) {
            int[] p = trees[i];
            while (upper.size() >= 2 && cross(upper.get(upper.size() - 2), upper.get(upper.size() - 1), p) < 0) {
                upper.remove(upper.size() - 1);
            }
            upper.add(p);
        }

        lower.remove(lower.size() - 1);
        upper.remove(upper.size() - 1);
        lower.addAll(upper);

        java.util.Set<String> seen = new java.util.HashSet<>();
        java.util.List<int[]> result = new java.util.ArrayList<>();
        for (int[] p : lower) {
            String key = p[0] + "," + p[1];
            if (!seen.contains(key)) {
                seen.add(key);
                result.add(p);
            }
        }

        return result.toArray(new int[result.size()][]);
    }

    private int cross(int[] o, int[] a, int[] b) {
        return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0]);
    }
}
