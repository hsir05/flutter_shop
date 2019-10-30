import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Map<String, Color> emumMap = const {
  "Objective-C": Color(0xFF438EFF),
  "Perl": Color(0xFF0298C3),
  "Python": Color(0xFF0298C3),
  "JavaScript": Color(0xFFF1E05A),
  "PHP": Color(0xFF4F5D95),
  "R": Color(0xFF188CE7),
  "Lua": Color(0xFFC22D40),
  "Scala": Color(0xFF020080),
  "Swift": Color(0xFFFFAC45),
  "Kotlin": Color(0xFFF18E33),
  "Vue": Colors.black,
  "Ruby": Color(0xFF701617),
  "Shell": Color(0xFF89E051),
  "TypeScript": Color(0xFF2B7489),
  "C++": Color(0xFFF34B7D),
  "CSS": Color(0xFF563C7C),
  "Java": Color(0xFFB07219),
  "C#": Color(0xFF178600),
  "Go": Color(0xFF375EAB),
  "Erlang": Color(0xFFB83998),
  "C": Color(0xFF555555),
};

class Util {
  static String getTimeDuration(String comTime) {
    var nowTime = DateTime.now();
    var compareTime = DateTime.parse(comTime);
    if (nowTime.isAfter(compareTime)) {
      if (nowTime.year == compareTime.year) {
        if (nowTime.month == compareTime.month) {
          if (nowTime.day == compareTime.day) {
            if (nowTime.hour == compareTime.hour) {
              if (nowTime.minute == compareTime.minute) {
                return '片刻之间';
              }
              return (nowTime.minute - compareTime.minute).toString() + '分钟前';
            }
            return (nowTime.hour - compareTime.hour).toString() + '小时前';
          }
          return (nowTime.day - compareTime.day).toString() + '天前';
        }
        return (nowTime.month - compareTime.month).toString() + '月前';
      }
      return (nowTime.year - compareTime.year).toString() + '年前';
    }
    return 'time error';
  }

  static double setPercentage(percentage, context) {
    return MediaQuery.of(context).size.width * percentage;
  }

  static Color getLangColor(String language) {
    if (emumMap.containsKey(language)) {
      return emumMap[language];
    }
    return Colors.black26;
  }

  static String getTimeDate(String comTime) {
    var compareTime = DateTime.parse(comTime);
    String weekDay = '';
    switch (compareTime.weekday) {
      case 2:
        weekDay = '周二';
        break;
      case 3:
        weekDay = '周三';
        break;
      case 4:
        weekDay = '周四';
        break;
      case 5:
        weekDay = '周五';
        break;
      case 6:
        weekDay = '周六';
        break;
      case 7:
        weekDay = '周日';
        break;
      default:
        weekDay = '周一';
    }
    return '${compareTime.month}-${compareTime.day}  $weekDay';
  }

  static bool isWebsite(String str) {
    // String url = decodeComponent(str);
    return RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+").hasMatch(str);
  }
}

/*
 * import 'package:daily_purify/Utils/date_util.dart';
 *  String dateTime = DateUtil.formatDateSimple()
*/
class DateUtil {

  static getFormartData(int timeSamp, String format) {
    var dataFormart = new DateFormat(format);
    var dateTime = new DateTime.fromMillisecondsSinceEpoch(timeSamp);
    String formartResult = dataFormart.format(dateTime);
    return formartResult;
  }

  static formatDateSimple(DateTime dt) {
    StringBuffer sb = new StringBuffer();
    sb.write(dt.year.toString());
    sb.write(dt.month.toString().padLeft(2, '0'));
    sb.write(dt.day.toString().padLeft(2, '0'));
    return sb.toString();
  }

  static formatDate(int time) {
    var dt = new DateTime.fromMillisecondsSinceEpoch(time);

    StringBuffer sb = new StringBuffer();
    sb.write(dt.year);
    sb.write('-');
    sb.write(dt.month.toString().padLeft(2, '0'));
    sb.write('-');
    sb.write(dt.day.toString().padLeft(2, '0'));
    sb.write(' ');
    sb.write(dt.hour.toString().padLeft(2, '0'));
    sb.write(':');
    sb.write(dt.minute.toString().padLeft(2, '0'));
    sb.write(':');
    sb.write(dt.second.toString().padLeft(2, '0'));
    return sb.toString();
  }

  static formatDateWithWeek(DateTime dt) {
    StringBuffer sb = new StringBuffer();
    sb.write(dt.year.toString());
    sb.write('年');
    sb.write(dt.month.toString());
    sb.write('月');
    sb.write(dt.day.toString());
    sb.write('日');
    sb.write('   ');
    switch (dt.weekday) {
      case DateTime.monday:
        sb.write('星期一');
        break;
      case DateTime.tuesday:
        sb.write('星期二');
        break;
      case DateTime.wednesday:
        sb.write('星期三');
        break;
      case DateTime.thursday:
        sb.write('星期四');
        break;
      case DateTime.friday:
        sb.write('星期五');
        break;
      case DateTime.saturday:
        sb.write('星期六');
        break;
      case DateTime.sunday:
        sb.write('星期天');
        break;
    }

    return sb.toString();
  }
}

