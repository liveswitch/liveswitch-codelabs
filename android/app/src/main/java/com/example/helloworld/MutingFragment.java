package com.example.helloworld;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import com.example.application.HelloWorldLogic;

public class MutingFragment extends Fragment {


    HelloWorldLogic appInstance;

    public MutingFragment() {
        // Required empty public constructor
    }


    public static MutingFragment newInstance() {
        MutingFragment fragment = new MutingFragment();
        Bundle args = new Bundle();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        appInstance = HelloWorldLogic.getInstance(getActivity().getBaseContext());
        return inflater.inflate(R.layout.fragment_muting, container, false);
    }

    @Override
    public void onStart() {
        super.onStart();
        setupButtons();
    }

    public void setupButtons() {
        Button localAudioToggle = getView().findViewById(R.id.localAudioToggle);
        Button localVideoToggle = getView().findViewById(R.id.localVideoToggle);
        Button remoteAudioToggle = getView().findViewById(R.id.remoteAudioToggle);
        Button remoteVideoToggle = getView().findViewById(R.id.remoteVideoToggle);

        localAudioToggle.setOnClickListener(v -> {
//            localAudioToggle.setClickable(false);
//            appInstance.toggleMuteLocalAudio().then(result -> {
//                getActivity().runOnUiThread(() -> {
//                    localAudioToggle
//                            .setClickable(true);
//                });
//            });
        });

        localVideoToggle.setOnClickListener(v -> {
//            localVideoToggle.setClickable(false);
//            appInstance.toggleMuteLocalVideo().then(result -> {
//               getActivity().runOnUiThread(() -> {
//                   localVideoToggle
//                           .setClickable(true);
//               });
//            });
        });

        remoteAudioToggle.setOnClickListener(v -> {
//            appInstance.toggleDisableRemoteAudio();
        });

        remoteVideoToggle.setOnClickListener(v -> {
//            appInstance.toggleDisableRemoteVideo();
        });
    }

    @Override
    public String toString() {
        return "Muting stream options";
    }
}