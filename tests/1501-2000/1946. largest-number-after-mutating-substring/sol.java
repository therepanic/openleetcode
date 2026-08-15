class Solution {
    public String maximumNumber(String num, int[] change) {
        char[] a = num.toCharArray();
        boolean flag = false;
        for (int i = 0; i < a.length; i++) {
            int b = a[i] - '0';
            if (b < change[b]) {
                a[i] = (char)(change[b] + '0');
                flag = true;
            } else if (b == change[b] || !flag) {
                continue;
            } else {
                break;
            }
        }
        return new String(a);
    }
}
