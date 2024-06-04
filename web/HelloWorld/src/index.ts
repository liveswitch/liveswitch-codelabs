(() => {
    const app: HelloWorld.HelloWorldLogic = HelloWorld.HelloWorldLogic.getInstance();

    app.displayMessage = (msg: string) => {
        const textContainer: HTMLDivElement = document.getElementById("text-container") as HTMLDivElement;
        textContainer.appendChild(document.createTextNode(msg));
        textContainer.appendChild(document.createElement("br"));
    }

    app.saveFile = (fileName: string, data: Uint8Array) => {
        // Prompt the user to download the file.
        if (confirm(`You've received a file from this channel, do you wish to download ${fileName}?`) == true) {
            const file = new Blob([data]);
            if (window.navigator.msSaveOrOpenBlob) {
                // For IE.
                window.navigator.msSaveOrOpenBlob(file, fileName);
            } else {
                // For other browsers.
                const a: HTMLAnchorElement = document.createElement("a");
                const url: string = URL.createObjectURL(file);
                a.href = url;
                a.download = fileName;
                document.body.appendChild(a);
                a.click();
                setTimeout(() => {
                    document.body.removeChild(a);
                    window.URL.revokeObjectURL(url);
                }, 0);
            }
        }
    }
    
    
    const joinBtn: HTMLButtonElement = document.getElementById("join-btn") as HTMLButtonElement;
    const leaveBtn: HTMLButtonElement = document.getElementById("leave-btn") as HTMLButtonElement;

    joinBtn.onclick = () => {
        // <LocalMedia>
           //app.startLocalMedia().then(() => {
        // </LocalMedia>
            loadInputs();

            // Create and register the client.
            app.joinAsync().then(() => {
                joinBtn.style.display = "none";
                leaveBtn.style.display = "inline-block";
            });
        // <LocalMedia>
           //});
        // </LocalMedia>
    };

    leaveBtn.onclick = () => {
        // <LocalMedia>
           //app.stopLocalMedia().then(() => {
        // </LocalMedia>
        // <Unregister>             
            //app.leaveAsync().then(() => {
            //    clearInputs();
            //    joinBtn.style.display = "inline-block";
            //    leaveBtn.style.display = "none";
            //});
        // </Unregister>
         // <LocalMedia>
           //});
        // </LocalMedia>
    };
    
    	
    // <Share Screen>
    //const screenShareToggleBtn: HTMLButtonElement = document.getElementById("screenshare-toggle-btn") as HTMLButtonElement;
    //screenShareToggleBtn.onclick = () => app.toggleScreenSharing();
    //app.localScreenMedia.addOnVideoStarted(() => {
    //    app.localScreenMedia.getVideoTrack().addOnStopped(() => {
    //        app.toggleScreenSharing();
    //    });
    //})
    // </Share Screen>
	
	// <Text Chat>
    //const sendMessageBtn: HTMLButtonElement = document.getElementById("send-message-btn") as HTMLButtonElement;

    //sendMessageBtn.onclick = () => {
    //    const inputbox: HTMLButtonElement = document.getElementById("inputbox") as HTMLButtonElement;
    //    const msg: string = inputbox.value;
    //    if (msg != null && msg.length > 0) {
    //        inputbox.value = "";
    //        app.sendMessage(msg);
    //    }
    //}
    // </Text Chat>

	// <File Transfer>
    //const uploadFileBtn: HTMLButtonElement = document.getElementById("upload-file-btn") as HTMLButtonElement;
    //const fileInput: HTMLInputElement = document.getElementById("fileId") as HTMLInputElement;

    //uploadFileBtn.onclick = () => fileInput.click();

    //fileInput.onchange = (e) => {
    //    const file = (e.target as HTMLInputElement).files[0];
    //    if (!file) {
    //        return;
    //    }

    //    // Read the file to an array buffer and send it through the data channel.
    //    const reader = new FileReader();
    //    reader.onload = (e) => {
    //        const contents = new Uint8Array(e.target.result as ArrayBuffer);
    //        app.sendFile(file.name, contents);
    //        alert(`You've sent ${file.name} to the channel!`);
    //    };
    //    reader.readAsArrayBuffer(file);
    //}
    // </File Transfer>
	
	// <broadcast>
    //const broadcastBtn: HTMLButtonElement = document.getElementById("broadcast-btn") as HTMLButtonElement;
    //const receiveBtn: HTMLButtonElement = document.getElementById("receive-btn") as HTMLButtonElement;

    //broadcastBtn.onclick = () => startAs(new HelloWorld.Broadcaster());
    //receiveBtn.onclick = () => startAs(new HelloWorld.Receiver());

    //function startAs(participant: HelloWorld.Participant) {
    //    // Start capturing local media (broadcaster only).
    //    participant.start().then(() => {
    //        // Register and establish connection.
    //        participant.joinAsync().then(() => {
    //            joinBtn.disabled = true;
    //            broadcastBtn.disabled = true;
    //            receiveBtn.disabled = true;
    //        });
    //    });
    //}
    // </broadcast>

	// <Mute Streams>
    //const muteAudioBtn: HTMLButtonElement = document.getElementById("mute-audio-btn") as HTMLButtonElement;
    //const muteVideoBtn: HTMLButtonElement = document.getElementById("mute-video-btn") as HTMLButtonElement;

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

    //const disableRemoteAudioBtn: HTMLButtonElement = document.getElementById("disable-remote-audio-btn") as HTMLButtonElement;
    //const disableRemoteVideoBtn: HTMLButtonElement = document.getElementById("disable-remote-video-btn") as HTMLButtonElement;

    //disableRemoteAudioBtn.onclick = () => {
    //    app.toggleDisableRemoteAudio();
    //    disableRemoteAudioBtn.innerText = (disableRemoteAudioBtn.innerText.indexOf("Disable") !== -1) ? "Enable Remote Audio" : "Disable Remote Audio";
    //};

    //disableRemoteVideoBtn.onclick = () => {
    //    app.toggleDisableRemoteVideo();
    //    disableRemoteVideoBtn.innerText = (disableRemoteVideoBtn.innerText.indexOf("Disable") !== -1) ? "Enable Remote Video" : "Disable Remote Video";
    //};
	// <Mute Streams>
	
    function loadInputs() {
		// <Change Devices>
        //app.getAudioInputs().then(audioInputs => {
        //    const selectBox: HTMLSelectElement = document.getElementById("audioInputs") as HTMLSelectElement;
        //    for (const input of audioInputs) {
        //        const option: HTMLOptionElement = document.createElement("option");
        //        option.text = input.getName();
        //        selectBox.add(option);
        //    }
        //    selectBox.onchange = () => app.setAudioInput(audioInputs[selectBox.selectedIndex]);
        //});

        //app.getVideoInputs().then(videoInputs => {
        //    const selectBox: HTMLSelectElement = document.getElementById("videoInputs") as HTMLSelectElement;
        //    for (const input of videoInputs) {
        //        const option: HTMLOptionElement = document.createElement("option");
        //        option.text = input.getName();
        //        selectBox.add(option);
        //    }
        //    selectBox.onchange = () => app.setVideoInput(videoInputs[selectBox.selectedIndex]);
        //});

        //app.getAudioOutputs().then(audioOutputs => {
        //    const selectBox: HTMLSelectElement = document.getElementById("audioOutputs") as HTMLSelectElement;
        //    for (const output of audioOutputs) {
        //        const option: HTMLOptionElement = document.createElement("option");
        //        option.text = output.getName();
        //        selectBox.add(option);
        //    }
        //    selectBox.onchange = () => app.setAudioOutput(audioOutputs[selectBox.selectedIndex]);
        //});
		// </Change Devices>
    }
    function clearInputs() {
        // Remove the lists of available devices.
        removeOptions(document.getElementById("audioInputs") as HTMLSelectElement);
        removeOptions(document.getElementById("videoInputs") as HTMLSelectElement);
        removeOptions(document.getElementById("audioOutputs") as HTMLSelectElement);
    }

    function removeOptions(selectElement: HTMLSelectElement) {
        const length: number = selectElement.options.length - 1;
        for (let i = length; i >= 0; i--) {
            selectElement.remove(i);
        }
    }
})();
