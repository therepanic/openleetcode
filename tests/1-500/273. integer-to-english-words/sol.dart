class Solution {
  List<String> ones = [
    "Zero",
    "One",
    "Two", 
    "Three", 
    "Four", 
    "Five", 
    "Six", 
    "Seven", 
    "Eight", 
    "Nine", 
    "Ten", 
    "Eleven", 
    "Twelve", 
    "Thirteen", 
    "Fourteen", 
    "Fifteen", 
    "Sixteen", 
    "Seventeen", 
    "Eighteen", 
    "Nineteen"
  ];

  List<String> tens = [
    "Zero",
    "Ten",
    "Twenty",
    "Thirty", 
    "Forty", 
    "Fifty", 
    "Sixty", 
    "Seventy", 
    "Eighty", 
    "Ninety"
  ];

  List<String> magnitude = [
    "",
    "Thousand",
    "Million",
    "Billion",
    "Trillion"
  ];

  String helper3Digit(int n) {
    int num = n;
    String ans = "";
    int count = 0;
    int rem = 0;
    int prevRem = 0;

    while (num > 0) {
      count++;
      rem = num % 10;
      num = num ~/ 10;

      if (rem == 0) {
        continue;
      } else if (count == 1) {
        ans += ones[rem];
      } else if (count == 2) {
        if (rem == 1) {
          ans = ones[rem * 10 + prevRem];
        } else {
          ans = tens[rem] + " " + ans;
        }
      } else if (count == 3) {
        ans = ones[rem] + " Hundred " + ans;
      }
      prevRem = rem;
    }

    return ans.trim();
  }

  String numberToWords(int num) {
    if (num == 0) {
      return "Zero";
    }

    int n = num;
    String ans = "";
    int count = 0;

    while (n > 0) {
      int rem = n % 1000;
      if (rem != 0) {
        ans = helper3Digit(rem) + " " + magnitude[count] + " " + ans;
      }
      n = n ~/ 1000;
      count++;
    }

    return ans.trim();
  }
}
