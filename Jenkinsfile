pipeline {
    agent {
        label "master"
    }
    stages {
        stage('Build app') {
            steps {
                echo "Building app..."
            }
        }
        stage('Test app') {
            steps {
                echo "Testing app..."
            }
        }
        stage('Build image') {
            agent {
                label "dockerbuild"
            }
            steps {
                sh "git rev-parse --short HEAD > /tmp/short_hash"
                script {
                    // trim removes leading and trailing whitespace from the string
                    short_hash = readFile('/tmp/short_hash').trim()
                }
                sh "docker build -t docker.majustfortesting.com/exercises/guestbook:${short_hash} ."
            }
        }
        stage('Push image') {
            agent {
                label "dockerbuild"
            }
            steps {
                echo "Pushing image..."
                sh "docker push docker.majustfortesting.com/exercises/guestbook:${short_hash}"
            }
        }
    }
}
