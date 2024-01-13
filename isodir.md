## Booting from a Windows 10 Enterprise LTSC Disk Instructions

1. **Insert the Windows 10 Disk**: Place your Windows 10 disk into the CD/DVD drive of your machine.

2. **Restart Your Computer**: If it's on, shut it down and then turn it back on.

3. **Access BIOS/UEFI Settings**: 
   - As soon as the computer starts, press `F12` to enter BIOS/UEFI settings.
   - Note: This key varies by manufacturer but is often one of the following: `F12`, `F10`, `F2`, `DEL`, or `ESC`.
   - You usually see a message like “Press [Key] to enter setup” at the bottom of the screen for a brief moment during startup.

4. **Change the Boot Order**:
   - Navigate to the boot order settings in BIOS/UEFI. This section might be named "Boot Order," "Boot Priority," or something similar.
   - Set the CD/DVD drive as the first boot device. This can usually be done by using the arrow keys to highlight the CD/DVD drive and then using keys like `+` or `-` to move it up the order.
  
5. **Change the SATA Mode Setting**:
   - In the BIOS/UEFI menu find the SATA Mode settings.  This is often found in tabs like "Storage Configuration", "Advanced", "SATA Configuration", or something similar.
   - Once you find the SATA mode settings, it will likely be set to RAID.  Change it to AHCI.

6. **Save and Exit**:
   - After changing the boot order and modifying the SATA mode, save the changes and exit the BIOS/UEFI. This is typically done by pressing `F10` or selecting the “Save and Exit” option.

7. **Boot from the Disk**:
   - Your computer should now restart and attempt to boot from the Windows 10 disk.
   - You might see a message like “Press any key to boot from CD or DVD.” Press a key to proceed.

8. **Follow Installation Prompts**:
   - After successfully booting from the disk, you should see the Windows 10 installation setup.
   - For Installation Type: select "Custom: Install Windows only (advanced)"
   - For Partition Selection: be carefull here.  You **don't** want to select any partitions that say ESP, WINRETOOLS, or DELLSUPPORT. Once you select the appropriate particion, it is recommended to delete first then create a new partition from its unallocated space and format it.  This ensures a clean installation. 
   - Continue following the prompts to install Windows 10.
  
9. **Troubleshooting**
   - If at step 9 you don't see any partitions, likely the SATS mode is set to RAID. You will need to change it to the appropriate mode for the partitions to be viewed.  
