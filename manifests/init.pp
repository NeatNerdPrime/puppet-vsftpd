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

  Optional[Boolean] $anonymous_enable         = undef,
  Optional[Boolean] $anon_mkdir_write_enable  = undef,
  Optional[Boolean] $anon_other_write_enable  = undef,
  Optional[Boolean] $anon_world_readable_only = undef,
  $anon_umask                                 = undef,
  $anon_root                                  = undef,
  $ftp_username                               = undef,
  Optional[Boolean] $guest_enable             = undef,
  $guest_username                             = undef,
  $ftpd_banner                                = undef,
  $banner_file                                = undef,
  Optional[Boolean] $local_enable             = undef,
  Optional[Boolean] $download_enable          = undef,
  Optional[Boolean] $write_enable             = undef,
  $local_umask                                = undef,
  Optional[Boolean] $chown_uploads            = undef,
  $chown_username                             = undef,
  Optional[Boolean] $dirmessage_enable        = undef,
  Optional[Boolean] $delete_failed_uploads    = undef,
  Optional[Boolean] $xferlog_enable           = undef,
  Optional[Boolean] $connect_from_port_20     = undef,
  $xferlog_std_format                         = undef,
  Optional[Boolean] $chroot_local_user        = undef,
  Optional[Boolean] $chroot_list_enable       = undef,
  $chroot_list_file                           = undef,
  $cmds_allowed                               = undef,
  $cmds_denied                                = undef,
  $deny_file                                  = undef,
  $hide_file                                  = undef,
  Optional[Boolean] $hide_ids                 = undef,
  $file_open_mode                             = undef,
  $ftp_data_port                              = undef,
  Optional[Boolean] $listen                   = undef,
  Optional[Boolean] $listen_ipv6              = undef,
  $listen_port                                = undef,
  $local_max_rate                             = undef,
  $pam_service_name                           = undef,
  Optional[Boolean] $userlist_deny            = undef,
  Optional[Boolean] $userlist_enable          = undef,
  $userlist_file                              = undef,
  $user_config_dir                            = undef,
  Optional[Integer] $max_clients              = undef,
  Optional[Integer] $max_per_ip               = undef,
  Optional[Boolean] $syslog_enable            = undef,
  Optional[Boolean] $dual_log_enable          = undef,
  Optional[Boolean] $tcp_wrappers             = undef,
  Optional[Boolean] $use_localtime            = undef,
  $secure_chroot_dir                          = undef,
  Optional[Boolean] $ascii_download_enable    = undef,
  Optional[Boolean] $ascii_upload_enable      = undef,
  $rsa_cert_file                              = undef,
  $rsa_private_key_file                       = undef,
  Optional[Boolean] $ssl_enable               = undef,
  Optional[Boolean] $allow_writeable_chroot   = undef,
  Optional[Boolean] $pasv_enable              = undef,
  $pasv_min_port                              = undef,
  $pasv_max_port                              = undef,
  $pasv_address                               = undef,
  Optional[Boolean] $allow_anon_ssl           = undef,
  Optional[Boolean] $force_local_data_ssl     = undef,
  Optional[Boolean] $force_local_logins_ssl   = undef,
  Optional[Boolean] $ssl_tlsv1                = undef,
  Optional[Boolean] $ssl_sslv2                = undef,
  Optional[Boolean] $ssl_sslv3                = undef,
  Optional[Boolean] $require_ssl_reuse        = undef,
  $ssl_ciphers                                = undef,
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
