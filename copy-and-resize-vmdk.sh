# https://help.datto.com/s/article/KB206531773
## Mopy and move the datastore using vmkfstools
## vmkfstools(external link) is an ESXi command-line tool that you can use to manage virtual disks.
## To copy the datastore from the Datto appliance to a permanent datastore on VMware with thin disk provisioning, use the following command:

nohup vmkfstools -i /vmfs/volumes/[SourceDataStoreName]/[Volume].vmdk -d thin /vmfs/volumes/[DestinationDataStoreName]/[DriveLetter].vmdk
##    The SourceDataStoreName is the datastore you created, which references the NFS share on the Datto appliance.
##    The DestinationDataStoreName is the datastore on your environment to which the disk images will be copied. 

## Example (Windows):

nohup vmkfstools -i /vmfs/volumes/Datastore/C.vmdk -d thin /vmfs/volumes/HostStorage001/C.vmdk

## While not strictly required, the nohup at the beginning of the string is a supplemental command that tells the system not to stop the command once it has started, so the command will keep running until it's done, even if the user that started it logs out. This avoids having to start the full vmkfstools command all over again for the volume if the user's SSH connection gets interrupted or accidentally closed.

## Sometimes, the ESX console may return an "Enter a disk size which is larger than its original capacity" message after adding a thin-provisioned VMDK to a VM definition. This can be resolved by resizing the volume using vmkfstools from the ESX command line:vmkfstools -X <size>g <vmdk>

## Once the copy completes, proceed to the Cleanup section of this article to continue.


## Cleanup

# 1. When the transfer completes, access your vSphere environment. Create a new virtual machine or attach the transferred disks to an existing virtual machine as necessary.

# 2. Make sure that the machine's settings match the needs of your environment. Make any adjustments needed.

#    If your import process requires a VMX template, and the selected snapshot originated from a protected agentless system, you can find a copy of the virtual machine's configuration, as it existed at the time of the backup, in the Image Export files. The file is named configuration.vmx. Before using this file, Datto recommendsreviewing and updating its contents to ensure that the naming convention it uses, match your current production environment.
#    Attach the virtual machine's disks, starting withthe boot volume (in Windows this would be C.vmdk). and then any other applicable drives. 

# 3. Boot the virtual machine. Make sure that it boots to the Windows login screen. If the virtualization fails after the first attempt, try again with a different storage controller. If the issue persists, contact Datto Technical Support.

# 4. After confirming that the virtual machine functions as expected, return to the Export Image screen in your Datto appliance's GUI, and click Unmount to remove the shared clone.
