
class Solution {
    public java.util.List<java.util.List<Integer>> generate(int numRows) {
        java.util.List<java.util.List<Integer>> result = new java.util.ArrayList<>();
        for (int i = 0; i < numRows; i++) {
            java.util.List<Integer> row = new java.util.ArrayList<>();
            for (int j = 0; j <= i; j++) row.add(1);
            for (int j = 1; j < i; j++) {
                row.set(j, result.get(i - 1).get(j - 1) + result.get(i - 1).get(j));
            }
            result.add(row);
        }
        return result;
    }
}
