
public class Solution {
    public System.Collections.Generic.IList<System.Collections.Generic.IList<int>> Generate(int numRows) {
        var result = new System.Collections.Generic.List<System.Collections.Generic.IList<int>>();
        for (int i = 0; i < numRows; i++) {
            var row = new System.Collections.Generic.List<int>();
            for (int j = 0; j <= i; j++) row.Add(1);
            for (int j = 1; j < i; j++) {
                row[j] = ((System.Collections.Generic.List<int>) result[i - 1])[j - 1] + ((System.Collections.Generic.List<int>) result[i - 1])[j];
            }
            result.Add(row);
        }
        return result;
    }
}
