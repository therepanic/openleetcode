class Solution {
    public boolean checkInclusion(String s1, String s2) {
        int n1 = s1.length(), n2 = s2.length();
        if (n2 < n1) return false;

        int[] c1 = new int[26];
        int[] c2 = new int[26];

        for (int i = 0; i < n1; i++) {
            c1[s1.charAt(i) - 'a']++;
            c2[s2.charAt(i) - 'a']++;
        }

        if (Arrays.equals(c1, c2)) return true;

        for (int i = n1; i < n2; i++) {
            c2[s2.charAt(i) - 'a']++;
            c2[s2.charAt(i - n1) - 'a']--;

            if (Arrays.equals(c1, c2)) return true;
        }

        return false;
    }
}
