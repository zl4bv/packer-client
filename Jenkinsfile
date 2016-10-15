stage('Checkout') {
    node {
        checkout scm
    }
}

stage('Install dependencies') {
    node {
        withRvm('ruby-2.3.1') {
            sh 'bundle install'
        }
    }
}

stage('Style checks') {
    parallel(Rubocop: {
        node {
            withRvm('ruby-2.3.1') {
                bundle_exec 'rake style:rubocop'
            }
        }
    })
}

stage('Tests') {
    parallel(Unit: {
        node {
            withRvm('ruby-2.3.1') {
                bundle_exec 'rake spec:unit'
            }
        }
    }, Integration: {
        node {
            withRvm('ruby-2.3.1') {
                bundle_exec 'rake spec:integration'
            }
        }
    }, System: {
        node {
            withRvm('ruby-2.3.1') {
                bundle_exec 'rake spec:system'
            }
        }
    })
}

if (isRelease()) {
    stage('Publish') {
        echo 'Would publish to rubygems.org' // TODO
        slackSend "Published ${name()} gem version ${version()} to the rubygems.org", color: 'good'
    }
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

def withRvm(version, cl) {
    withRvm(version, "executor-${env.EXECUTOR_NUMBER}") {
        cl()
    }
}

def withRvm(version, gemset, cl) {
    RVM_HOME='$HOME/.rvm'
    paths = [
        "$RVM_HOME/gems/$version@$gemset/bin",
        "$RVM_HOME/gems/$version@global/bin",
        "$RVM_HOME/rubies/$version/bin",
        "$RVM_HOME/bin",
        "${env.PATH}"
    ]
    def path = paths.join(':')
    withEnv(["PATH=${env.PATH}:$RVM_HOME", "RVM_HOME=$RVM_HOME"]) {
        sh "set +x; source $RVM_HOME/scripts/rvm; rvm use --create --install --binary $version@$gemset"
    }
    withEnv([
        "PATH=$path",
        "GEM_HOME=$RVM_HOME/gems/$version@$gemset",
        "GEM_PATH=$RVM_HOME/gems/$version@$gemset:$RVM_HOME/gems/$version@global",
        "MY_RUBY_HOME=$RVM_HOME/rubies/$version",
        "IRBRC=$RVM_HOME/rubies/$version/.irbrc",
        "RUBY_VERSION=$version"
    ]) {
        sh 'rvm info'
        cl()
    }
}
