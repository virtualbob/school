#!/usr/bin/php
<?php
  $Time="2006-06-20 19:00:00";
  TimeDifference($Time, $seconds, $hours, $minutes, $days);                                                                     
  echo "\n".sprintf("%3d days, %2d hours, %2d minutes, and %2d seconds",
      $days, $hours, $minutes, $seconds);
  echo " since you left ... :(";

  $Time="2006-11-15 20:00:00";
  TimeDifference($Time, $seconds, $hours, $minutes, $days);                                                                     
  echo "\n".sprintf("%3d days, %2d hours, %2d minutes, and %2d seconds",
      $days, $hours, $minutes, $seconds);
  echo " till I see you again... :)";

  echo "\n";

  function TimeDifference($ReferenceTime, &$seconds, &$hours, &$minutes, &$days)
  {
    $seconds=abs(strtotime($ReferenceTime) - mktime());
    $days   =intval(($seconds)                                   /(24*60*60));
    $hours  =intval(($seconds-($days*24*60*60))                  /(   60*60));
    $minutes=intval(($seconds-($days*24*60*60)-($hours*60*60))   /(      60));
    $seconds=intval(($seconds-($days*24*60*60)-($hours*60*60)-($minutes*60)));
  }
?>
