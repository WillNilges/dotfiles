#!/bin/bash

systemctl --user mask --now plasma-kactivitymanagerd.service
systemctl --user mask --now plasma-kglobalaccel
systemctl --user mask --now plasma-krunner
systemctl --user mask --now plasma-kscreen
