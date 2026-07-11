class Solution {
    public String shiftingLetters(String s, int[] shifts) {
        int n = shifts.length;
        int[] l = new int[n];
        int z = 0;
        for (int shift : shifts) {
            z = (z + shift) % 26;
        }
        l[0] = z;
        for (int i = 1; i < n; i++) {
            l[i] = (l[i - 1] - shifts[i - 1]) % 26;
            if (l[i] < 0) l[i] += 26;
        }
        StringBuilder k = new StringBuilder();
        for (int i = 0; i < n; i++) {
            int original = s.charAt(i) - 'a';
            int shifted = (original + l[i]) % 26;
            k.append((char)(shifted + 'a'));
        }
        return k.toString();
    }
}
