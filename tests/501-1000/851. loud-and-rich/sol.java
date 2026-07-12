class Solution {
    public int[] loudAndRich(int[][] richer, int[] quiet) {
        int n = quiet.length;
        int[] answer = new int[n];
        for (int i = 0; i < n; i++) {
            answer[i] = i;
        }
        boolean changed = true;
        while (changed) {
            changed = false;
            for (int[] pair : richer) {
                int richerPerson = pair[0];
                int poorerPerson = pair[1];
                if (quiet[answer[richerPerson]] < quiet[answer[poorerPerson]]) {
                    answer[poorerPerson] = answer[richerPerson];
                    changed = true;
                }
            }
        }
        return answer;
    }
}
