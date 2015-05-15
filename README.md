# Drawtastic
A Telephone Pictionary game using Swift! An experiment in the Apple Multipeer Connectivity Framework!

## How To Test On iOS Simulator
1. Run the app as normal from Xcode on a simulated device (Device A)
2. Stop running the app, switch to another simulated device (Device B) such that Device B != Device A
3. Run the app as normal from Xcode on Device B
4. Open Terminal, run the command: `cd /Applications/Xcode.app/Contents/Developer/Applications/`
5. Then run the command: `open -n iOS\ Simulator.app` to launch a second iOS Simulator
6. Dismiss the alert you get, it's not important
7. In the Hardware menu of the newly launched iOS Simulator (which currently only shows black), go to Device and choose whatever Device A was in the list
8. Launch the app in Device A
9. If done properly, Device B (running from Xcode's instance of iOS Simulator) and Device A (running from our own launched instance of iOS Simulator) should be showing up in each other's Player List

The basic idea is that you need to Build and Run the app in Xcode on every simulated device you plan on testing with. Once you've run it once on that device in Xcode, you are good to go (until you change the code, then you must re-build on every device again to test changes).

Because Player Names are simply the device names, both players are named "iPhone Simulator." You're just going to have to trust me that it's referring to the _other_ simulator and not itself. Fine, don't believe me? Have two of the devices you test with be an iPhone and an iPad. Then you'll see their names as "iPhone Simulator" and "iPad Simulator," respectively.

You are free to test this app with more than two simulators, but you cannot have any of the simulated devices be the same kind of device.


## License
Copyright (c) 2015 Andy Reyes

Still figuring out how I want to license Drawtastic.
For now: Do not steal!


Drawing Capabilities by César Pinto Castillo
https://github.com/JagCesar/Simple-Paint-App-iOS
The MIT License (MIT)
Copyright (c) 2012 César Pinto Castillo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


PeerKit by JP Simard
https://github.com/jpsim/PeerKit
The MIT License (MIT)
Copyright (c) 2014 JP Simard.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.