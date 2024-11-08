class DateFormatter {
  static String formatMonthHeader(DateTime date) {
    final now = DateTime.now();
    final isCurrentYear = date.year == now.year;

    final months = [
      '一月',
      '二月',
      '三月',
      '四月',
      '五月',
      '六月',
      '七月',
      '八月',
      '九月',
      '十月',
      '十一月',
      '十二月'
    ];

    if (isCurrentYear) {
      return months[date.month - 1];
    } else {
      return '${date.year}年${months[date.month - 1]}';
    }
  }

  static String formatDate(DateTime date) {
    return '${date.month}月${date.day}日';
  }
}
