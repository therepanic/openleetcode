
public class Solution {
    public System.Collections.Generic.IList<int> GetRow(int rowIndex) {
        var row = new System.Collections.Generic.List<int> {1};
        for (int i = 0; i < rowIndex; i++) {
            var next = new System.Collections.Generic.List<int> {1};
            for (int j = 1; j < row.Count; j++) {
                next.Add(row[j - 1] + row[j]);
            }
            next.Add(1);
            row = next;
        }
        return row;
    }
}
