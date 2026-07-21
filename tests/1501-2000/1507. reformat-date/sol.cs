public class Solution {
    public string ReformatDate(string date) {
        var monthDict = new System.Collections.Generic.Dictionary<string, string> {
            {"Jan", "01"}, {"Feb", "02"}, {"Mar", "03"}, {"Apr", "04"},
            {"May", "05"}, {"Jun", "06"}, {"Jul", "07"}, {"Aug", "08"},
            {"Sep", "09"}, {"Oct", "10"}, {"Nov", "11"}, {"Dec", "12"}
        };
        var parts = date.Split(' ');
        var day = parts[0].Substring(0, parts[0].Length - 2);
        if (day.Length == 1) day = "0" + day;
        var month = monthDict[parts[1]];
        var year = parts[2];
        return year + "-" + month + "-" + day;
    }
}
