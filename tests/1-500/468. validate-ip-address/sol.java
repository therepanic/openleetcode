class Solution {
    public String validIPAddress(String queryIP) {
        if (queryIP.chars().filter(ch -> ch == '.').count() == 3) {
            String[] parts = queryIP.split("\\.", -1);
            boolean valid = true;
            for (String p : parts) {
                if (p.isEmpty() || !p.matches("[0-9]+")) {
                    valid = false;
                    break;
                }
                try {
                    int val = Integer.parseInt(p);
                    if (val < 0 || val > 255 || !String.valueOf(val).equals(p)) {
                        valid = false;
                        break;
                    }
                } catch (NumberFormatException e) {
                    valid = false;
                    break;
                }
            }
            if (valid) return "IPv4";
        } else if (queryIP.chars().filter(ch -> ch == ':').count() == 7) {
            String[] parts = queryIP.split(":", -1);
            boolean valid = true;
            for (String p : parts) {
                if (p.length() < 1 || p.length() > 4) {
                    valid = false;
                    break;
                }
                if (!p.matches("[0-9a-fA-F]+")) {
                    valid = false;
                    break;
                }
            }
            if (valid) return "IPv6";
        }
        return "Neither";
    }
}
