require 'spec_helper'

describe 'vsftpd' do
  let(:title) { 'vsftpd_conf' }
  let(:node) { 'test.example.com' }

  context 'Test if chown_username fails with chown_uploads=NO' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'chown_username' => 'tux',
        'chown_uploads' => false,
      }
    }
    it { is_expected.to compile.and_raise_error(/Cannot use .* set to true/) }
  end

  context 'Test if chown_username fails without setting chown_uploads' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'chown_username' => 'tux',
      }
    }
    it { is_expected.to compile.and_raise_error(/Cannot use .* set to true/) }
  end

  context 'Test if chown_username and chown_uploads=YES together still work' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'chown_username' => 'tux',
        'chown_uploads'  => true,
      }
    }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^chown_uploads=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^chown_username=tux/) }
  end
  context 'Test if message_file fails with dirmessage_enable=NO' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'message_file'      => '.message',
        'dirmessage_enable' => false,
      }
    }
    it { is_expected.to compile.and_raise_error(/Cannot use .* set to true/) }
  end

  context 'Test if message_file fails without setting dirmessage_enable' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'message_file'      => '.message',
      }
    }
    it { is_expected.to compile.and_raise_error(/Cannot use .* set to true/) }
  end

  context 'Test if message_file and dirmessage_enable=YES together still work' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'message_file'      => '.message',
        'dirmessage_enable' => true,
      }
    }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^dirmessage_enable=YES/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^message_file=\.message/) }
  end

  context 'Test if anon_umask fails if a wrong umask is given' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'anon_umask' => '9898',
      }
    }
    it { is_expected.to compile.and_raise_error(/umask must be an octal value.*/) }
  end

  context 'Test if anon_umask works with a correct 4 digit umask' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'anon_umask' => '0022',
      }
    }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^anon_umask=0022/) }
  end

  context 'Test if anon_umask works with a correct 3 digit umask' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'anon_umask' => '022',
      }
    }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^anon_umask=022/) }
  end

  context 'Test if file_open_mode fails if a wrong umask is given' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'file_open_mode' => '9898',
      }
    }
    it { is_expected.to compile.and_raise_error(/file open mode must be an octal value.*/) }
  end

  context 'Test if file_open_mode works with a correct 4 digit umask' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'file_open_mode' => '0660',
      }
    }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^file_open_mode=0660/) }
  end

  context 'Test if file_open_mode does not work with a 3 digit umask' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'file_open_mode' => '660',
      }
    }
    it { is_expected.to compile.and_raise_error(/file open mode must be an octal value.*/) }
  end

  context 'Test if cmds_allowed does not work with a unknown ftp command' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'cmds_allowed' => ['TEST','HELLO'],
      }
    }
    it { is_expected.to compile.and_raise_error(/parameter .* index \d+ expects a match for/) }
  end

  context 'Test if cmds_allowed does work with a known ftp command' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'cmds_allowed' => ['PASV','QUIT','PROT'],
        'cmds_denied' => ['ABOR','DELE','MKD'],
      }
    }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^cmds_allowed=PASV,QUIT,PROT/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^cmds_denied=ABOR,DELE,MKD/) }
  end

  context 'Test if deny_file and hide_file creates configuration as expected' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }
    let(:params) {
      {
        'deny_file' => ['*.mp3','*.ogg','*.flac'],
        'hide_file' => ['.ssh','.gnupg','.vimrc'],
      }
    }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^deny_file={\*\.mp3,\*\.ogg,\*\.flac}/) }
    it { is_expected.to contain_file('/etc/vsftpd/vsftpd.conf').with_content(/^hide_file={\.ssh,\.gnupg,\.vimrc}/) }
  end

end
