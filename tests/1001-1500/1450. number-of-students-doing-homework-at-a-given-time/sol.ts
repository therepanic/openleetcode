function busyStudent(
  startTime: number[],
  endTime: number[],
  queryTime: number,
): number {
  return startTime.filter(
    (_, i) => startTime[i] <= queryTime && queryTime <= endTime[i],
  ).length;
}
