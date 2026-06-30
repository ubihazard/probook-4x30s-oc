<p align="center"><img alt="ProBook 4x30s" src="Resources/probook-4530s-banner.png"/></p>
<h1 align="center">ProBook 4x30s OpenCore</h1>
<h3 align="center">4330s / 4530s / 4730s</h3>

Detailed instructions on how to install recent version of [macOS](https://en.wikipedia.org/wiki/MacOS) on HP ProBook 30s series laptops with second generation Sandy Bridge Intel Core i CPUs, – specifically, a [ProBook 4530s](https://support.hp.com/us-en/product/hp-probook-4530s-notebook-pc/5060880). This is also a long-overdue update to a previous guide posted here now with proper ACPI patches, important corrections and recommendations.

![macOS Installed on a ProBook 4530s](Resources/about-this-probook.png)

> [!IMPORTANT]
> An expanded [guide for 40s series laptops](https://github.com/ubihazard/probook-4x40s) with third generation Intel Ivy Bridge CPUs and Metal-capable graphics is now also available with much better support for modern macOS.

> [!NOTE]
> Some little [adjustments](#restoring-power-management) for your particular laptop[^1] still need to be made because ProBooks shipped with different processors. Therefore it is highly recommended that you read the official [install guide](https://dortania.github.io/OpenCore-Install-Guide/ "OpenCore install guide") first to get familiar with the process. That will make it much easier for you to adapt this guide for your needs.

Also note that only models with integrated Intel HD 3000 graphics are supported by this guide. Laptops with AMD GPUs require additional steps to [turn their discrete GPU off](3.\ ACPI\ Patching.md#disabling-dedicated-gpu), which is unsupported in macOS.

Despite effort was made to ensure all steps are as easy to follow and clear as possible, the process is not straightforward and a certain level of skill, experience with command line, patience, and ability to troubleshoot are a must. A complete OpenCore [EFI folder](https://github.com/ubihazard/probook-4x30s/releases/latest "Download") is available for your reference.

Introduction
------------

ProBook 4530s is an old laptop from Sandy Bridge era made by HP. With a handful of aftermarket upgrades it can still make a powerful machine for simple daily tasks. More importantly, even in stock condition it is fairly compatible with macOS. So this is what we are going to do – putting macOS on it by means of [OpenCore](https://github.com/acidanthera/OpenCorePkg) bootloader and a collection of kernel extensions made by talented individuals in hackintosh community.

So this is the configuration[^1] we are going to work with:

| **Name**     | Description
| ------------ | -----------
| **CPU**      | Intel Core i7-2640M
| **GPU**      | Intel HD 3000
| **RAM**      | 16 GB DDR3
| **SSD**      | 512 GB
| **Wireless** | Atheros AR9285
| **Ethernet** | Realtek RTL8111
| **USB 3.0**  | NEC Renesas uPD720200
| **Card reader** | JMicron JMB38X
| **Optical drive** | HP DVD-RW AD-7740H
| **macOS**    | Monterey 12.7.6
| **OpenCore** | [1.0.6-0cc8c81](https://github.com/ubihazard/OpenCorePkg-ProBook/releases/tag/v1.0.6-0cc8c81) for legacy ProBook
| **OCLP** | [2.4.1](https://github.com/dortania/OpenCore-Legacy-Patcher/releases/tag/2.4.1)

[^1]: Webcam works up to Mojave. USB 3.0 works up to Catalina. USB 2.0, Bluetooth and webcam need proper [USB port mapping](3.\ ACPI\ Patching.md#fixing-usb). SD card reader might have issues past Monterey.

Although this laptop is very old, macOS works surprisingly well on it with pretty much full compatibility. You can expect relatively smooth web browsing experience, word processing, and coding light projects in VS Code (nothing too demanding). Don‘t expect running XCode with iOS simulator on it though. It can also help you manage your iThings if you don‘t already have a Mac.

The guide has been split into several pages for easier consumption. So head over to next section and [let‘s start by upgrading your laptop](Guide/1.\ Getting\ Ready.md).

OpenCore for Legacy ProBook
---------------------------

This guide now uses a [custom build](https://github.com/ubihazard/OpenCorePkg-ProBook/releases) of OpenCore put together by me specifically for use with legacy ProBook laptops. It includes two EFI modules usable for ProBook 4x30s: BIOS fan reset and BIOS Wi-Fi whitelist bypass.

**Do not use these EFI modules with any other laptop other than ProBook 30s or 40s series. Doing so can brick your device!**

`ProBookFanReset.efi` is needed to reset fan control from macOS back to automatic BIOS control. It needs to be done every time after using quiet fan patch to restore embedded controller state, and the best place to do it is during boot up.

`ProBookWifiUnblock.efi` is necessary if you plan to install a [non-whitelisted] (5.\ Broadcom\ Wireless.md) (not approved by HP) Wi-Fi card in your ProBook 4x30s laptop. It *is not needed* for 4x40s because luckily, HP did not cripple 40s series laptops with a BIOS Wi-Fi whitelist (weird for HP).

Kernel Extensions
-----------------

Or “kexts” are equivalent of “drivers” in Windows and are required for proper hardware support by macOS. Most of the needed kernel extensions are already included in macOS, but the nature of hackintosh requires additional kexts to be added for unsupported (natively) network cards and some card readers. There isn‘t much more to say here: all required kexts are already assembled in one place in the provided [EFI OpenCore folder](https://github.com/ubihazard/probook-4x30s/releases/latest). Though you might need to disable some and enable others to adjust for your particular system in `Kernel/Add` section of included `config.plist`. This is done in the [post-install](4.\ Post-install.md) stage.

Converting from Clover
----------------------

Note that Clover and OpenCore don’t mix well together. In my experience a NVRAM reset is required when switching from Clover to OpenCore, or the kernel might panic with weird error message, – so make sure to perform it on your first OpenCore boot. The NVRAM reset can be performed from OpenCore boot screen: press space to reveal the corresponding menu entry.

Credits
-------

All credits go to @RehabMan, @chris1111, @acidanthera, @dortania, @moraea, and the rest of talented individuals who worked hard to make running macOS on regular PCs and unsupported hardware a reality.
