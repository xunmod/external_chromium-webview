# Prebuilt webview for android lollipop

Prebuilt WebViewGoogle apks grabbed from APKMIRROR based on version 95.0.4638.74(arm/arm64/x86)

## Usage
Add this line to `device.mk`:
```Makefile
$(call inherit-product-if-exists, external/chromium-webview/setup.mk)
```
Then build system will use prebuilt webview if `external/chromium-webview` exists.
