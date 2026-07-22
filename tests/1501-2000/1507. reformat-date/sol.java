class Solution {
    public String reformatDate(String date) {
        java.util.Map<String, String> monthDict = new java.util.HashMap<>();
        monthDict.put("Jan", "01"); monthDict.put("Feb", "02"); monthDict.put("Mar", "03");
        monthDict.put("Apr", "04"); monthDict.put("May", "05"); monthDict.put("Jun", "06");
        monthDict.put("Jul", "07"); monthDict.put("Aug", "08"); monthDict.put("Sep", "09");
        monthDict.put("Oct", "10"); monthDict.put("Nov", "11"); monthDict.put("Dec", "12");
        
        String[] parts = date.split(" ");
        String day = parts[0];
        String month = parts[1];
        String year = parts[2];
        
        day = day.substring(0, day.length() - 2);
        if (day.length() == 1) day = "0" + day;
        month = monthDict.get(month);
        
        return year + "-" + month + "-" + day;
    }
}
