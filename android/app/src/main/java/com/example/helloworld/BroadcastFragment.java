package com.example.helloworld;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;

//import com.example.application.Broadcaster;
//import com.example.application.Participant;
//import com.example.application.Receiver;

import fm.liveswitch.Promise;

public class BroadcastFragment extends Fragment {

    public BroadcastFragment() {
    }

    public static BroadcastFragment newInstance() {
        BroadcastFragment fragment = new BroadcastFragment();
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
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_broadcast, container, false);
        BroadcastButton = (Button) view.findViewById(R.id.broadcastButton);
        ReceiveButton = (Button) view.findViewById(R.id.ReceiveButton);
        BroadcastButton.setClickable(false);
        ReceiveButton.setClickable(false);
        return view;
    }

    @Override
    public void onStart() {
        super.onStart();
        setUpButtons();
    }

    private Button BroadcastButton;
    private Button ReceiveButton;
//    private Participant appInstance;

    public RelativeLayout getVideoContainer() {
        RelativeLayout videoContainer = getActivity().findViewById(R.id.videoContainer);
        return videoContainer;
    }

    private void setBroadcastButtonClickable(boolean clickable) {
        if(getView() != null) {
            getView().post(() -> {
                BroadcastButton.setClickable(clickable);
            });
        }
    }

    private void setReceiveButtonClickable(boolean clickable) {
        if(getView() != null) {
            getView().post(() -> {
                ReceiveButton.setClickable(clickable);
            });
        }
    }

    public void setStatusText(String message) {
        if(getView() != null) {
            getView().post(() -> {
                TextView text = (TextView)getView().findViewById(R.id.broadcastStatusText);
                text.setText(message);
            });
        }
    }

    public void setUpButtons() {
        BroadcastButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                setStatusText("Broadcasting");
//                if(appInstance instanceof Receiver) {
//                    setStatusText("Stopping receiver instance");
//                    stop().then(result -> {
//                        setStatusText("Successfully stopped receiver instance");
//                        enableBroadcaster();
//                    });
//                }
//                else{
//                    enableBroadcaster();
//                }
            }
        });
        ReceiveButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                setStatusText("Subscribing");
//                if(appInstance instanceof Broadcaster) {
//                    setStatusText("Stopping broadcaster instance");
//                    stop().then(result -> {
//                        setStatusText("Successfully broadcaster instance");
//                        enableReceiver();
//                    });
//                }
//                else{
//                    enableReceiver();
//                }
            }
        });
    }

    private void enableBroadcaster() {
//        setBroadcastButtonClickable(false);
//        setReceiveButtonClickable(false);
//        appInstance = Broadcaster.getInstance(getActivity().getBaseContext());
//        start().then(result -> {
//            setReceiveButtonClickable(true);
//        });
    }
    private void enableReceiver() {
//        setReceiveButtonClickable(false);
//        setBroadcastButtonClickable(false);
//        appInstance = Receiver.getInstance(getActivity().getBaseContext());
//        start().then(result -> {
//            setBroadcastButtonClickable(true);
//        });
    }

    public fm.liveswitch.Future<Object> start() {
        Promise<Object> promise = new Promise<>();
//        appInstance.start(getActivity(), getVideoContainer()).then(resultStart -> {
//            appInstance.joinAsync().then(resultJoin -> {
//                String message = String.format("Client %s has successfully joined channel %s",
//                        appInstance.getClient().getId(),
//                        appInstance.getChannel().getId());
//                setStatusText(message);
//                promise.resolve(null);
//            }).fail(exception -> {
//                setStatusText("Unable to join channel");
//                promise.reject(exception);
//            });
//        }).fail(exception -> {
//            setStatusText("Unable to start local media");
//            promise.reject(null);
//        });
        return promise;
    }

    public fm.liveswitch.Future<Object> stop() {
        Promise<Object> promise = new Promise<>();
//        if(appInstance != null && appInstance.getClient() != null) {
//            appInstance.leaveAsync().then(resultLeave -> {
//                appInstance.stop().then(resultStop -> {
//                    promise.resolve(null);
//                }).fail(exception -> {
//                    promise.reject(exception);
//                });
//            }).fail(exception -> {
//                promise.reject(exception);
//            });
//        }
//        else {
            promise.resolve(null);
//        }
        return promise;
    }

    @Override
    public String toString() {
        return "Broadcasting";
    }
}