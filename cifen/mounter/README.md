# Disk image mount tools

## cifen_policyapp

A mount policy appindicator that can be used to set the state of the system mount policy (read only or read write) by installing or removing rbfstab (enabling or disabling custom control of fstab.

Appindicators are no longer officially supported in Ubuntu / GNOME, and the functionality of this tool will (eventually) be shifted to a standalone desktop application.

## cifen_mounter

A standalone mount GUI with extremely simple functionality - allowing users to select and mount devices according to the current system policy. This app is not useful without cifen_policyapp.
