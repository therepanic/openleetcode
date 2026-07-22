class Solution {
    public boolean checkIfCanBreak(String s1, String s2) {
        int[] freq = new int[26];
        int n = s1.length();

        for (char ch : s1.toCharArray()) {
            freq[ch - 'a']++;
        }

        StringBuilder temp1 = new StringBuilder();

        for (int i = 25; i >= 0; i--) {
            while (freq[i] > 0) {
                temp1.append((char)('a' + i));
                freq[i]--;
            }
        }

        freq = new int[26];

        for (char ch : s2.toCharArray()) {
            freq[ch - 'a']++;
        }

        StringBuilder temp2 = new StringBuilder();

        for (int i = 25; i >= 0; i--) {
            while (freq[i] > 0) {
                temp2.append((char)('a' + i));
                freq[i]--;
            }
        }

        String sorted1 = temp1.toString();
        String sorted2 = temp2.toString();

        boolean all1 = true;
        boolean all2 = true;

        for (int i = 0; i < n; i++) {
            if (sorted1.charAt(i) < sorted2.charAt(i)) {
                all1 = false;
            }
            if (sorted2.charAt(i) < sorted1.charAt(i)) {
                all2 = false;
            }
        }

        return all1 || all2;
    }
}
