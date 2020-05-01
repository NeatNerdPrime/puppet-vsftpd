# vsftpd Module

## Overview

This module install and configure vsftpd ftp server.
Original module by [aneesh](https://github.com/aneesh-c/puppet-vsftpd). Forked by pseiler

## Usage

Default configuration:

```puppet
include vsftpd
```

Custom configuration:

```puppet
class { 'vsftpd':
    anonymous_enable         => false,
    anon_mkdir_write_enable  => false,
    anon_other_write_enable  => false,
    local_enable             => true,
    download_enable          => true,
    write_enable             => true,
    local_umask              => '022',
    dirmessage_enable        => true,
    xferlog_enable           => true,
    connect_from_port_20     => true,
    xferlog_std_format       => true,
    chroot_local_user        => true,
    chroot_list_enable       => true,
    file_open_mode           => '0666'
    ftp_data_port            => 20,
    listen                   => true,
    listen_ipv6              => false,
    listen_port              => 21,
    pam_service_name         => 'vsftpd',
    tcp_wrappers             => true,
    allow_writeable_chroot   => true,
    pasv_enable              => true,
    pasv_min_port            => 1024,
    pasv_max_port            => 1048,
    pasv_address             => '127.0.0.1',
}
```
Advanced Configuration

```puppet
    anon_umask               => '077',
    anon_root                => '/var/ftp/anonymous',
    anon_max_rate            => 0,
    ftpd_banner              => 'My custom banner',
    banner_file              => '/etc/vsftpd/my_banner.txt',
    max_clients              => 0,
    max_per_ip               => 0,
    ftp_username             => 'ftp',
    guest_enable             => false,
    guest_username           => 'ftp',
    anon_world_readable_only => false,
    ascii_download_enable    => false,
    ascii_upload_enable      => false,
    chown_uploads            => true,
    chown_username           => 'linux',
    chroot_list_file         => '/etc/vsftpd/my_chroot_list',
    secure_chroot_dir        => '/usr/share/empty',
    user_config_dir          => '/etc/vsftpd/user_config',
    userlist_deny            => true,
    userlist_enable          => true,
    userlist_file            => '/etc/vsftpd/my_userlist',
    delete_failed_uploads    => false,
    cmds_allowed             => ['PASV','RETR','QUIT'],
    cmds_denied              => ['PASV','RETR','QUIT'],
    deny_file                => ['*.mp3','*.mov','.private'],
    hide_file                => ['*.mp3','.hidden','hide*','h?'],
    syslog_enable            => false,
    dual_log_enable          => false,
    hide_ids                 => false,
    use_localtime            => false,
    local_max_rate           => 0,
```

SSL integration

```puppet
    rsa_cert_file           => '/etc/ssl/private/vsftpd.pem',
    rsa_private_key_file    => '/etc/ssl/private/vsftpd.pem',
    ssl_enable              => true,
    allow_anon_ssl          => false,
    force_local_data_ssl    => true,
    force_local_logins_ssl  => true,
    ssl_tlsv1               => true,
    ssl_sslv2               => false,
    ssl_sslv3               => false,
    require_ssl_reuse       => false,
    ssl_ciphers             => 'HIGH',
```
