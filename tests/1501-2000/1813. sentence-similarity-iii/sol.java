class Solution {
    public boolean areSentencesSimilar(String sentence1, String sentence2) {
        String[] s1 = sentence1.split(" ");
        String[] s2 = sentence2.split(" ");
        
        int l1 = 0, l2 = 0, r1 = s1.length - 1, r2 = s2.length - 1;
        
        while (l1 <= r1 && l2 <= r2) {
            if (s1[l1].equals(s2[l2])) {
                l1++;
                l2++;
            } else if (s1[r1].equals(s2[r2])) {
                r1--;
                r2--;
            } else {
                return false;
            }
        }
        
        return true;
    }
}
