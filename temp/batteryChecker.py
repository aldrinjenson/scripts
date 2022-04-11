#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""Simple, efficient low battery monitor
By: Stephan Sokolow (deitarion/SSokolow)
Written for Guest2587 @ FreeNode
Released under the MIT license
Dependencies:
- python-gi
- gir1.2-upowerglib-1.0
- gir1.2-gstreamer-1.0
- gir1.2-gst-plugins-base-1.0
- python-notify2 (https://pypi.python.org/pypi/notify2/)
Based on:
- https://wiki.ubuntu.com/Novacut/GStreamer1.0#Using_GStreamer_1.0_from_Python
- http://tristanswork.blogspot.ca/2010/10/looping-playback-with-gstreamer.html
- https://lazka.github.io/pgi-docs/
- http://python-gtk-3-tutorial.readthedocs.org/en/latest/objects.html#watch-properties
"""

# Must be the first non-docstring/comment and enables Python 3.x-like syntax
from __future__ import (absolute_import, division, print_function,
                        with_statement, unicode_literals)
import notify2
from gi.repository import GLib, Gst, UPowerGlib  # pylint: disable=E0611
import gi

__author__ = "Stephan Sokolow (deitarion/SSokolow)"
__license__ = "MIT"

CHECK_INTERVAL = 60  # seconds
SOUND_URI = 'file:///usr/share/sounds/freedesktop/stereo/phone-outgoing-busy.oga'
WARNING_LEVEL = 10

gi.require_version('Gst', '1.0')


class BatteryWatcher(object):
    """This represents the application as a whole"""

    def __init__(self, sound_uri,
                 warning_level=WARNING_LEVEL, check_interval=CHECK_INTERVAL):
        self.warn_level = warning_level

        # Create just one popup and reuse it for everything
        # (This way, we never show more than one at once and can close() it)
        self.popup = notify2.Notification("", "", "battery-caution")
        self.popup.set_urgency(notify2.URGENCY_CRITICAL)
        self.popup.set_timeout(notify2.EXPIRES_NEVER)

        # Set up the playback stuff for the alert sound
        self.pbin = Gst.ElementFactory.make('playbin', None)
        self.pbin.set_property("uri", sound_uri)
        self.pbin.get_bus().add_watch(GLib.PRIORITY_DEFAULT,
                                      self.restart_playback_cb, None)

        # Bind an event handler to battery charge changes
        try:
            self.upower = UPowerGlib.Client()
            self.battery = self.upower.get_display_device()

            # Register our battery-checking handler to be called repeatedly
            GLib.timeout_add_seconds(check_interval, self.check_battery)

            # ...and when the charging/discharging state changes
            self.battery.connect("notify::state", self.check_battery)
        except:
            self.alert_on("Battery Monitor Exiting!",
                          "Could not bind to UPower Display Device")
            raise

    def alert_on(self, title, message):
        """Update the alert and enable it if necessary"""
        self.popup.update(title, message)
        self.popup.show()
        self.pbin.set_state(Gst.State.PLAYING)

    def alert_off(self):
        """Reverse the effects of L{alert_on}"""
        self.popup.close()
        self.pbin.set_state(Gst.State.PAUSED)
        self._reset_playback_pos()

    def check_battery(self, *_):
        """Called by the main loop to check the battery status and alert"""

        remaining = self.battery.props.percentage
        batt_is_discharging = (
            self.battery.props.state == UPowerGlib.DeviceState.DISCHARGING)

        if remaining < self.warn_level and batt_is_discharging:
            self.alert_on("Low Battery!",
                          "Only %s%% remaining" % remaining)
        else:
            self.alert_off()
        return True  # You have to return True or it'll stop calling it

    def _reset_playback_pos(self):
        """Rewinds the sound so it's ready to be played again."""
        self.pbin.seek(1.0, Gst.Format.TIME, Gst.SeekFlags.FLUSH,
                       Gst.SeekType.SET, 0, Gst.SeekType.NONE, -1)

    def restart_playback_cb(self, bus, msg, data):
        """This gets called each time the state of playback changes"""
        if msg and msg.type == Gst.MessageType.EOS:  # EOS = End of Stream
            self._reset_playback_pos()
        return True  # You have to return True or it'll stop calling it


if __name__ == '__main__':
    Gst.init(None)
    notify2.init("battery_monitor.py")
    watcher = BatteryWatcher(SOUND_URI)

    print("Starting battery monitor. Press Ctrl+C to exit.")
    loop = GLib.MainLoop()
    watcher.check_battery()  # Don't wait CHECK_INTERVAL for the first check
    loop.run()
