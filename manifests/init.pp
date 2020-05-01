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
  Optional[String] $anon_umask                = undef,
  Optional[String] $anon_root                 = undef,
  Optional[Integer] $anon_max_rate            = undef,
  Optional[String] $ftp_username              = undef,
  Optional[Boolean] $guest_enable             = undef,
  Optional[String] $guest_username            = undef,
  Optional[String] $ftpd_banner               = undef,
  Optional[String] $banner_file               = undef,
  Optional[Boolean] $local_enable             = undef,
  Optional[Boolean] $download_enable          = undef,
  Optional[Boolean] $write_enable             = undef,
  Optional[String] $local_umask               = undef,
  Optional[Boolean] $chown_uploads            = undef,
  Optional[String] $chown_username            = undef,
  Optional[Boolean] $dirmessage_enable        = undef,
  Optional[Boolean] $delete_failed_uploads    = undef,
  Optional[Boolean] $xferlog_enable           = undef,
  Optional[String] $xferlog_file              = undef,
  Optional[Boolean] $connect_from_port_20     = undef,
  Optional[Boolean] $xferlog_std_format       = undef,
  Optional[Boolean] $chroot_local_user        = undef,
  Optional[Boolean] $chroot_list_enable       = undef,
  Optional[String] $chroot_list_file          = undef,
  Optional[Array[Vsftpd::Cmd]] $cmds_allowed  = undef,
  Optional[Array[Vsftpd::Cmd]] $cmds_denied   = undef,
  Optional[Array[String]] $deny_file          = undef,
  Optional[Array[String]] $hide_file          = undef,
  Optional[Boolean] $hide_ids                 = undef,
  Optional[String] $file_open_mode            = undef,
  Optional[Integer] $ftp_data_port            = undef,
  Optional[Boolean] $listen                   = undef,
  Optional[Boolean] $listen_ipv6              = undef,
  Optional[Integer] $listen_port              = undef,
  Optional[Integer] $local_max_rate           = undef,
  Optional[String] $pam_service_name          = undef,
  Optional[Boolean] $userlist_deny            = undef,
  Optional[Boolean] $userlist_enable          = undef,
  Optional[String] $userlist_file             = undef,
  Optional[String] $user_config_dir           = undef,
  Optional[Integer] $max_clients              = undef,
  Optional[Integer] $max_per_ip               = undef,
  Optional[Boolean] $syslog_enable            = undef,
  Optional[Boolean] $dual_log_enable          = undef,
  Optional[Boolean] $tcp_wrappers             = undef,
  Optional[Boolean] $use_localtime            = undef,
  Optional[String] $secure_chroot_dir         = undef,
  Optional[Boolean] $ascii_download_enable    = undef,
  Optional[Boolean] $ascii_upload_enable      = undef,
  Optional[String] $rsa_cert_file             = undef,
  Optional[String] $rsa_private_key_file      = undef,
  Optional[Boolean] $ssl_enable               = undef,
  Optional[Boolean] $allow_writeable_chroot   = undef,
  Optional[Boolean] $pasv_enable              = undef,
  Optional[Integer] $pasv_min_port            = undef,
  Optional[Integer] $pasv_max_port            = undef,
  Optional[String] $pasv_address              = undef,
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

  # check if "chown_username" is used without "chown_uploads"
  if ($chown_username != undef) and ($chown_uploads == false or $chown_uploads == undef) {
    fail('Cannot use "chown_username" without "chown_uploads" set to true')
  }


  # check these umask parameter for validity
  if $anon_umask != undef and ($anon_umask !~ /^[0-7]?[0-7][0-7][0-7]$/) {
    fail('umask must be an octal value. F.e. 0022')
  }
  if $local_umask != undef and ($local_umask !~ /^[0-7]?[0-7][0-7][0-7]$/) {
    fail('umask must be an octal value. F.e. 0022')
  }
  if $file_open_mode != undef and ($file_open_mode !~ /^[0-7][0-7][0-7][0-7]$/) {
    fail('file open mode must be an octal value. F.e. 0660')
  }

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
