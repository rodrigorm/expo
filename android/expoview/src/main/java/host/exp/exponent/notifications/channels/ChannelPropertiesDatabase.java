package host.exp.exponent.notifications.channels;

import com.raizlabs.android.dbflow.annotation.Database;

@Database(name = ChannelPropertiesDatabase.NAME, version = ChannelPropertiesDatabase.VERSION)
public class ChannelPropertiesDatabase {
  public static final String NAME = "ExpoNotificationChannelProperties";
  public static final int VERSION = 1;
}
