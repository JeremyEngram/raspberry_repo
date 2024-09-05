#!/bin/bash

#!/bin/bash

# configure raspberry pi seven inch touch screen display for raspberry pi 4

# Backup the existing config.txt file
sudo cp /boot/config.txt /boot/config.txt.backup

# Echo new HDMI configuration to the config.txt file
sudo sed -i '/^hdmi_force_hotplug/d' /boot/config.txt
sudo sed -i '/^hdmi_group/d' /boot/config.txt
sudo sed -i '/^hdmi_mode/d' /boot/config.txt
sudo sed -i '/^hdmi_cvt/d' /boot/config.txt
sudo sed -i '/^hdmi_drive/d' /boot/config.txt

# Add new HDMI settings for 7" TFT screen
sudo bash -c "echo 'hdmi_force_hotplug=1' >> /boot/config.txt"
sudo bash -c "echo 'hdmi_group=2' >> /boot/config.txt"
sudo bash -c "echo 'hdmi_mode=87' >> /boot/config.txt"
sudo bash -c "echo 'hdmi_cvt=1024 600 60 6 0 0 0' >> /boot/config.txt"  # Change this line for different resolutions
sudo bash -c "echo 'hdmi_drive=1' >> /boot/config.txt"

echo "HDMI settings updated in /boot/config.txt. Rebooting now."

# Reboot the Raspberry Pi to apply the changes
sudo reboot
