function reformatDate(date: string): string {
  const monthDict: { [key: string]: string } = {
    Jan: "01",
    Feb: "02",
    Mar: "03",
    Apr: "04",
    May: "05",
    Jun: "06",
    Jul: "07",
    Aug: "08",
    Sep: "09",
    Oct: "10",
    Nov: "11",
    Dec: "12",
  };
  const parts = date.split(" ");
  let day = parts[0].slice(0, -2);
  if (day.length === 1) day = "0" + day;
  const month = monthDict[parts[1]];
  const year = parts[2];
  return year + "-" + month + "-" + day;
}
