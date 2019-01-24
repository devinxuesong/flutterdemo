package com.winmu.winmuplugin;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import android.app.Activity;
import android.util.Log;
/** WinmupluginPlugin */
public class WinmupluginPlugin implements MethodCallHandler {
    private Activity activity;
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "winmuplugin");
    channel.setMethodCallHandler(new WinmupluginPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equals("TestAcitivity")){
      //解析参数
      String text = call.argument("flutter");
        Log.i("onMethodCall devin ", "onMethodCall: 解析参数="+text);
      //带参数跳转到指定Activity
    //  Intent intent = new Intent(activity, TwoActivity.class);
     // intent.putExtra(TwoActivity.VALUE, text);
     // activity.startActivity(intent);

      //返回给flutter的参数
      result.success("success");
    }else {
      result.notImplemented();
    }
  }
}
