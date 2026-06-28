class Solution {
    private static final double EPS = 1e-6;

    public boolean judgePoint24(int[] cards) {
        List<Double> nums = new ArrayList<>();
        for (int card : cards) {
            nums.add((double) card);
        }
        return dfs(nums);
    }

    private boolean dfs(List<Double> nums) {
        if (nums.size() == 1) {
            return Math.abs(nums.get(0) - 24.0) < EPS;
        }

        for (int i = 0; i < nums.size(); i++) {
            for (int j = 0; j < nums.size(); j++) {
                if (i == j) continue;

                List<Double> nextNums = new ArrayList<>();
                for (int k = 0; k < nums.size(); k++) {
                    if (k != i && k != j) {
                        nextNums.add(nums.get(k));
                    }
                }

                double a = nums.get(i), b = nums.get(j);
                List<Double> candidates = new ArrayList<>();
                candidates.add(a + b);
                candidates.add(a - b);
                candidates.add(b - a);
                candidates.add(a * b);
                if (Math.abs(b) > EPS) candidates.add(a / b);
                if (Math.abs(a) > EPS) candidates.add(b / a);

                for (double val : candidates) {
                    nextNums.add(val);
                    if (dfs(nextNums)) return true;
                    nextNums.remove(nextNums.size() - 1);
                }
            }
        }
        return false;
    }
}
