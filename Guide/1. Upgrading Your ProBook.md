Upgrading Your ProBook
----------------------

Before you begin it is recommended that you consider upgrading your ProBook as all of its off-the-shelf configurations are hopelessly outdated.

### SSD

Swapping the hard disk for a solid-state drive should be your first upgrade. This alone will massively increase performance and responsiveness of the whole system. Modern versions of macOS use APFS file system which is specifically designed for solid-state drives. Although you can install macOS on a HDD, the performance penalty would likely be too high. Install a minimum of 256 GB SATA SSD drive, preferably with DRAM cache. 128 GB can be enough for very light use. Larger drive will allow for multiple operating systems in a dual-boot configuration.

### RAM

It is highly recommended that you install at least 8 GB of RAM. This is the minimum amount required for macOS to operate smoothly. ProBooks based on Sandy Bridge CPUs use DDR3 RAM which, thankfully, isn’t much affected by RAM crisis and can still be found for cheap.

### CPU

Although not strictly required, changing your processor to at least Core i5 with Turbo Boost, in case if you are stuck with Core i3, is a worthy consideration. You would want to disassemble your laptop anyway to clean it and change thermal paste, so why not upgrade CPU in the process? My personal CPU recommendation, however, would be a dual-core Core i7, namely [2.8 GHz 2640M](https://ark.intel.com/content/www/us/en/ark/products/53464/intel-core-i72640m-processor-4m-cache-up-to-3-50-ghz.html "Core i7-2640M") or 2.7 GHz 2620M (whichever you can still find). I would advice against quad-core 2670QM and especially 2760QM or higher for several reasons. For one, your laptop‘s power adapter might no longer provide enough juice for the whole system. Then, ProBook‘s mainboard doesn‘t possess VRM strong enough to properly feed power hungry quad-core i7 CPUs with TDP of 45W. Lastly, the cooling system is simply inadequate for a quad-core CPU: having just one short heat pipe.

Failure to observe these hardware restrictions will result in your CPU quickly overheating, not having Turbo Boost or not running even at its stock advertised speed, VRM running very hot, and laptop abruptly shutting down. And on top of all that, even the fastest 45W Core i7 CPU, – 2860QM, – is still whole 300 MHz slower on all cores than 35W 2640M, resulting in a noticeably lower single-thread performance. Taking power and thermal limits into account, a 2640M with two but powerful cores is just a better overall option. This is especially true when compared to 2670QM with its miserable (by modern standards) 2.2 GHz stock clock speed.

For reference, my dual-core Core i7-2640M with high-quality TIM applied hits **95** degrees under full continuous load (compilation of a big C/C++ project), – just a couple degrees shy of thermal throttling.

### Wi-Fi

Depending on a version of macOS you would choose to install, you might also need to change your wireless adapter to a compatible one. This is not going to be easy because ProBook 30s series suffer from a dreaded BIOS Wi-Fi whitelist. Luckily, there are workarounds.

Chances are you already have a compatible Atheros AR9285 adapter so you can just install Big Sur without bothering with hardware modding. If not, you can try installing a compatible Atheros card and [rebrand it](https://web.archive.org/web/20230315063103/https://www.tonymacx86.com/threads/rebranding-the-atheros-928x-cards-the-guide.115110/) to pass whitelist check.

However, at this point a much better alternative would be going for Broadcom BCM94352HMB module. Although it would need BIOS Wi-Fi whitelist [bypass hack](5.\ Broadcom\ Wireless.md#wi-fi-whitelist) and a [hardware mod](5.\ Broadcom\ Wireless.md#hardware-hack) on a card itself, it would allow you to bump installed macOS version to Monterey, which offers better compatibility with software.

Alternatively, Intel Wi-Fi modules have recently became a viable option with [itlwm](https://github.com/OpenIntelWireless/itlwm "macOS Intel wireless kexts"). Refer to GitHub project page for installation and configuration instructions for different macOS versions.

Whatever your choice of card would be, it must be of *half-size mini PCIe* form factor, *not M2*.

### Full HD Screen Upgrade for 15" Models

One of the coolest upgrades you can perform on ProBook 4530s is equipping it with higher quality full HD aftermarket LCD panel replacing ugly stock 1366x768 screen with poor color reproduction that it comes with. This upgrade is quite hard to perform as it requires full laptop disassembly, which is not easy at all on these old laptops, and you will also need a compatible dual-link LVDS LCD cable from 4730s, but the result is very much worth it. Some full HD screens with wider color gamut can completely transform how machine looks and feels.

The details of this upgrade are beyond the scope of this guide but you can find all necessary information on relevant hackintosh forums. If you do manage to install full HD screen, don’t forget to adjust iGPU device properties to enable dual-link operation or you will experience broken image.

Once you are done with upgrades it’s time to [start the installation process](../README.md#installation).
