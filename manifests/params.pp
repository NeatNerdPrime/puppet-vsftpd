class vsftpd::params {
  if $::osfamily == 'RedHat' {
    $config_path = '/etc/vsftpd/vsftpd.conf'
  }
  elsif $::osfamily == 'Debian' {
    $config_path = '/etc/vsftpd.conf'
  }
  else {
    fail('Unsupported operating system')
  }
}
