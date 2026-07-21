class Solution {
    public String entityParser(String text) {
        java.util.Map<String, String> entities = new java.util.HashMap<>();
        entities.put("&quot", "\"");
        entities.put("&apos", "'");
        entities.put("&amp", "&");
        entities.put("&gt", ">");
        entities.put("&lt", "<");
        entities.put("&frasl", "/");
        
        java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("&[^;&\\s]+;");
        java.util.regex.Matcher matcher = pattern.matcher(text);
        
        StringBuffer result = new StringBuffer();
        while (matcher.find()) {
            String match = matcher.group();
            String entity = match.substring(0, match.length() - 1);
            String replacement = entities.getOrDefault(entity, match);
            matcher.appendReplacement(result, java.util.regex.Matcher.quoteReplacement(replacement));
        }
        matcher.appendTail(result);
        
        return result.toString();
    }
}
