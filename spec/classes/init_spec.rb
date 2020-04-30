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

    it { is_expected.to contain_class('vsftpd::params') }
    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_package('vsftpd') }
    end
end
