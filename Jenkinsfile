stage('Checkout') {
  node {
      checkout scm
  }
}

stage('Install dependencies') {
  node {
    sh 'bundle install'
  }
}

stage('Style checks') {
  parallel(Rubocop: {
      node {
          bundle_exec 'rake style:rubocop'
      }
  })
}

stage('Tests') {
  parallel(Unit: {
      node {
          bundle_exec 'rake spec:unit'
      }
  }, Integration: {
      node {
          bundle_exec 'rake spec:integration'
      }
  }, System: {
      node {
          bundle_exec 'rake spec:system'
      }
  })
}

if (isRelease()) {

    stage "Publish"

    echo "Would publish to rubygems.org" // TODO
    slackSend "Published ${name()} gem version ${version()} to the rubygems.org", color: 'good'

}

def bundle_exec(command) {
    sh "bundle exec ${command}"
}

def isRelease() {
    false // FIXME: Building git tags is not yet supported (JENKINS-34395)
}

def name() {
    node {
        def matcher = readFile('packer-client.gemspec') =~ "spec.name += '(.+)'"
        matcher ? matcher[0][1] : null
    }
}

def version() {
    node {
        def matcher = readFile('lib/packer/version.rb') =~ "VERSION = '(.+)'"
        matcher ? matcher[0][1] : null
    }
}
