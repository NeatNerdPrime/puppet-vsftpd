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
        'anon_max_rate'        => 8192,
        'ftp_data_port'        => 20,
        'listen_port'          => 21,
        'local_max_rate'       => 16384,
        'max_clients'          => 10,
        'max_per_ip'           => 1,
        'pasv_min_port'        => 4000,
        'pasv_max_port'        => 5000,
        'anon_root'            => '/var/lib/empty',
        'ftp_username'         => 'ftp',
        'guest_username'       => 'nobody',
        'ftpd_banner'          => 'Welcome to the puppet deployed FTP server',
        'banner_file'          => '/etc/vsftpd/banner.txt',
        'chroot_list_file'     => '/etc/vsftpd/chroot_list',
        'pam_service_name'     => 'ftp',
        'userlist_file'        => '/etc/vsftpd/user_list',
        'user_config_dir'      => '/etc/vsftpd/user_conf',
        'secure_chroot_dir'    => '/usr/share/empty',
        'rsa_cert_file'        => '/etc/vsftpd/certs/vsftpd.pem',
        'rsa_private_key_file' => '/etc/vsftpd/certs/vsftpd.key',
        'pasv_address'         => '127.0.0.1',
        'xferlog_file'         => '/var/log/xferlog',

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
  end

end
