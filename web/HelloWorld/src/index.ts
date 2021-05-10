(() => {
    let app = HelloWorld.HelloWorldLogic.getInstance();

    app.displayMessage = (msg: string) => {
        let textContainer = document.getElementById("text-container");
        textContainer.appendChild(document.createTextNode(msg));
        textContainer.appendChild(document.createElement('br'));
    }

    app.saveFile = (fileName: string, data: Uint8Array) => {
        if (confirm(`You've received a file from this channel, do you wish to download ${fileName}?`) == true) {
            let file = new Blob([data]);
            if (window.navigator.msSaveOrOpenBlob) {
                window.navigator.msSaveOrOpenBlob(file, fileName);
            } else {
                var a = document.createElement("a"),
                    url = URL.createObjectURL(file);
                a.href = url;
                a.download = fileName;
                document.body.appendChild(a);
                a.click();
                setTimeout(function () {
                    document.body.removeChild(a);
                    window.URL.revokeObjectURL(url);
                }, 0);
            }
        }
    }
    
    // <Start Local Media>
    let joinBtn = <HTMLButtonElement>document.getElementById("join-btn");
    let leaveBtn = <HTMLButtonElement>document.getElementById("leave-btn");
    joinBtn.onclick = () => {
        //app.startLocalMedia().then(() => {
            loadInputs();
            app.joinAsync().then(() => {
                joinBtn.style.display = "none";
                leaveBtn.style.display = "inline-block";
            });
        //});
    };
    leaveBtn.onclick = () => {
        //app.stopLocalMedia().then(() => {
	    // <Unregister>
//             app.leaveAsync().then(() => {
//                 clearInputs();
//                 joinBtn.style.display = "inline-block";
//                 leaveBtn.style.display = "none";
//             });
	    // </Unregister>
        //});
    };
    // </Start Local Media>
	
	// <Share Screen>
    //let screenShareToggleBtn = <HTMLButtonElement>document.getElementById("screenshare-toggle-btn");
    //screenShareToggleBtn.onclick = () => app.toggleScreenSharing();
    //app.localScreenMedia.addOnVideoStarted(() => {
    //    app.localScreenMedia.getVideoTrack().addOnStopped(() => app.toggleScreenSharing());
    //})
    // </Share Screen>
	
	// <Text Chat>
    //let sendMessageBtn = document.getElementById("send-message-btn");
    //sendMessageBtn.onclick = () => {
    //    let inputbox = <HTMLButtonElement>document.getElementById("inputbox");
    //    var msg = inputbox.value;
    //    if (msg != null || msg.length > 0) {
    //        inputbox.value = "";
    //        app.sendMessage(msg);
    //    }
    //}
    // </Text Chat>

	// <File Transfer>
    //let uploadFileBtn = <HTMLButtonElement>document.getElementById("upload-file-btn");
    //let fileInput = <HTMLInputElement>document.getElementById("fileId");
    //uploadFileBtn.onclick = () => {
    //    fileInput.click();
    //}
    //fileInput.onchange = (e) => {
    //    var file = (<HTMLInputElement>e.target).files[0];
    //    if (!file) {
    //        return;
    //    }
    //    var reader = new FileReader();
    //    reader.onload = (e) => {
    //        var contents = new Uint8Array(<ArrayBuffer>e.target.result);
    //        app.sendFile(file.name, contents);
    //        alert(`You've sent ${file.name} to the channel!`);
    //    };
    //    reader.readAsArrayBuffer(file);
    //}
    // </File Transfer>
	
	// <broadcast>
    //let broadcastBtn = <HTMLButtonElement>document.getElementById("broadcast-btn");
    //let receiveBtn = <HTMLButtonElement>document.getElementById("receive-btn");
    //broadcastBtn.onclick = () => startAs(new HelloWorld.Broadcaster());
    //receiveBtn.onclick = () => startAs(new HelloWorld.Receiver());
    //function startAs(participant: HelloWorld.Participant) {
    //    participant.start().then(() => {
    //        participant.joinAsync().then(() => {
    //            joinBtn.disabled = true;
    //            broadcastBtn.disabled = true;
    //            receiveBtn.disabled = true;
    //        });
    //    });
    //}
    // </broadcast>

	// <Muting Streams>
    //let muteAudioBtn = <HTMLButtonElement>document.getElementById("mute-audio-btn");
    //let muteVideoBtn = <HTMLButtonElement>document.getElementById("mute-video-btn");
    //muteAudioBtn.onclick = () => {
    //    app.toggleMuteLocalAudio().then(() => {
    //        muteAudioBtn.innerText = (app.localMedia.getAudioMuted()) ? "Unmute Audio" : "Mute Audio";
    //    });
    //};
    //muteVideoBtn.onclick = () => {
    //    app.toggleMuteLocalVideo().then(() => {
    //        muteVideoBtn.innerText = (app.localMedia.getVideoMuted()) ? "Unmute Video" : "Mute Video";
    //    });
    //};
    //let disableRemoteAudioBtn = <HTMLButtonElement>document.getElementById("disable-remote-audio-btn");
    //let disableRemoteVideoBtn = <HTMLButtonElement>document.getElementById("disable-remote-video-btn");
    //disableRemoteAudioBtn.onclick = () => {
    //    app.toggleDisableRemoteAudio();
    //    disableRemoteAudioBtn.innerText = (disableRemoteAudioBtn.innerText.indexOf("Disable") !== -1) ? "Enable Remote Audio" : "Disable Remote Audio";
    //};
    //disableRemoteVideoBtn.onclick = () => {
    //    app.toggleDisableRemoteVideo();
    //    disableRemoteVideoBtn.innerText = (disableRemoteVideoBtn.innerText.indexOf("Disable") !== -1) ? "Enable Remote Video" : "Disable Remote Video";
    //};
	// <Muting Streams>
	
    function loadInputs() {
		// <Change Devices>
        //app.getAudioInputs().then((audioInputs) => {
        //    let selectBox = <HTMLSelectElement>document.getElementById("audioInputs");
        //    for (const input of audioInputs) {
        //        let option = document.createElement("option");
        //        option.text = input.getName();
        //        selectBox.add(option);
        //    }
        //    selectBox.onchange = () => app.setAudioInput(audioInputs[selectBox.selectedIndex]);
        //});
        //app.getVideoInputs().then((videoInputs) => {
        //    let selectBox = <HTMLSelectElement>document.getElementById("videoInputs");
        //    for (const input of videoInputs) {
        //        let option = document.createElement("option");
        //        option.text = input.getName();
        //        selectBox.add(option);
        //    }
        //    selectBox.onchange = () => app.setVideoInput(videoInputs[selectBox.selectedIndex]);
        //});
        //app.getAudioOutputs().then((audioOutputs) => {
        //    let selectBox = <HTMLSelectElement>document.getElementById("audioOutputs");
        //    for (const output of audioOutputs) {
        //        let option = document.createElement("option");
        //        option.text = output.getName();
        //        selectBox.add(option);
        //    }
        //    selectBox.onchange = () => app.setAudioOutput(audioOutputs[selectBox.selectedIndex]);
        //});
		// </Change Devices>
    }
    function clearInputs() {
        removeOptions(<HTMLSelectElement>document.getElementById("audioInputs"));
        removeOptions(<HTMLSelectElement>document.getElementById("videoInputs"));
        removeOptions(<HTMLSelectElement>document.getElementById("audioOutputs"));
    }
    function removeOptions(selectElement: HTMLSelectElement) {
        var i, L = selectElement.options.length - 1;
        for (i = L; i >= 0; i--) {
            selectElement.remove(i);
        }
    }
})();
