Embedded Brummbeere on the Raspberry
====================================

.. image:: _static/img/brummbeere_raspi2.jpg
   :align: right

This tutorial shows how to build a custom embedded Linux for the Raspberry
that runs Die Brummbeere to play audio files from ownCloud. We use the
Qt Multimedia module and the Linux ALSA sound environment to play back the
files. This setup can be used to run any other Qt apps on the Raspberry,
of course. It is a general guide how to boot a minimal system with the latest
Qt library, including support for touchscreens, OpenGL and multimedia.

At the moment, this guide is for the Raspberry Pi 2 only, additional
explanations for Raspberry B(+) and A will follow soon. You need to run Linux
to compile your own embedded Linux with `buildroot <http://buildroot.net>`_.

As an example for a touchscreen we will use the Tontec 3,5" TFT. It comes with
a nice case that you can see on the picture above. The TFT is `available on
Amazon <http://www.amazon.de/gp/product/B00R13OAZ0/ref=as_li_tl?ie=UTF8&camp=1638&creative=6742&creativeASIN=B00R13OAZ0&linkCode=as2&tag=jsusde-21&linkId=VUAEOOODS63AMKTM>`_,
for example. It is easily connected to the Raspberry GPIO header and its drivers
are part of the Raspberry Linux distribution.


Prepare SD card
---------------

The SD card has to co be prepared with a certain partition layout in order
to be bootable on the Raspberry. The standard layout is a small FAT partition
and a larger ext4 partition in this order. The easiest way to get prepare the
card in this way is to install a standard Raspbian on the card. You can
find information about the process on the Raspberry download page:

https://www.raspberrypi.org/downloads/

Just follow the instructions given on the page under the ``Raspbian`` heading.


Optional: Use latest device tree overlays
.........................................

The latest Raspberry kernels and images support `device tree overlays
<https://www.raspberrypi.org/documentation/configuration/device-tree.md>`_ (DTO)
for specific hardware like TFT display with touch or audio card. The usage
of device trees makes support for different hardware easier, compared to
the configuration of device drivers via kernel modules. If you plan to use
a TFT touch screen (like the Tontec TFT) or an audio card (like Hifiberry)
you can enable the device trees for your hardware. The following example
enables the Tontec TFT with touch support and sets the correct default
resolution. As we will use the `EGLFS backend of Qt
<http://doc.qt.io/qt-5/embedded-linux.html>`_, we have to turn on HDMI
even if no screen is connected. The embedded system then uses `fbcp
<https://github.com/tasanakorn/rpi-fbcp>`_ to copy the current HDMI output to
the framebuffer of the TFT screen.

First we will update the DTOs of the Raspbian boot partition that was installed
in the previous step. Mount the partitions of your SD card and check that you
have a folder ``overlays``. We will replace it with the current firmware
overlays in the Raspberry GitHub repository. Download and unpack the firmware:

.. code-block:: sh

   $ wget https://github.com/raspberrypi/firmware/archive/master.zip
   $ unzip master.zip

In the folder ``firmware-master`` you will find the folder ``boot``, which
contains the latest firmwares, kernels and overlays. You can just copy the
full content of the ``boot`` folder to the boot partition of your SD card.
Choose to overwrite any existing files on the card. The buildroot system
will later overwrite the kernel of the boot partition with a self-compiled
version, the rest of the boot partition will stay as it is now.


Optional: Modify config.txt for hardware support
................................................

Next, we will enable the Tontec TFT touchscreen and set the correct resolution.
Open the file ``config.txt`` on the boot partition of you SD card and paste
the following content::

   dtoverlay=mz61581,rotate=0

   hdmi_cvt=320 480 50 2
   hdmi_group=2
   hdmi_mode=87
   hdmi_force_hotplug=1

The first line enables the device tree overlay for the TFT, including touch
support. The output is not rotated, so we get portrait mode.

The next 4 lines set a custom resolution (we need 320x480 pixels for the
Tontec screen) and force HDMI hotplug. We need the latter as we want to run
without any external display on HDMI, but still need HDMI enabled to get OpenGL
support in Qt and a framebuffer to copy the graphics output the TFT's
framebuffer.


Build Embedded Linux with Die Brummbeere
----------------------------------------

Download Raspberry tools
........................

git clone https://github.com/raspberrypi/tools.git


Buildroot configuration
.......................

$ git clone https://github.com/pbouda/brummbeere.git
$ cd brummbeere/raspi
$ git clone git://git.buildroot.net/buildroot


$ cd buildroot
$ make defconfig BR2_DEFCONFIG=../buildroot-config/brummbeereconfig.buildroot


Adding NTP daemon
.................

$ make busybox-menuconfig

Networking Utilities -> ntpd


Modify installrootfs.sh script
..............................


Add config file for ownCloud
............................


Start the build process
.......................

$ make