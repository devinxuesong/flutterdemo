package com.winmu.winmuplugin;
import android.util.Log;

import com.baidu.mapapi.SDKInitializer;

import io.flutter.app.FlutterApplication;

public class myApplication extends FlutterApplication{
    private String TAG = "plugin_____myApplication";
    @Override
    public void onCreate() {
        super.onCreate();
        Log.i(TAG, "devin---onCreate: ");
        SDKInitializer.initialize(getApplicationContext());
    }

}
