class Solution {
    func reformatDate(_ date: String) -> String {
        let monthDict = [
            "Jan": "01", "Feb": "02", "Mar": "03", "Apr": "04",
            "May": "05", "Jun": "06", "Jul": "07", "Aug": "08",
            "Sep": "09", "Oct": "10", "Nov": "11", "Dec": "12"
        ]
        let parts = date.split(separator: " ").map(String.init)
        var day = String(parts[0].dropLast(2))
        if day.count == 1 { day = "0" + day }
        let month = monthDict[parts[1]]!
        let year = parts[2]
        return year + "-" + month + "-" + day
    }
}
