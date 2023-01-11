# Customed DWM Repo

* Forked from [dwm's official repo](git://git.suckless.org/dwm)
* Patches -> in folder `./patches`

Custom Settings
===============

* For **custom scripts**, we look for directory: `~/.dwm/scripts` as default choice. 
  * Change it by changing Macro `scripts_dir`:
```c
/* helper for using custom scripts stored in custom Locations */
#define scripts_dir ~/.dwm/scripts/               // Custom Location to store scripts
#define lock_script mylockscreen.sh               // Custom Scripts for lock screen
#define screenshot_script myscreenshotapi.sh      // Custom Scripts for screen shots
#define CONCAT(x,y) #x#y
#define CONCAT2(x,y) CONCAT(x,y)                  // Cache it, or '#' would obtain 'scripts_dir'(string) instead of its value
#define FULLPATH(x) CONCAT2(scripts_dir, x)
#define CUSTOM_SCRIPTS(cmd) SHCMD(FULLPATH(cmd))
```

* Rofi
   * Rofi configuration and `call_rofi.sh` are forked from `https://github.com/yaocccc/scripts`


---

dwm - dynamic window manager
============================
dwm is an extremely fast, small, and dynamic window manager for X.


Requirements
------------
In order to build dwm you need the Xlib header files.


Installation
------------
Edit config.mk to match your local setup (dwm is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install dwm (if
necessary as root):

    make clean install


Running dwm
-----------
Add the following line to your .xinitrc to start dwm using startx:

    exec dwm

In order to connect dwm to a specific display, make sure that
the DISPLAY environment variable is set correctly, e.g.:

    DISPLAY=foo.bar:1 exec dwm

(This will start dwm on display :1 of the host foo.bar.)

In order to display status info in the bar, you can do something
like this in your .xinitrc:

    while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
    do
    	sleep 1
    done &
    exec dwm


Configuration
-------------
The configuration of dwm is done by creating a custom config.h
and (re)compiling the source code.
