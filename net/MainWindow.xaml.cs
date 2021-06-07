using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using FM.LiveSwitch;

namespace HelloWorld
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        // <AppInstance>
        private readonly HelloWorldLogic _App;
        // </AppInstance>
		// <Broadcaster>
        //private Participant _Client;
		// </Broadcaster>

        public MainWindow()
        {
            // <AppInstance>
            this.DataContext = HelloWorldLogic.Instance;
            this._App = HelloWorldLogic.Instance;
            // </AppInstance>

            _App.DisplayMessage = (msg) =>
            {
                this.Dispatcher.Invoke(() =>
                {
                    this.textContainer.AppendText(msg + '\n');
                });
            };

            _App.SaveFile = (fileName, dataBytes) =>
            {              
            //    Thread thread = new Thread(() =>
            //    {
            //        this.Dispatcher.Invoke(() =>
            //        {
            //            var result = MessageBox.Show($"You've received a file from this channel, do you wish to download {fileName}?", "Download File", MessageBoxButton.YesNo, MessageBoxImage.Question);
            //            if (result == MessageBoxResult.Yes)
            //            {
            //                PromptSaveFile(fileName, dataBytes);
            //            }
            //        });
            //    });
            //    thread.Start();
            //};
               
            };

            InitializeComponent();
        }

        // Where we should stop our app, which is hooked on our xaml
        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            // <Unregistered>
            // _App.LeaveAsync()?.Fail((ex) =>
            // {
            //     Log.Error("Failed to leave conference.");
            //     Alert(ex.Message);
            // });
            // </Unregistered>

            // <Stop Local Media>
            // if (_App.LocalMedia != null)
            // {
            //     _App.StopLocalMedia().Then(p =>
            //     {
            //         Log.Info("Successfully stopped local media.");
            //     }).Fail((ex) =>
            //     {
            //         Log.Error("Could not stop local media.");
            //         Alert(ex.Message);
            //     });
            // }
            // </Stop Local Media>
			
			// <Broadcaster>
            // if (_Client != null)
            // {
            //     _Client.Stop();
            // }
			// </Broadcaster>
            
        }

        private void SendMessage_Click(object sender, RoutedEventArgs e)
        {
            // <Text Chat>
            // TextBox inputBox = this.inputbox;
            // _App.SendMessage(inputBox.Text);
            // inputBox.Clear();
            // </Text Chat>
        }

        private void UploadFile_Click(object sender, RoutedEventArgs e)
        {
            // <FileTransfer>
            // Microsoft.Win32.OpenFileDialog openFileDialog = new Microsoft.Win32.OpenFileDialog();

            // if (openFileDialog.ShowDialog() == true)
            // {
            //     var filePath = openFileDialog.FileName;
            //     var fileInfo = new FileInfo(filePath);
            //     var fileBytes = File.ReadAllBytes(filePath);
            //     _App.SendFile(fileInfo.Name, fileBytes);
            //     MessageBox.Show($"You've sent {fileInfo.Name} to the channel!");
            // }
            // </FileTransfer>
        }

        private void PromptSaveFile(string fileName, byte[] dataBytes)
        {
            
            string[] tokens = fileName.Split('.');
            fileName = tokens[0];
            for (var i = 1; i < tokens.Length - 1; i++)
            {
                fileName += $".{tokens[i]}";
            }
            string fileExtension = (tokens.Length <= 1) ? "*" : tokens[tokens.Length - 1];

            this.Dispatcher.Invoke(() =>
            {
                System.Windows.Forms.SaveFileDialog saveFileDialog = new System.Windows.Forms.SaveFileDialog();

                saveFileDialog.OverwritePrompt = true;
                saveFileDialog.FileName = fileName;
                saveFileDialog.DefaultExt = fileExtension;
                saveFileDialog.Filter = $"{fileExtension} files (*.{fileExtension})|*.{fileExtension}|All files (*.*)|*.*";

                if (saveFileDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                {
                    using (System.IO.Stream fileStream = saveFileDialog.OpenFile())
                    {
                        fileStream.Write(dataBytes, 0, dataBytes.Length);
                    }
                }
            });
            
        }

        private void Join_Click(object sender, RoutedEventArgs e)
        {
            // <Start Local Media>
            // _App.StartLocalMedia(this).Then((result) =>
            // {
            //     LoadInputs();

            // </Start Local Media>
            // <Joining>
            _App.JoinAsync().Then((res) => {
                Dispatcher.Invoke(() =>
                {
                    join.Visibility = Visibility.Collapsed;
                    leave.Visibility = Visibility.Visible;
                });
            });
            // <Joining>
            // <Start Local Media>
            // }, (ex) =>
            //     {
            //         Log.Info("Could not start local media.");
            //         Alert(ex.Message);
            //     }
            // ).Fail((ex) =>
            // {
            //     Log.Error("Could not join conference.");
            //     Alert(ex.Message);
            // });
            // </Start Local Media>
        }

        private void Leave_Click(object sender, RoutedEventArgs e)
        {
            // <Unregistered>
            // _App.LeaveAsync().Then((result) => {
            //     Dispatcher.Invoke(() =>
            //     {
            //         ClearInputs();
            //         join.Visibility = Visibility.Visible;
            //         leave.Visibility = Visibility.Collapsed;
            //     });
            // }).Fail((ex) =>
            // {
            //     Log.Error("Failed to leave conference.");
            //     Alert(ex.Message);
            // });
            // </Unregistered>

            // <Stop Local Media>
            // if (_App.LocalMedia != null)
            // {
            //     _App.StopLocalMedia().Then(p =>
            //     {
            //         Log.Info("Successfully stopped local media.");
            //     }).Fail((ex) =>
            //     {
            //         Log.Error("Could not stop local media.");
            //         Alert(ex.Message);
            //     });
            // }
            // </Stop Local Media>
        }

        private void JoinReceive_Click(object sender, RoutedEventArgs e)
        {
            // <Broadcaster>
            // _Client = Receiver.Instance();
            // _Client.Start(this).Then((result) =>
            // {
            //     _Client.JoinAsync();
            // }).Fail((ex) =>
            // {
            //     Log.Error("Unable to start Client.");
            //     Alert(ex.Message);
            // });
            // </Broadcaster>
        }

        private void JoinBroadcast_Click(object sender, RoutedEventArgs e)
        {
            // <Receiver>
            // _Client = Broadcaster.Instance();
            // _Client.Start(this).Then((result) =>
            // {
            //     _Client.JoinAsync();
            // }).Fail((ex) =>
            // {
            //     Log.Error("Unable to start Client.");
            //     Alert(ex.Message);
            // });
            // </Receiver>
        }

        private void ToggleScreenShare_Click(object sender, RoutedEventArgs e)
        {
            // <ScreenShare>
            //_App.ToggleScreenShare();
            // </ScreenShare>
        }

        private void MuteAudio_Click(object sender, RoutedEventArgs e)
        {
            // <Mute Streams>
            // _App.ToggleMuteLocalAudio().Then((r) => {
            //     this.Dispatcher.Invoke(() =>
            //     {
            //         this.muteAudio.Content = (_App.LocalMedia.AudioMuted) ? "Unmute Audio" : "Mute Audio";
            //     });
            // });
            // </Mute Streams>
        }

        private void MuteVideo_Click(object sender, RoutedEventArgs e)
        {
            // <Mute Streams>
            // _App.ToggleMuteLocalVideo().Then((r) => {
            //     this.Dispatcher.Invoke(() =>
            //     {
            //         this.muteVideo.Content = (_App.LocalMedia.VideoMuted) ? "Unmute Video" : "Mute Video";
            //     });
            // });
            // </Mute Streams>
        }

        private void DisableRemoteAudio_Click(object sender, RoutedEventArgs e)
        {
            // <Mute Stream>
            // _App.ToggleDisableRemoteAudio();
            // this.disableRemoteAudio.Content = (this.disableRemoteAudio.Content.ToString().Contains("Disable")) ? "Enable Remote Audio" : "Disable Remote Audio";
            // </Mute Stream>
        }

        private void DisableRemoteVideo_Click(object sender, RoutedEventArgs e)
        {
            // <Mute Stream>
            // _App.ToggleDisableRemoteVideo();
            // this.disableRemoteVideo.Content = (this.disableRemoteVideo.Content.ToString().Contains("Disable")) ? "Enable Remote Video" : "Disable Remote Video";
            // </Mute Stream>
        }

        private void AudioInputs_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // <Change Devices>
            // var audioInput = (sender as ComboBox).SelectedItem as SourceInput;
            // if (audioInput != null && audioInput.Id != _App.LocalMedia.AudioSourceInput.Id)
            // {
            //     _App.SetAudioSourceInput(audioInput);
            // }
            // </Change Devices>
        }

        private void VideoInputs_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // <Change Devices>
            // var videoInput = (sender as ComboBox).SelectedItem as SourceInput;
            // if (videoInput != null && videoInput.Id != _App.LocalMedia.VideoSourceInput.Id)
            // {
            //     _App.SetVideoSourceInput(videoInput);
            // }
            // </Change Devices>
        }

        private void AudioOutputs_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // <Change Devices>
            // var audioOutput = (sender as ComboBox).SelectedItem as SinkOutput;
            // _App.SetAudioSourceOutput(audioOutput);
            // </Change Devices>
        }

        private void LoadInputs()
        {
            // <Change Devices>
            // _App.GetAudioInputs().Then((AudioInputs) =>
            // {
            //     foreach (SourceInput input in AudioInputs)
            //     {
            //         this.Dispatcher.Invoke(() =>
            //         {
            //             this.audioInputs.Items.Add(input);
            //         });
            //     }
            //     this.Dispatcher.Invoke(() => this.audioInputs.SelectedIndex = 0);
            // });
            // _App.GetVideoInputs().Then((VideoInputs) =>
            // {
            //     foreach (SourceInput input in VideoInputs)
            //     {
            //         this.Dispatcher.Invoke(() =>
            //         {
            //             this.videoInputs.Items.Add(input);
            //         });
            //     }
            //     this.Dispatcher.Invoke(() => this.videoInputs.SelectedIndex = 0);
            // });
            // this.Dispatcher.Invoke(() =>
            // {
            //     _App.GetAudioOutputs().Then((AudioOutputs) =>
            //     {
            //         foreach (SinkOutput output in AudioOutputs)
            //         {
            //             this.Dispatcher.Invoke(() =>
            //             {
            //                 this.audioOutputs.Items.Add(output);
            //             });
            //         }
            //     });
            //     this.Dispatcher.Invoke(() => this.audioOutputs.SelectedIndex = 0);
            // });
            // </Change Devices>
        }

        private void ClearInputs()
        {
            // <Change Devices>
            // this.audioInputs.Items.Clear();
            // this.videoInputs.Items.Clear();
            // this.audioOutputs.Items.Clear();
            // </Change Devices>
        }
        public void Alert(string format, params object[] args)
        {
            Dispatcher.Invoke(new Action(() =>
            {
                MessageBox.Show(string.Format(format, args));
            }));
        }
    }
}
