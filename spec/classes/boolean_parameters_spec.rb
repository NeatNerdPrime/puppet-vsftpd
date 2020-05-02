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
        'anonymous_enable'           => true,
        'anon_mkdir_write_enable'    => true,
        'anon_other_write_enable'    => true,
        'anon_world_readable_only'   => true,
        'local_enable'               => true,
        'download_enable'            => true,
        'write_enable'               => true,
        'chown_uploads'              => true,
        'dirmessage_enable'          => true,
        'delete_failed_uploads'      => true,
        'xferlog_enable'             => true,
        'connect_from_port_20'       => true,
        'chroot_local_user'          => true,
        'chroot_list_enable'         => true,
        'hide_ids'                   => true,
        'listen'                     => true,
        'listen_ipv6'                => false,
        'userlist_deny'              => true,
        'userlist_enable'            => true,
        'syslog_enable'              => true,
        'dual_log_enable'            => true,
        'tcp_wrappers'               => true,
        'use_localtime'              => true,
        'ascii_download_enable'      => true,
        'ascii_upload_enable'        => true,
        'ssl_enable'                 => true,
        'allow_writeable_chroot'     => true,
        'pasv_enable'                => true,
        'allow_anon_ssl'             => true,
        'force_local_data_ssl'       => true,
        'force_local_logins_ssl'     => true,
        'ssl_tlsv1'                  => true,
        'ssl_sslv2'                  => false,
        'ssl_sslv3'                  => false,
        'require_ssl_reuse'          => true,
        'async_abor_enable'          => true,
        'xferlog_std_format'         => true,
        'allow_root_squashed_chroot' => false,
        'background'                 => false,
        'check_shell'                => false,
        'chmod_enable'               => true,
        'debug_ssl'                  => false,
        'deny_email_enable'          => false,
        'dirlist_enable'             => true,
        'force_dot_files'            => false,
        'force_anon_data_ssl'        => true,
        'force_anon_logins_ssl'      => true,
        'implicit_ssl'               => true,
        'lock_upload_files'          => true,
        'log_ftp_protocol'           => false,
        'ls_recurse_enable'          => false,
        'mdtm_write'                 => true,
        'no_anon_password'           => true,
        'no_log_lock'                => false,
        'one_process_model'          => false,
        'passwd_chroot_enable'       => false,
        'pasv_addr_resolve'          => true,
        'pasv_promiscuous'           => false,
        'port_enable'                => true,
        'port_promiscuous'           => false,
        'require_cert'               => true,
        'run_as_launching_user'      => false,
        'secure_email_list_enable'   => false,
        'session_support'            => false,
        'setproctitle_enable'        => false,
        'ssl_request_cert'           => true,
        'strict_ssl_read_eof'        => false,
        'strict_ssl_write_shutdown'  => false,
        'text_userdb_names'          => true,
        'tilde_user_enable'          => false,
        'use_sendfile'               => true,
        'validate_cert'              => true,
        'virtual_use_local_privs'    => false,
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
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^xferlog_std_format=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^async_abor_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^allow_root_squashed_chroot=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^background=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^check_shell=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^chmod_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^debug_ssl=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^deny_email_enable=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^dirlist_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^force_dot_files=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^force_anon_data_ssl=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^force_anon_logins_ssl=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^implicit_ssl=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^lock_upload_files=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^log_ftp_protocol=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ls_recurse_enable=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^mdtm_write=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^no_anon_password=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^no_log_lock=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^one_process_model=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^passwd_chroot_enable=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^pasv_addr_resolve=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^pasv_promiscuous=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^port_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^port_promiscuous=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^require_cert=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^run_as_launching_user=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^secure_email_list_enable=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^session_support=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^setproctitle_enable=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ssl_request_cert=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^strict_ssl_read_eof=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^strict_ssl_write_shutdown=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^text_userdb_names=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^tilde_user_enable=NO/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^use_sendfile=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^validate_cert=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^virtual_use_local_privs=NO/) }
  end

  context 'Test for absent parameters on RHEL' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }

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
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^xferlog_std_format=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^async_abor_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^allow_root_squashed_chroot=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^background=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^check_shell=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^chmod_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^debug_ssl=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^deny_email_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^dirlist_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^force_dot_files=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^force_anon_data_ssl=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^force_anon_logins_ssl=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^implicit_ssl=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^lock_upload_files=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^log_ftp_protocol=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ls_recurse_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^mdtm_write=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^no_anon_password=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^no_log_lock=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^one_process_model=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^passwd_chroot_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^pasv_addr_resolve=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^pasv_promiscuous=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^port_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^port_promiscuous=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^require_cert=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^run_as_launching_user=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^secure_email_list_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^session_support=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^setproctitle_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ssl_request_cert=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^strict_ssl_read_eof=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^strict_ssl_write_shutdown=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^text_userdb_names=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^tilde_user_enable=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^use_sendfile=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^validate_cert=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^virtual_use_local_privs=/) }
  end

end
