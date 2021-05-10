package com.example.helloworld;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;

import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.example.application.HelloWorldLogic;

import java.io.OutputStream;
import java.util.concurrent.Executors;


public class OnFileReceiveFragment extends DialogFragment {


    HelloWorldLogic appInstance;
    public OnFileReceiveFragment() {
        // Required empty public constructor
    }

    // TODO: Rename and change types and number of parameters
    public static OnFileReceiveFragment newInstance() {
        OnFileReceiveFragment fragment = new OnFileReceiveFragment();
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        context = getActivity().getBaseContext();
        return inflater.inflate(R.layout.fragment_on_file_receive, container, false);
    }

    Context context;

    @NonNull
    @Override
    public Dialog onCreateDialog(@Nullable Bundle savedInstanceState) {
        appInstance = HelloWorldLogic.getInstance(getActivity().getBaseContext());
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder
                .setMessage("New File received, Download?")
                .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
//                        newFile(appInstance.getFileName());
                    }
                })
                .setNegativeButton("No", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
//                        appInstance.setFileData(null);
//                        appInstance.setFileName("");
                    }
                });

        return builder.create();
    }

    final int NEW_FILE = 104;
    public void newFile(String name) {
//        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
//        intent.addCategory(Intent.CATEGORY_OPENABLE);
//        intent.setType("*/*");
//        intent.putExtra(Intent.EXTRA_TITLE, name);
//        getActivity().startActivityForResult(intent, NEW_FILE);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(requestCode == NEW_FILE && resultCode == Activity.RESULT_OK){
            if(data != null){
//                final Uri fileUri = data.getData();
//                final byte[] fileData = appInstance.getFileData();
//                final ContentResolver resolver = context.getContentResolver();
//                if(fileData != null){
//                    Thread runnable = new Thread(new Runnable() {
//                        @Override
//                        public void run() {
//                            try {
//                                OutputStream outputStream = resolver.openOutputStream(fileUri);
//                                outputStream.write(fileData);
//                                outputStream.close();
//
//                            } catch (Exception e){
//                                e.printStackTrace();
//                            }
//                        }
//                    });
//                    Executors.newSingleThreadExecutor().execute(runnable);
//                }
            }
        }
    }

    @Override
    public String toString() {
        return "File Received";
    }
}