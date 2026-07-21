public class Solution {
    public IList<bool> CheckIfPrerequisite(int n, int[][] prerequisites, int[][] queries) {
        var reach = new bool[n, n];
        foreach (var edge in prerequisites) reach[edge[0], edge[1]] = true;
        for (int k = 0; k < n; k++)
            for (int i = 0; i < n; i++)
                if (reach[i, k])
                    for (int j = 0; j < n; j++) reach[i, j] |= reach[k, j];
        var answer = new List<bool>();
        foreach (var query in queries) answer.Add(reach[query[0], query[1]]);
        return answer;
    }
}
