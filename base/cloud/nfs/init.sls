include:
  - cloud.shadow

nfs-utils:
  pkg.installed

/home:
  mount.mounted:
    - device: salt:/home
    - mkmnt: True
    - fstype: nfs

/opt:
  mount.mounted:
    - device: salt:/opt
    - mkmnt: True
    - fstype: nfs


