package com.example.socialmedia.helper;

import org.ocpsoft.prettytime.PrettyTime;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Locale;

public class RelativeTime {
    public static String from(Date date) {
        PrettyTime prettyTime = new PrettyTime(new Locale("VI"));
        return prettyTime.format(date);
    }
}
