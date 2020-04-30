require 'spec_helper'

describe 'vsftpd' do
  let(:title) { 'vsftpd_conf' }
  let(:node) { 'test.example.com' }

  context 'Check for basic bevahiour on RHEL' do
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
    it { is_expected.to contain_service('vsftpd').with_enable(true) }
    it { is_expected.to contain_service('vsftpd').with_require('Package[vsftpd]') }
    it { is_expected.to contain_service('vsftpd').with_subscribe('File[/etc/vsftpd/vsftpd.conf]') }
    end
end
