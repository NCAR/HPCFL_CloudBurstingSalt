include:
  - cloud.nfs

munge:
  pkg.installed

munge-devel:
  pkg.installed

/etc/munge/munge.key:
  file:
    - managed
    - source: salt://cloud/slurm/munge.key
    - mode: 0400
    - owner: munge

for i in '/run/munge' '/var/log/munge' '/etc/munge/munge.key' '/etc/munge'; do chown munge:munge "$i"; done:
  cmd.run

for i in '/var/lib/munge'; do chown root:root "$i"; done:
  cmd.run

systemctl start munge:
  cmd.run

#perl-Data-Dumper:
#  pkg.installed

#autoconf:
#  pkg.installed

#automake:
#  pkg.installed

#libtool:
#  pkg.installed

#mariadb:
#  pkg.installed

#mariadb-devel:
#  pkg.installed

#libevent-devel:
#  pkg.installed

#flex:
#  pkg.installed

#/tmp/slurm-19-05-2-1.tar.gz:
#  file:
#    - managed
#    - source: salt://cloud/slurm/slurm-19-05-2-1.tar.gz
#    - mode: 400
#    - user: root
#    - group: root


#/tmp/installSlurm.sh:
#  file:
#    - managed
#    - source: salt://cloud/slurm/installSlurm.sh
#    - mode: 500
#    - user: root
#    - group: root

#bash /tmp/installSlurm.sh:
#  cmd.run

#rm -f /tmp/installSlurm.sh:
#  cmd.run

#/opt/slurm/19.05.2.1/etc:
#  file.directory:
#    - user: slurm
#    - group: slurm
#    - mode: 755

#/opt/slurm/19.05.2.1/etc/slurm.conf:
#  file:
#    - managed
#    - source: salt://cloud/slurm/slurm.conf
#    - mode: 0644
#    - owner: slurm
#    - group: slurm


#/opt/slurm/19.05.2.1/etc/cgroup.conf:
#  file:
#    - managed
#    - source: salt://cloud/slurm/cgroup.conf
#    - mode: 640
#    - owner: slurm
#    - group: slurm

printf 'PATH="/opt/slurm/latest/bin:/opt/slurm/latest/sbin:$PATH"' > /etc/profile.d/path.sh:
  cmd.run

/var/lib/slurm:
  file.directory:
    - user: slurm
    - group: slurm
    - mode: 755

/var/log/slurm:
  file.directory:
    - user: slurm
    - group: slurm
    - mode: 755

/usr/lib/systemd/system/slurmd.service:
  file:
    - managed
    - source: salt://cloud/slurm//slurmd.service
    - mode: 644
    - owner: root
    - group: root

systemctl daemon-reload:
  cmd.run

slurmd:
  service.running:
    - enable: True
    - reload: True

systemctl start slurmd:
  cmd.run

#/opt/slurm/latest/bin/scontrol update NodeName=

