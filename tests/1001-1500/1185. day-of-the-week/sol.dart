class Solution {
  String dayOfTheWeek(int day, int month, int year) {
    List<String> days = ["Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday"];
    
    Set<int> leapYears = {};
    for (int i = 1960; i < 2100; i += 4) {
      leapYears.add(i);
    }
    
    Map<int, int> yearsDays = {};
    for (int i = 1960; i <= 2100; i++) {
      yearsDays[i] = leapYears.contains(i) ? 366 : 365;
    }
    
    List<int> monthsDays = [0, 31, leapYears.contains(year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    
    int resultDays = 0;
    for (int y = 1971; y < year; y++) {
      resultDays += yearsDays[y]!;
    }
    for (int m = 1; m < month; m++) {
      resultDays += monthsDays[m];
    }
    resultDays += day;
    
    return days[resultDays % 7];
  }
}
