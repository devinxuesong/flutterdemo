package com.winmu.bleplugin;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * BlepluginPlugin
 */
public class BlepluginPlugin implements MethodCallHandler {
    private final String TAG = "BlepluginPlugin";
    private Context context;
    private BlePluginManger manger;

    private BlepluginPlugin(Activity activity) {
        this.context = activity.getApplicationContext();
        try {
            initBlePlugin();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "bleplugin");
        channel.setMethodCallHandler(new BlepluginPlugin(registrar.activity()));
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        Log.i(TAG, "onMethodCall: call.method=" + call.method);

        if (call.method.equals("initBle")) {
            Log.i(TAG, "onMethodCall: initBle");

        } else if (call.method.equals("connectBle")) {
            Log.i(TAG, "onMethodCall: connectBle");

        } else if (call.method.equals("disConnectBle")) {
            Log.i(TAG, "onMethodCall: disConnectBle");

        } else if (call.method.equals("distroy")) {
            Log.i(TAG, "onMethodCall: distroy");

        } else {
            result.notImplemented();

        }

    }


    private void initBlePlugin() throws Exception {
        if (manger != null) {
            return;
        }
        if (context == null) {
            throw new Exception("context 不能为空!");
        } else {
            manger = BlePluginManger.getInstance(context);
        }

    }

}
