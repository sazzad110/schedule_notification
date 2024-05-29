# schedule_notification

A new Flutter project.

## Getting Started

    add this permission in android manifest
        <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
        <uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />
## also add this lines of code before     </application>
    <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver" />
            <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
                <intent-filter>
                    <action android:name="android.intent.action.BOOT_COMPLETED"/>
                    <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
                    <action android:name="android.intent.action.QUICKBOOT_POWERON" />
                    <action android:name="com.htc.intent.action.QUICKBOOT_POWERON"/>
                </intent-filter>
            </receiver>
