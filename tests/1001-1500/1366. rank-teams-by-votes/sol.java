class Solution {
    public String rankTeams(String[] votes) {
        String teams = votes[0];
        int n = teams.length();
        Map<Character, int[]> positions = new HashMap<>();
        for (char team : teams.toCharArray()) {
            positions.put(team, new int[n]);
        }
        for (String vote : votes) {
            for (int i = 0; i < n; i++) {
                char team = vote.charAt(i);
                positions.get(team)[i]++;
            }
        }
        Character[] sortedTeams = new Character[n];
        for (int i = 0; i < n; i++) {
            sortedTeams[i] = teams.charAt(i);
        }
        Arrays.sort(sortedTeams, (a, b) -> {
            int[] countsA = positions.get(a);
            int[] countsB = positions.get(b);
            for (int i = 0; i < n; i++) {
                if (countsA[i] != countsB[i]) {
                    return countsB[i] - countsA[i];
                }
            }
            return a - b;
        });
        StringBuilder sb = new StringBuilder();
        for (char c : sortedTeams) {
            sb.append(c);
        }
        return sb.toString();
    }
}
