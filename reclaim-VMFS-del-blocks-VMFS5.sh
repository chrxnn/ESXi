# https://kb.vmware.com/s/article/2057513
esxcli storage vmfs unmap -l MyDatastore
# esxcli storage vmfs unmap --volume-label=volume_label|--volume-uuid=volume_uuid --reclaim-unit=number
# The command takes these options:
# -l|--volume-label=volume_label
# The label of the VMFS volume to UNMAP. This is a mandatory argument. If you specify this argument, do not use -u|--volume-uuid=volume_uuid.
# -u|--volume-uuid=volume_uuid
# The UUID of the VMFS volume to UNMAP. This is a mandatory argument. If you specify this argument, do not use -l|--volume-label=volume_label.
# -n|--reclaim-unit=number
# The number of VMFS blocks to UNMAP per iteration. This is an optional argument. If it is not specified, the command uses a default value of 200.
