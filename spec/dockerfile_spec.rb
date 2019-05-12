require 'serverspec'
require 'docker'

# Test Options
container_creation_opts = {
  'Entrypoint' => ['bash'],
  'Name' => 'test-gem-jar'
}

# Metadata
DOCKERFILE_LABELS = [
  'maintainer',
  'version'
].freeze

# Gems
PRODUCTION_GEMS = [
  'gemstash'
].freeze

DEVELOPMENT_GEMS = [
  'docker',
  'inspec',
  'rubocop',
  'rubocop-performance',
  'serverspec'
].freeze

PATHS_TO_CREATED_DIRS = [
  '/root'
]

# Files
PATHS_TO_CREATED_FILES = [
  '/config.yml',
  '/docker_health.rb',
  '/Gemfile',
  '/Gemfile.lock'
].freeze

describe 'Dockerfile' do
  before(:all) do
    @image = Docker::Image.build_from_dir('.')
    @image.tag(repo: 'chefaustin/gem-jar', tag: 'latest')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, @image.id
    set :docker_container_create_options, container_creation_opts
  end

  DOCKERFILE_LABELS.each do |label|
    it 'should have labels' do
      expect(@image.json['Config']['Labels'].key?(label))
    end
  end
end

describe docker_container(container_creation_opts['Name']) do
#  it { should exist }
#  it { should be_running }

  describe user('root') do
    it { should exist }
    it { should have_home_directory '/root' }
  end

  PATHS_TO_CREATED_FILES.each do |file|
    describe file(file) do
      it { should exist }
    end
  end

  PATHS_TO_CREATED_DIRS.each do |dir|
    describe file(dir) do
      it { should be_directory }
    end
  end

  PRODUCTION_GEMS.each do |gem|
    describe package(gem) do
      it { should be_installed.by('gem') }
    end
  end

  DEVELOPMENT_GEMS.each do |gem|
    describe package(gem) do
      it { should_not be_installed }
    end
  end
end
