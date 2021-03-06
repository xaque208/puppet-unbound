require 'spec_helper'

describe 'unbound::record' do
  let(:title) { 'record.example.com' }
  let(:pre_condition) { 'class { "unbound": }' }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with a TXT record (<255 characters)' do
        let(:params) do
          {
            type: 'TXT',
            content: 'Short TXT Record',
            reverse: false
          }
        end

        it { is_expected.to contain_unbound__record('record.example.com') }
        it {
          is_expected.to contain_concat__fragment('unbound-stub-record.example.com-local-record').with(
            content: "  local-data: 'record.example.com 14400 IN TXT \"Short TXT Record\"'\n"
          )
        }
      end

      context 'with a TXT record (>255 characters)' do
        long_txt_record = 'Long TXT Record ' + 'X' * 255
        long_txt_record_chunked = 'Long TXT Record ' + 'X' * 239 + '""' + 'X' * 16
        let(:params) do
          {
            type: 'TXT',
            content: long_txt_record,
            reverse: false
          }
        end

        it { is_expected.to contain_unbound__record('record.example.com') }
        it {
          is_expected.to contain_concat__fragment('unbound-stub-record.example.com-local-record').with(
            content: "  local-data: 'record.example.com 14400 IN TXT \"#{long_txt_record_chunked}\"'\n"
          )
        }
      end
    end
  end
end
