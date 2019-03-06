#!/bin/bash

if [ "$1" = "install" ]
then
    echo "Adding drivercam service to systemctl..."
    sudo cp drivercam.service /etc/systemd/system/drivercam.service
    sudo systemctl enable drivercam.service
    echo "Done."
elif [ "$1" = "start" ]
then
    echo "Starting drivercam service..."
    sudo systemctl start drivercam.service
elif [ "$1" = "stop" ]
then
    echo "Stopping drivercam service..."
    sudo systemctl stop drivercam.service
elif [ "$1" = "enable" ]
then
    echo "Enabling drivercam service to start on boot..."
    sudo systemctl enable drivercam.service
elif [ "$1" = "disable" ]
then
    echo "Disabling drivercam service from starting on boot..."
    sudo systemctl disable drivercam.service
elif [ "$1" = "uninstall" ]
then
    echo "Removing drivercam service from systemctl..."
    sudo systemctl stop drivercam.service
    sudo systemctl disable drivercam.service
    sudo rm -f /etc/systemd/system/drivercam.service
    sudo systemctl daemon-reload
elif [ "$1" = "help" ]
then
    echo ""
    echo "./service_manager.sh argument"
    echo ""
    echo "install - installs drivercam service and enables start on boot"
    echo "start - starts drivercam via systemctl (service must be installed)"
    echo "stop - stops drivercam via systemctl (service must be installed)"
    echo "enable - enables drivercam to start on boot (service must be installed)"
    echo "disable - disables drivercam from starting on boot (service must be installed)"
    echo "uninstall - completely removes drivercam service from systemctl"
    echo ""
else
    echo "Invalid option. Options are help, install, uninstall, enable, disable, start, stop."
fi