# kaniyam Linux commands and examples
Linux commands, usage and examples

### 1. date
:red_circle:$ date - print or set the system date and time

To display date without any options\
**$ date**\

To display the time in GMT/UTC time zone
$ date -u

To display the given date string in the format of date
$ date --date="1/04/2020"
$ date --date="April 2 2020"

To display past dates
$ date --date="3 year ago"
$ date --date="5 hours ago"
$date --date="1 month ago"
$ date --date="2 week ago"
$date --date="10 day ago"

To display future date
$date --date="next wed"
$ date --date="next month"
$date --date="2 day"121
$date --date="1 year"

To set the system date and time
$date --set="Wed Apr 27 14:20:55 PDT 2022"

To display the date string present at each line of file in the
date and time format
$ cat >> datefile
May 07 2022
Apr 03 2022

$ date --file=datefile

%D: Display date as mm/dd/yy.
%d: Display the day of the month (01 to 31).
%a: Displays the abbreviated name for weekdays (Sun to Sat).
%A: Displays full weekdays (Sunday to Saturday).
%h: Displays abbreviated month name (Jan to Dec).
%b: Displays abbreviated month name (Jan to Dec).
%B: Displays full month name(January to December).
%m: Displays the month of year (01 to 12).
%y: Displays last two digits of the year(00 to 99).
%Y: Display four-digit year.
%T: Display the time in 24 hour format as HH:MM:SS.
%H: Display the hour.
%M: Display the minute.
%S: Display the seconds.
$ date +%[format-option]
$ date "+%D"
$ date "+%D %T"
$ date "+%A %B %d %T %y"
$ date "+%Y/%m/%d"
$ date "+%Y-%m-%d"


