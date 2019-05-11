require 'serverspec'
require 'docker'

describe 'Dockerfile' do
  before(:all) do
    @image = Docker::Image.build_from_dir('.')
    @image.tag(repo: 'chefaustin/gem-jar', tag: 'latest')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, @image.id
    set :docker_container_create_options, 'Entrypoint' => ['bash']
  end

  it 'should have the maintainer label' do
    expect(@image.json['Config']['Labels'].key?('maintainer'))
  end

  it 'should have the version label' do
    expect(@image.json['Config']['Labels'].key?('version'))
  end

  ['Gemfile', 'Gemfile.lock'].each do |file|
    describe file("/#{file}") do
      it { should exist }
    end
  end

  ['gemstash'].each do |gem|
    describe package(gem) do
      it { should be_installed.by('gem').with_version('2.0.0') }
    end
  end
end
