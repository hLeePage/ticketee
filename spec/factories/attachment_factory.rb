FactoryGirl.define do
  factory :attachment do
    transient do
￼      uploading file_to_attach "spec/fixtures/speed.txt"
    end
    file { File.open file_to_attach }
  end
end
