class Solution {
    public String dayOfTheWeek(int day, int month, int year) {
        String[] days = {"Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday"};
        
        java.util.Set<Integer> leapYears = new java.util.HashSet<>();
        for (int i = 1960; i < 2100; i += 4) {
            leapYears.add(i);
        }
        
        int[] yearsDays = new int[2101];
        for (int i = 1960; i <= 2100; i++) {
            yearsDays[i] = leapYears.contains(i) ? 366 : 365;
        }
        
        int[] monthsDays = new int[13];
        monthsDays[1] = 31;
        monthsDays[2] = leapYears.contains(year) ? 29 : 28;
        monthsDays[3] = 31;
        monthsDays[4] = 30;
        monthsDays[5] = 31;
        monthsDays[6] = 30;
        monthsDays[7] = 31;
        monthsDays[8] = 31;
        monthsDays[9] = 30;
        monthsDays[10] = 31;
        monthsDays[11] = 30;
        monthsDays[12] = 31;
        
        int resultDays = 0;
        for (int y = 1971; y < year; y++) {
            resultDays += yearsDays[y];
        }
        for (int m = 1; m < month; m++) {
            resultDays += monthsDays[m];
        }
        resultDays += day;
        
        return days[resultDays % 7];
    }
}
