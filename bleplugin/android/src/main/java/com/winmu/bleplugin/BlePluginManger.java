package com.winmu.bleplugin;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;

import com.winmu.bluetooth.Bean.UserInfo;
import com.winmu.bluetooth.Listener.BleBindServiceListener;
import com.winmu.bluetooth.Listener.BleCmdListener;
import com.winmu.bluetooth.Listener.BleConnListener;
import com.winmu.bluetooth.Listener.BleVehileStatusListener;
import com.winmu.bluetooth.Manger.BleManger;

public class BlePluginManger {
    private static BlePluginManger _instance;
    private Context context;
    private BleManger bleManger;
    private UserInfo userInfo;
    private BleConnListener bleConnListener;
    private BleCmdListener bleCmdListener;
    private BleBindServiceListener bleBindServiceListener;
    private BleVehileStatusListener bleVehileStatusListener;

    private BlePluginManger(Context con) {
        this.context = con;
    }

    public static BlePluginManger getInstance(Context context) {
        if (_instance == null) {
            _instance = new BlePluginManger(context);
        }
        return _instance;
    }


    public BleManger getBleManger(Context context) {
        if (bleManger == null) {
            bleManger = BleManger.getInstance(context.getApplicationContext());
            bleManger.initService();
            bleManger.setUserInfo(userInfo);
        }
        return bleManger;
    }


    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    private void connect() {

        //扫描和连接
        String s_vin = "xxxx";//vin.getText().toString();
        bleManger.startLeScanConn(s_vin, 30000, bleConnListener);
        bleManger.setVehicleStatusListener(bleVehileStatusListener);

    }

}
