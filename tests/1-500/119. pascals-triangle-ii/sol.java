
class Solution {
    public java.util.List<Integer> getRow(int rowIndex) {
        java.util.List<Integer> row = new java.util.ArrayList<>();
        row.add(1);
        for (int i = 0; i < rowIndex; i++) {
            java.util.ArrayList<Integer> next = new java.util.ArrayList<>();
            next.add(1);
            for (int j = 1; j < row.size(); j++) {
                next.add(row.get(j - 1) + row.get(j));
            }
            next.add(1);
            row = next;
        }
        return row;
    }
}
