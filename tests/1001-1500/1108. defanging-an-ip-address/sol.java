class Solution {
    public String defangIPaddr(String address) {
        StringBuilder s = new StringBuilder();
        for (char i : address.toCharArray()) {
            if (i == '.') {
                s.append("[.]");
            } else {
                s.append(i);
            }
        }
        return s.toString();
    }
}
