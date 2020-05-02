require 'spec_helper'

describe 'vsftpd' do
  let(:title) { 'vsftpd_conf' }
  let(:node) { 'test.example.com' }

  context 'Test non-boolean parameters on RHEL' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'anon_max_rate'           => 8192,
        'ftp_data_port'           => 20,
        'listen_port'             => 21,
        'local_max_rate'          => 16384,
        'max_clients'             => 10,
        'max_per_ip'              => 1,
        'pasv_min_port'           => 4000,
        'pasv_max_port'           => 5000,
        'anon_root'               => '/var/lib/empty',
        'ftp_username'            => 'ftp',
        'guest_username'          => 'nobody',
        'ftpd_banner'             => 'Welcome to the puppet deployed FTP server',
        'banner_file'             => '/etc/vsftpd/banner.txt',
        'chroot_list_file'        => '/etc/vsftpd/chroot_list',
        'pam_service_name'        => 'ftp',
        'userlist_file'           => '/etc/vsftpd/user_list',
        'user_config_dir'         => '/etc/vsftpd/user_conf',
        'secure_chroot_dir'       => '/usr/share/empty',
        'rsa_cert_file'           => '/etc/vsftpd/certs/vsftpd.pem',
        'rsa_private_key_file'    => '/etc/vsftpd/certs/vsftpd.key',
        'pasv_address'            => '127.0.0.1',
        'xferlog_file'            => '/var/log/xferlog',
        'idle_session_timeout'    => 300,
        'data_connection_timeout' => 300,
        'nopriv_user'             => 'nobody',
        'accept_timeout'          => 60,
        'address_space_limit'     => 104857600,
        'chown_upload_mode'       => '0600',
        'delay_failed_login'      => 5,
        'delay_successful_login'  => 5,
        'max_login_fails'         => 5,
        'trans_chunk_size'        => 8192,
        'banned_email_file'       => '/etc/vsftpd/banned_emails',
        'ca_certs_file'           => '/etc/vsftpd/certs/ca.crt',
        'dsa_cert_file'           => '/etc/vsftpd/certs/dsa.crt',
        'dsa_private_key_file'    => '/etc/vsftpd/certs/dsa.key',
        'email_password_file'     => '/etc/vsftpd/email_passwords',
        'listen_address'          => '10.0.0.1',
        'listen_address6'         => '::1',
        'local_root'              => '/var/ftp/local',
        'user_sub_token'          => '$USER',
        'vsftpd_log_file'         => '/var/log/vsftpd.log',
      }
    }

    # check if every non-boolean parameter works as expected
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^anon_max_rate=8192/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ftp_data_port=20/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^listen_port=21/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^local_max_rate=16384/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^max_clients=10/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^max_per_ip=1/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^pasv_min_port=4000/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^pasv_max_port=5000/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^anon_root=\/var\/lib\/empty/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ftp_username=ftp/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^guest_username=nobody/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ftpd_banner=Welcome to the puppet deployed FTP server/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^banner_file=\/etc\/vsftpd\/banner.txt/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^chroot_list_file=\/etc\/vsftpd\/chroot_list/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^pam_service_name=ftp/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^userlist_file=\/etc\/vsftpd\/user_list/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^user_config_dir=\/etc\/vsftpd\/user_conf/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^secure_chroot_dir=\/usr\/share\/empty/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^rsa_cert_file=\/etc\/vsftpd\/certs\/vsftpd.pem/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^rsa_private_key_file=\/etc\/vsftpd\/certs\/vsftpd.key/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^pasv_address=127\.0\.0\.1/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^xferlog_file=\/var\/log\/xferlog/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^idle_session_timeout=300/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^data_connection_timeout=300/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^nopriv_user=nobody/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^accept_timeout=60/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^address_space_limit=104857600/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^chown_upload_mode=0600/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^delay_failed_login=5/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^delay_successful_login=5/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^max_login_fails=5/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^trans_chunk_size=8192/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^banned_email_file=\/etc\/vsftpd\/banned_emails/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^ca_certs_file=\/etc\/vsftpd\/certs\/ca.crt/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^dsa_cert_file=\/etc\/vsftpd\/certs\/dsa.crt/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^dsa_private_key_file=\/etc\/vsftpd\/certs\/dsa.key/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^email_password_file=\/etc\/vsftpd\/email_passwords/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^listen_address=10\.0\.0\.1/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^listen_address6=::1/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^local_root=\/var\/ftp\/local/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^user_sub_token=\$USER/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^vsftpd_log_file=\/var\/log\/vsftpd.log/) }
  end

  context 'Test for non-boolean absent parameters on RHEL' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }

    # check if every non-boolean parameter is absent 
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^anon_max_rate=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ftp_data_port=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^listen_port=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^local_max_rate=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^max_clients=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^max_per_ip=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^pasv_min_port=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^pasv_max_port=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^anon_root=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ftp_username=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^guest_username=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ftpd_banner=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^banner_file=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^chroot_list_file=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^pam_service_name=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^userlist_file=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^user_config_dir=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^secure_chroot_dir=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^rsa_cert_file=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^rsa_private_key_file=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^pasv_address=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^xferlog_file=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^idle_session_timeout=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^data_connection_timeout=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^nopriv_user=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^accept_timeout=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^address_space_limit=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^chown_upload_mode=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^delay_failed_login=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^delay_successful_login=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^max_login_fails=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^trans_chunk_size=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^banned_email_file=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^ca_certs_file=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^dsa_cert_file=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^dsa_private_key_file=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^email_password_file=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^listen_address=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^listen_address6=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^local_root=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^user_sub_token=/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').without_content(/^vsftpd_log_file=/) }
  end

end
