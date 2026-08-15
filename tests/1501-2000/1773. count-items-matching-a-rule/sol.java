class Solution {
    public int countMatches(List<List<String>> items, String ruleKey, String ruleValue) {
        String[][] itemArray = new String[items.size()][];
        for (int i = 0; i < items.size(); i++) {
            itemArray[i] = items.get(i).toArray(new String[0]);
        }
        return countMatches(itemArray, ruleKey, ruleValue);
    }

    public int countMatches(String[][] items, String ruleKey, String ruleValue) {
        java.util.Map<String,Integer> key_map = new java.util.HashMap<>();
        key_map.put("type",0);
        key_map.put("color",1);
        key_map.put("name",2);
        int count=0;
        int idx=key_map.get(ruleKey);
        for(String[] item : items){
            if(item[idx].equals(ruleValue)){
                count++;
            }
        }
        return count;
    }
}
