 #!/bin/bash
#run using sudo
#find free memory
(date && grep MemFree /proc/meminfo) >> ~/backup/freemem/free_mem.txt

#find disk statistics
(date && df -h) >> ~/backup/freedisk/freedisk.txt

#find open files
(date && lsof) >> ~/backup/openlist/openlist.txt

#find disk usage
(date && du -h) >> ~/backup/diskuse/diskuse.txt

