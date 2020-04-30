# == Class: vsftpd
#
# === Examples
#
#  class { vsftpd:
#    pam_service_name        => 'ftp',
#    pasv_enable             => 'YES',
#    pasv_min_port           => '1024',
#    pasv_max_port           => '1048',
#    pasv_address            => '127.0.0.1',
#  }
#
# === Authors
#
# Aneesh C <aneeshchandrasekharan@gmail.com>
# Philipp Seiler <p.seiler@linuxmail.org>
#

class vsftpd (
  String $package_name           = 'vsftpd',
  String $config_path            = $vsftpd::params::config_path,
  String $template               = 'vsftpd/configfile.erb',

  $anonymous_enable         = undef,
  $anon_mkdir_write_enable  = undef,
  $anon_other_write_enable  = undef,
  $anon_world_readable_only = undef,
  $anon_umask                    = undef,
  $anon_root                     = undef,
  $ftp_username                  = undef,
  $guest_enable             = undef,
  $guest_username                = undef,
  $ftpd_banner                   = undef,
  $banner_file                   = undef,
  $local_enable             = undef,
  $download_enable          = undef,
  $write_enable             = undef,
  $local_umask                   = undef,
  $chown_uploads            = undef,
  $chown_username                = undef,
  $dirmessage_enable        = undef,
  $delete_failed_uploads    = undef,
  $xferlog_enable           = undef,
  $connect_from_port_20     = undef,
  $xferlog_std_format            = undef,
  $chroot_local_user        = undef,
  $chroot_list_enable       = undef,
  $chroot_list_file              = undef,
  $cmds_allowed                  = undef,
  $cmds_denied                   = undef,
  $deny_file                     = undef,
  $hide_file                     = undef,
  $hide_ids                 = undef,
  $file_open_mode                = undef,
  $ftp_data_port                 = undef,
  $listen                   = undef,
  $listen_ipv6              = undef,
  $listen_port                   = undef,
  $local_max_rate                = undef,
  $pam_service_name              = undef,
  $userlist_deny            = undef,
  $userlist_enable          = undef,
  $userlist_file                 = undef,
  $user_config_dir               = undef,
  Integer $max_clients           = undef,
  $max_per_ip                    = undef,
  $syslog_enable            = undef,
  $dual_log_enable          = undef,
  $tcp_wrappers             = undef,
  $use_localtime            = undef,
  $secure_chroot_dir             = undef,
  $ascii_download_enable    = undef,
  $ascii_upload_enable      = undef,
  $rsa_cert_file                 = undef,
  $rsa_private_key_file          = undef,
  $ssl_enable               = undef,
  $allow_writeable_chroot   = undef,
  $pasv_enable              = undef,
  $pasv_min_port                 = undef,
  $pasv_max_port                 = undef,
  $pasv_address                  = undef,
  $allow_anon_ssl           = undef,
  $force_local_data_ssl     = undef,
  $force_local_logins_ssl   = undef,
  $ssl_tlsv1                = undef,
  $ssl_sslv2                = undef,
  $ssl_sslv3                = undef,
  $require_ssl_reuse        = undef,
  $ssl_ciphers                   = undef,
) inherits ::vsftpd::params {

  package { $package_name:
    ensure => installed,
  }

  ### FIXME file_open_mode check for input
  ### FIXME check for umask to be octal and check for input
  ### FIXME check if chown_uploads is true when using chown_username

  file { $config_path:
    ensure  => file,
    content => template($template),
    require => Package[$package_name],
  }
  if $::osfamily == 'RedHat' {
    service { 'vsftpd':
      require   => Package[$package_name],
      enable    => true,
      subscribe => File[$config_path],
    }
  }
}
