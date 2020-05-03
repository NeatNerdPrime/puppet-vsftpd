# Class: vsftpd::params
#
# Defines all the variables used in the module.
#
class vsftpd::params {
  $config_path = $::osfamily ? {
    'Debian' => '/etc/vsftpd.conf',
    'Redhat' => '/etc/vsftpd/vsftpd.conf',
    'Suse'   => '/etc/vsftpd.conf',
    default  => undef,
  }
  $package_name = $::osfamily ? {
    'Debian' => 'vsftpd',
    'RedHat' => 'vsftpd',
    'Suse'   => 'vsftpd',
    default  => undef,
  }
  $service_name = $::osfamily ? {
    'Debian' => 'vsftpd',
    'RedHat' => 'vsftpd',
    'Suse'   => 'vsftpd',
    default  => undef,
  }

  $manage_service = true

  case $::osfamily {
    'Debian','RedHat','Suse': { }
    default: {
      fail("${::operatingsystem} not supported.")
    }
  }
}
