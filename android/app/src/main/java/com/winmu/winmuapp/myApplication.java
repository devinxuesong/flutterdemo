package com.winmu.winmuapp;
import android.util.Log;

import io.flutter.app.FlutterApplication;

public class myApplication extends FlutterApplication{
    private String TAG = "111_____myApplication";
    @Override
    public void onCreate() {
        super.onCreate();
        Log.i(TAG, "devin---onCreate: ");
    }
}
