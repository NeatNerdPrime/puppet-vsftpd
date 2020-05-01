# Changelog
## 8.0.0 (WIP)
* reworked module to use puppet booleans instead of 'YES'/'NO'
* a lot rspec tests added
* umasks in configuration file now being checked for validity
* allowed/denied ftp commands are now being checked for validity and are now an array
* deny\_file/hide\_file is now an array
* configuration file cleanup and generalizing
* Added support for the following configuration parameters
* * ``anon_max_rate``
## 7.0.3
* fixed breaking syntax mistake anon\_root in config template (thanks pingram3030)

## 7.0.2
* made module compatible with PDK

## 7.0.1
* configuration changes now restarts the vsftpd daemon if it's a RedHat based system
* changed project name, urls, etc. (upstream doesn't care about contributions)

## 7.0.0
* moved comments for configuration parameter into the if block of the config template
* Added support for the following configuration parameters
* * ``anon_mkdir_write_enable``
* * ``anon_other_write_enable``
* * ``download_enable``
* * ``chroot_list_enable``
* * ``file_open_mode``
* * ``ftp_data_port``
* * ``listen_port``
* * ``anon_umask``
* * ``anon_root``
* * ``ftpd_banner``
* * ``banner_file``
* * ``max_clients``
* * ``max_per_ip``
* * ``ftp_username``
* * ``guest_enable``
* * ``guest_username``
* * ``anon_world_readable_only``
* * ``ascii_download_enable``
* * ``ascii_upload_enable``
* * ``chown_uploads``
* * ``chown_username``
* * ``chroot_list_file``
* * ``secure_chroot_dir``
* * ``user_config_dir``
* * ``userlist_deny``
* * ``userlist_enable``
* * ``userlist_file``
* * ``delete_failed_uploads``
* * ``cmds_allowed``
* * ``cmds_denied``
* * ``deny_file``
* * ``hide_file``
* * ``syslog_enable``
* * ``dual_log_enable``
* * ``hide_ids``
* * ``use_localtime``
* * ``local_max_rate``
