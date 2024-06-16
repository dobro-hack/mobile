// Map<String, List<int>> prepareDataForChart(List<int> weeklyData) {
 

//   // Количество недель в каждом месяце (упрощенно)
//   List<int> weeksPerMonth = [4, 4, 5, 4, 4, 4, 5, 4, 4, 5, 4, 5];

//   Map<String, List<int>> monthlyData = {};

//   int weekIndex = 0;

//   for (int i = 0; i < monthNames.length; i++) {
//     List<int> weeks = [];
//     for (int j = 0; j < weeksPerMonth[i]; j++) {
//       if (weekIndex < weeklyData.length) {
//         weeks.add(weeklyData[weekIndex]);
//         weekIndex++;
//       }
//     }
//     monthlyData[monthNames[i]] = weeks;
//   }

//   return monthlyData;
// }
