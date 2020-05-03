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
  String $package_name           = $vsftpd::params::package_name,
  String $config_path            = $vsftpd::params::config_path,
  Boolean $manage_service        = $vsftpd::params::manage_service,
  String $service_name           = $vsftpd::params::service_name,
  String $template               = 'vsftpd/configfile.erb',

  Optional[Boolean] $allow_anon_ssl             = undef,
  Optional[Boolean] $allow_root_squashed_chroot = undef,
  Optional[Boolean] $allow_writeable_chroot     = undef,
  Optional[Boolean] $anon_mkdir_write_enable    = undef,
  Optional[Boolean] $anon_other_write_enable    = undef,
  Optional[Boolean] $anon_upload_enable         = undef,
  Optional[Boolean] $anon_world_readable_only   = undef,
  Optional[Boolean] $anonymous_enable           = undef,
  Optional[Boolean] $ascii_download_enable      = undef,
  Optional[Boolean] $ascii_upload_enable        = undef,
  Optional[Boolean] $async_abor_enable          = undef,
  Optional[Boolean] $background                 = undef,
  Optional[Boolean] $check_shell                = undef,
  Optional[Boolean] $chmod_enable               = undef,
  Optional[Boolean] $chown_uploads              = undef,
  Optional[Boolean] $chroot_list_enable         = undef,
  Optional[Boolean] $chroot_local_user          = undef,
  Optional[Boolean] $connect_from_port_20       = undef,
  Optional[Boolean] $debug_ssl                  = undef,
  Optional[Boolean] $delete_failed_uploads      = undef,
  Optional[Boolean] $deny_email_enable          = undef,
  Optional[Boolean] $dirlist_enable             = undef,
  Optional[Boolean] $dirmessage_enable          = undef,
  Optional[Boolean] $download_enable            = undef,
  Optional[Boolean] $dual_log_enable            = undef,
  Optional[Boolean] $force_dot_files            = undef,
  Optional[Boolean] $force_anon_data_ssl        = undef,
  Optional[Boolean] $force_anon_logins_ssl      = undef,
  Optional[Boolean] $force_local_data_ssl       = undef,
  Optional[Boolean] $force_local_logins_ssl     = undef,
  Optional[Boolean] $guest_enable               = undef,
  Optional[Boolean] $hide_ids                   = undef,
  Optional[Boolean] $implicit_ssl               = undef,
  Optional[Boolean] $listen                     = undef,
  Optional[Boolean] $listen_ipv6                = undef,
  Optional[Boolean] $local_enable               = undef,
  Optional[Boolean] $lock_upload_files          = undef,
  Optional[Boolean] $log_ftp_protocol           = undef,
  Optional[Boolean] $ls_recurse_enable          = undef,
  Optional[Boolean] $mdtm_write                 = undef,
  Optional[Boolean] $no_anon_password           = undef,
  Optional[Boolean] $no_log_lock                = undef,
  Optional[Boolean] $one_process_model          = undef,
  Optional[Boolean] $passwd_chroot_enable       = undef,
  Optional[Boolean] $pasv_addr_resolve          = undef,
  Optional[Boolean] $pasv_enable                = undef,
  Optional[Boolean] $pasv_promiscuous           = undef,
  Optional[Boolean] $port_enable                = undef,
  Optional[Boolean] $port_promiscuous           = undef,
  Optional[Boolean] $require_cert               = undef,
  Optional[Boolean] $require_ssl_reuse          = undef,
  Optional[Boolean] $run_as_launching_user      = undef,
  Optional[Boolean] $secure_email_list_enable   = undef,
  Optional[Boolean] $session_support            = undef,
  Optional[Boolean] $setproctitle_enable        = undef,
  Optional[Boolean] $ssl_enable                 = undef,
  Optional[Boolean] $ssl_request_cert           = undef,
  Optional[Boolean] $ssl_sslv2                  = undef,
  Optional[Boolean] $ssl_sslv3                  = undef,
  Optional[Boolean] $ssl_tlsv1                  = undef,
  Optional[Boolean] $strict_ssl_read_eof        = undef,
  Optional[Boolean] $strict_ssl_write_shutdown  = undef,
  Optional[Boolean] $syslog_enable              = undef,
  Optional[Boolean] $tcp_wrappers               = undef,
  Optional[Boolean] $text_userdb_names          = undef,
  Optional[Boolean] $tilde_user_enable          = undef,
  Optional[Boolean] $use_localtime              = undef,
  Optional[Boolean] $use_sendfile               = undef,
  Optional[Boolean] $userlist_deny              = undef,
  Optional[Boolean] $userlist_enable            = undef,
  Optional[Boolean] $validate_cert              = undef,
  Optional[Boolean] $virtual_use_local_privs    = undef,
  Optional[Boolean] $write_enable               = undef,
  Optional[Boolean] $xferlog_enable             = undef,
  Optional[Boolean] $xferlog_std_format         = undef,

  Optional[Integer] $accept_timeout             = undef,
  Optional[Integer] $address_space_limit        = undef,
  Optional[Integer] $anon_max_rate              = undef,
  Optional[String] $anon_umask                  = undef,
  Optional[String] $chown_upload_mode           = undef,
  Optional[Integer] $connect_timeout            = undef,
  Optional[Integer] $data_connection_timeout    = undef,
  Optional[Integer] $delay_failed_login         = undef,
  Optional[Integer] $delay_successful_login     = undef,
  Optional[String] $file_open_mode              = undef,
  Optional[Integer] $ftp_data_port              = undef,
  Optional[Integer] $idle_session_timeout       = undef,
  Optional[Integer] $listen_port                = undef,
  Optional[Integer] $local_max_rate             = undef,
  Optional[String] $local_umask                 = undef,
  Optional[Integer] $max_clients                = undef,
  Optional[Integer] $max_login_fails            = undef,
  Optional[Integer] $max_per_ip                 = undef,
  Optional[Integer] $pasv_min_port              = undef,
  Optional[Integer] $pasv_max_port              = undef,
  Optional[Integer] $trans_chunk_size           = undef,

  Optional[String] $anon_root                   = undef,
  Optional[String] $banned_email_file           = undef,
  Optional[String] $banner_file                 = undef,
  Optional[String] $ca_certs_file               = undef,
  Optional[String] $chown_username              = undef,
  Optional[String] $chroot_list_file            = undef,
  Optional[Array[Vsftpd::Cmd]] $cmds_allowed    = undef,
  Optional[Array[Vsftpd::Cmd]] $cmds_denied     = undef,
  Optional[Array[String]] $deny_file            = undef,
  Optional[String] $dsa_cert_file               = undef,
  Optional[String] $dsa_private_key_file        = undef,
  Optional[String] $email_password_file         = undef,
  Optional[String] $ftp_username                = undef,
  Optional[String] $ftpd_banner                 = undef,
  Optional[String] $guest_username              = undef,
  Optional[Array[String]] $hide_file            = undef,
  Optional[String] $listen_address              = undef,
  Optional[String] $listen_address6             = undef,
  Optional[String] $local_root                  = undef,
  Optional[String] $message_file                = undef,
  Optional[String] $nopriv_user                 = undef,
  Optional[String] $pam_service_name            = undef,
  Optional[String] $pasv_address                = undef,
  Optional[String] $rsa_cert_file               = undef,
  Optional[String] $rsa_private_key_file        = undef,
  Optional[String] $secure_chroot_dir           = undef,
  Optional[String] $ssl_ciphers                 = undef,
  Optional[String] $user_config_dir             = undef,
  Optional[String] $user_sub_token              = undef,
  Optional[String] $userlist_file               = undef,
  Optional[String] $vsftpd_log_file             = undef,
  Optional[String] $xferlog_file                = undef,
) inherits ::vsftpd::params {

  package { $package_name:
    ensure => installed,
  }

  # check for parameters used without another parameter 
  if ($chown_username != undef) and ($chown_uploads == false or $chown_uploads == undef) {
    fail('Cannot use "chown_username" without "chown_uploads" set to true')
  }
  if ($message_file != undef) and ($dirmessage_enable == false or $dirmessage_enable == undef) {
    fail('Cannot use "message_file" without "dirmessage_enable" set to true')
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
  if $chown_upload_mode != undef and ($chown_upload_mode !~ /^[0-7][0-7][0-7][0-7]$/) {
    fail('chown upload mode must be an octal value. F.e. 0660')
  }

  file { $config_path:
    ensure  => file,
    content => template($template),
    require => Package[$package_name],
  }
  if $manage_service {
    service { $service_name:
      require   => Package[$package_name],
      enable    => true,
      subscribe => File[$config_path],
    }
  }
}
