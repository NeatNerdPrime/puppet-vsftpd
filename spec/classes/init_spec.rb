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
  context 'Check for basic bevahiour on Debian' do
    let(:facts) {
      {
        :osfamily => 'Debian',
        :operatingsystem => 'Debian',
        :architecture => 'x86_64',
      }
    }

    it { is_expected.to contain_class('vsftpd::params') }
    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_package('vsftpd') }
    it { is_expected.to contain_service('vsftpd').with_enable(true) }
    it { is_expected.to contain_service('vsftpd').with_require('Package[vsftpd]') }
    it { is_expected.to contain_service('vsftpd').with_subscribe('File[/etc/vsftpd.conf]') }
    end
  context 'Check for basic bevahiour on Debian' do
    let(:facts) {
      {
        :osfamily => 'Suse',
        :operatingsystem => 'SLES',
        :architecture => 'x86_64',
      }
    }

    it { is_expected.to contain_class('vsftpd::params') }
    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_package('vsftpd') }
    it { is_expected.to contain_service('vsftpd').with_enable(true) }
    it { is_expected.to contain_service('vsftpd').with_require('Package[vsftpd]') }
    it { is_expected.to contain_service('vsftpd').with_subscribe('File[/etc/vsftpd.conf]') }
    end
  context 'Check if manage_service = false on RHEL works' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :architecture => 'x86_64',
      }
    }

    let(:params) {
      {
        'manage_service' => false,
      }
    }

    it { is_expected.to contain_class('vsftpd::params') }
    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_package('vsftpd') }
    it { is_expected.not_to contain_service('vsftpd').with_enable(true) }
    it { is_expected.not_to contain_service('vsftpd').with_require('Package[vsftpd]') }
    it { is_expected.not_to contain_service('vsftpd').with_subscribe('File[/etc/vsftpd/vsftpd.conf]') }
    end
  context 'Check if module fails on an unsupported operating system' do
    let(:facts) {
      {
        :osfamily => 'Solaris',
        :operatingsystem => 'OpenIndiana',
        :architecture => 'x86_64',
      }
    }

    it { is_expected.to compile.and_raise_error(/OpenIndiana not supported./) }
    end
end
