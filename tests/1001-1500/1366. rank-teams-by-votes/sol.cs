public class Solution {
    public string RankTeams(string[] votes) {
        string teams = votes[0];
        int n = teams.Length;
        Dictionary<char, int[]> positions = new Dictionary<char, int[]>();
        foreach (char team in teams) {
            positions[team] = new int[n];
        }
        foreach (string vote in votes) {
            for (int i = 0; i < n; i++) {
                positions[vote[i]][i]++;
            }
        }
        char[] sortedTeams = teams.ToCharArray();
        Array.Sort(sortedTeams, (a, b) => {
            int[] countsA = positions[a];
            int[] countsB = positions[b];
            for (int i = 0; i < n; i++) {
                if (countsA[i] != countsB[i]) {
                    return countsB[i] - countsA[i];
                }
            }
            return a - b;
        });
        return new string(sortedTeams);
    }
}
