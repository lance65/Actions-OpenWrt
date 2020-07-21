## Instructions

The previous automatic compilation and personalized customization are all derived from the [code](https://github.com/P3TERX/Actions-OpenWrt) and [tutorial](https://p3terx.com/archives/ build-openwrt-with-github-actions.html). </br>
Here only talk about the release method, part of the code borrows or uses [id77](https://github.com/id77/OpenWrt-K2P-firmware) and [ncipollo](https://github.com/ncipollo/release- action) Two great gods:</br>
 1. Automatic compilation and automatic publishing. You can also use this warehouse template. Please click Use this template above to create your own new warehouse. </br>
 2. Click your avatar-settings-Developer settings-Personal access tokens in the upper right corner to generate a new token, select public_repo, name it and save it, and copy the token content at the same time. </br>
 3. Go back to the new warehouse just built, settings-Secrets-Add a new secret, name it RELEASES_TOKEN, paste the token you just copied into it and save it. </br>
 4. The timing of timing compilation and the method of triggering automatic compilation are all explained in the P3TERX tutorial above. </br>
 5. The most critical step, because I have added a WeChat message reminder to start compilation and successful compilation, so in addition to the above steps, I also need to send serverchan (WeChat push)</br>
 Save the token in the secret, named ServerChan. It is the same as the method of adding the key in the third step above, otherwise this step is missing, and the compilation is due to WeChat push at the beginning</br>
 Failed to find the token. Or cancel the WeChat push and comment out the code that starts and ends in the yml file (a total of four lines of code). </br>
 
## Thanks

- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)   
- [id77](https://github.com/id77/OpenWrt-K2P-firmware)
- [Microsoft](https://www.microsoft.com)
- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub](https://github.com)
- [GitHub Actions](https://github.com/features/actions)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cisco](https://www.cisco.com/)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [ncipollo](https://github.com/ncipollo/release-action)
- [bin20088](https://github.com/bin20088)
