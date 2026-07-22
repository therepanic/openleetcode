public class Solution {
    public string DayOfTheWeek(int day, int month, int year) {
        string[] days = {"Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday"};
        
        HashSet<int> leapYears = new HashSet<int>();
        for (int i = 1960; i < 2100; i += 4) {
            leapYears.Add(i);
        }
        
        Dictionary<int, int> yearsDays = new Dictionary<int, int>();
        for (int i = 1960; i <= 2100; i++) {
            yearsDays[i] = leapYears.Contains(i) ? 366 : 365;
        }
        
        int[] monthsDays = new int[13];
        monthsDays[1] = 31;
        monthsDays[2] = leapYears.Contains(year) ? 29 : 28;
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
