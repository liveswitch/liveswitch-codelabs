package com.example.application;

import android.app.Activity;
import android.content.Context;
import android.database.Cursor;
import android.media.AudioDeviceInfo;
import android.media.AudioManager;
import android.media.projection.MediaProjection;
import android.os.Handler;
import android.view.View;
import android.widget.RelativeLayout;

import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;


public class HelloWorldLogic {

    private final Context context;
    private final Handler handler;
    private static HelloWorldLogic app;

    private HelloWorldLogic(Context context)
    {
        this.context = context.getApplicationContext();
        this.handler = new Handler(context.getMainLooper());
    }

    public static synchronized  HelloWorldLogic getInstance(Context context){
        if(app == null){
            app = new HelloWorldLogic(context);
        }
        return app;
    }

    private String applicationId = Config.applicationId;
    private String channelId = Config.channelId;
    private String gatewayUrl = Config.gatewayUrl;
    private String sharedSecret = Config.sharedSecret;
}