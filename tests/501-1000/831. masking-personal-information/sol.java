class Solution {
    public String maskPII(String s) {
        if (s.contains("@")) {
            String[] parts = s.split("@");
            String name = parts[0].toLowerCase();
            String domain = parts[1].toLowerCase();
            name = name.charAt(0) + "*****" + name.charAt(name.length() - 1);
            return name + "@" + domain;
        } else {
            StringBuilder gg = new StringBuilder();
            for (char x : s.toCharArray()) {
                if (Character.isDigit(x)) {
                    gg.append(x);
                }
            }
            String digits = gg.toString();
            int l = digits.length();
            if (l > 10) {
                return "+" + "*".repeat(l - 10) + "-***-***-" + digits.substring(l - 4);
            }
            return "***-***-" + digits.substring(l - 4);
        }
    }
}
