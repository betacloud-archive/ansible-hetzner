#!groovy

node {
  currentBuild.result = "SUCCESS"

  // https://www.quernus.co.uk/2016/10/03/wipe-workspace-jenkins-2.0-deletedir/
  deleteDir() // wipe the workspace

  try {
    stage('Checkout') {
      checkout scm
    }

    stage('Test') {
      configFileProvider([configFile(fileId: env.OPENRCFILEID, variable: 'OPENRCFILE')]) {
        sh 'scripts/test.sh'
      }
    }

    stage('Push') {
      configFileProvider([configFile(fileId: env.NEXUSFILEID, variable: 'NEXUSFILE')]) {
        sh 'scripts/push.sh'
      }
    }
  }

  catch (err) {
    configFileProvider([configFile(fileId: env.OPENRCFILEID, variable: 'OPENRCFILE')]) {
      sh 'scripts/destroy.sh'
    }
    currentBuild.result = "FAILURE"
      throw err
  }
}
