require 'spec_helper'

describe 'vsftpd' do
  let(:title) { 'vsftpd_conf' }
  let(:node) { 'test.example.com' }

  context 'Test boolean parameters on RHEL' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'anonymous_enable'         => true,
        'anon_mkdir_write_enable'  => true,
        'anon_other_write_enable'  => true,
        'anon_world_readable_only' => true,
        'local_enable'             => true,
        'download_enable'          => true,
        'write_enable'             => true,
        'chown_uploads'            => true,
        'dirmessage_enable'        => true,
        'delete_failed_uploads'    => true,
        'xferlog_enable'           => true,
        'connect_from_port_20'     => true,
        'chroot_local_user'        => true,
        'chroot_list_enable'       => true,
        'hide_ids'                 => true,
        'listen'                   => true,
        'listen_ipv6'              => false,
        'userlist_deny'            => true,
        'userlist_enable'          => true,
        'syslog_enable'            => true,
        'dual_log_enable'          => true,
        'tcp_wrappers'             => true,
        'use_localtime'            => true,
        'ascii_download_enable'    => true,
        'ascii_upload_enable'      => true,
        'ssl_enable'               => true,
        'allow_writeable_chroot'   => true,
        'pasv_enable'              => true,
        'allow_anon_ssl'           => true,
        'force_local_data_ssl'     => true,
        'force_local_logins_ssl'   => true,
        'ssl_tlsv1'                => true,
        'ssl_sslv2'                => false,
        'ssl_sslv3'                => false,
        'require_ssl_reuse'        => true,
      }
    }

    # check if every boolean parameter works as expected
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^anonymous_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^anon_mkdir_write_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^anon_other_write_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^anon_world_readable_only=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^local_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^download_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^write_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^chown_uploads=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^dirmessage_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^delete_failed_uploads=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^xferlog_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^connect_from_port_20=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^chroot_local_user=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^chroot_list_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^hide_ids=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^listen=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^listen_ipv6=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^userlist_deny=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^userlist_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^syslog_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^dual_log_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^tcp_wrappers=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^use_localtime=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ascii_download_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ascii_upload_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ssl_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^allow_writeable_chroot=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^pasv_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^allow_anon_ssl=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^force_local_data_ssl=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^force_local_logins_ssl=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ssl_tlsv1=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ssl_sslv2=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ssl_sslv3=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^require_ssl_reuse=YES/) }
  end

  context 'Test for absent parameters on RHEL' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }

    it { is_expected.to contain_class('vsftpd::params') }
    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_package('vsftpd') }

    # check if every boolean parameter works as expected
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^anonymous_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^anon_mkdir_write_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^anon_other_write_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^anon_world_readable_only=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^local_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^download_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^write_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^chown_uploads=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^dirmessage_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^delete_failed_uploads=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^xferlog_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^connect_from_port_20=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^chroot_local_user=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^chroot_list_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^hide_ids=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^listen=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^listen_ipv6=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^userlist_deny=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^userlist_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^syslog_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^dual_log_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^tcp_wrappers=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^use_localtime=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ascii_download_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ascii_upload_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ssl_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^allow_writeable_chroot=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^pasv_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^allow_anon_ssl=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^force_local_data_ssl=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^force_local_logins_ssl=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ssl_tlsv1=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ssl_sslv2=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ssl_sslv3=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^require_ssl_reuse=/) }
  end

end
