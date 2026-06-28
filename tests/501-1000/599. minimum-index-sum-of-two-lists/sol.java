class Solution {
    public String[] findRestaurant(String[] list1, String[] list2) {
        java.util.Map<String, Integer> mp = new java.util.HashMap<>();
        mp.put(list1[0], Integer.MIN_VALUE);
        for (int i = 1; i < list1.length; i++) {
            mp.put(list1[i], -i);
        }
        if (!mp.containsKey(list2[0])) {
            mp.put(list2[0], Integer.MIN_VALUE);
        } else {
            if (mp.get(list2[0]) != Integer.MIN_VALUE) {
                mp.put(list2[0], Math.abs(mp.get(list2[0])));
            } else {
                mp.put(list2[0], 0);
            }
        }
        for (int i = 1; i < list2.length; i++) {
            if (mp.containsKey(list2[i])) {
                if (mp.get(list2[i]) != Integer.MIN_VALUE) {
                    mp.put(list2[i], Math.abs(mp.get(list2[i])) + i);
                } else {
                    mp.put(list2[i], i);
                }
            } else {
                mp.put(list2[i], -i);
            }
        }
        int minVal = Integer.MAX_VALUE;
        for (int val : mp.values()) {
            if (val >= 0) {
                minVal = Math.min(minVal, val);
            }
        }
        java.util.List<String> ans = new java.util.ArrayList<>();
        for (java.util.Map.Entry<String, Integer> entry : mp.entrySet()) {
            if (entry.getValue() >= 0 && entry.getValue() == minVal) {
                ans.add(entry.getKey());
            }
        }
        return ans.toArray(new String[0]);
    }
}
