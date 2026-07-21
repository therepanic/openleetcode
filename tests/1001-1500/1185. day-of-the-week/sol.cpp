class Solution {
public:
    string dayOfTheWeek(int day, int month, int year) {
        string days[] = {"Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday"};
        
        set<int> leapYears;
        for (int i = 1960; i < 2100; i += 4) {
            leapYears.insert(i);
        }
        
        unordered_map<int, int> yearsDays;
        for (int i = 1960; i <= 2100; i++) {
            yearsDays[i] = leapYears.count(i) ? 366 : 365;
        }
        
        int monthsDays[] = {0, 31, leapYears.count(year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        
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
};
