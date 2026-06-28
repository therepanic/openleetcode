class Solution {
    public String makeLargestSpecial(String s) {
        int count = 0;
        int i = 0;
        java.util.ArrayList<String> res = new java.util.ArrayList<>();
        
        for (int j = 0; j < s.length(); j++) {
            count += (s.charAt(j) == '1' ? 1 : -1);
            
            if (count == 0) {
                res.add("1" + makeLargestSpecial(s.substring(i + 1, j)) + "0");
                i = j + 1;
            }
        }
        
        res.sort(java.util.Comparator.reverseOrder());
        return String.join("", res);
    }
}
