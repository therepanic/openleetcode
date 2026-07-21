function dayOfTheWeek(day: number, month: number, year: number): string {
  const days: string[] = [
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
  ];

  const leapYears: Set<number> = new Set();
  for (let i = 1960; i < 2100; i += 4) {
    leapYears.add(i);
  }

  const yearsDays: { [key: number]: number } = {};
  for (let i = 1960; i <= 2100; i++) {
    yearsDays[i] = leapYears.has(i) ? 366 : 365;
  }

  const monthsDays: number[] = [
    0,
    31,
    leapYears.has(year) ? 29 : 28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31,
  ];

  let resultDays = 0;
  for (let y = 1971; y < year; y++) {
    resultDays += yearsDays[y];
  }
  for (let m = 1; m < month; m++) {
    resultDays += monthsDays[m];
  }
  resultDays += day;

  return days[resultDays % 7];
}
