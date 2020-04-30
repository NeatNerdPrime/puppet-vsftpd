require 'spec_helper'

describe 'vsftpd' do
  let(:title) { 'vsftpd_conf' }
  let(:node) { 'test.example.com' }

  context 'Test if chown_username can be used with chown_uploads=NO' do
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
    it { is_expected.to compile.and_raise_error(/Cannot use \"chown_username\" without \"chown_uploads\" set to true/) }
  end

  context 'Test if chown_username can be used without chown_uploads=YES' do
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
    it { is_expected.to compile.and_raise_error(/Cannot use \"chown_username\" without \"chown_uploads\" set to true/) }
  end

  context 'Test if chown_username and chown_uploads together still work' do
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

end
