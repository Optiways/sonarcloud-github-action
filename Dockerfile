<<<<<<< HEAD
<<<<<<< HEAD
ARG CACHE_DOCKER_REGISTRY_URL="harbor.tech.padam.io:443/"
ARG CACHE_DOCKER_REGISTRY_PROXY_PROJECT="library/"

=======
>>>>>>> 0f7db25 (fix dockerfile)
=======
ARG CACHE_DOCKER_REGISTRY_URL
ARG CACHE_DOCKER_REGISTRY_PROXY_PROJECT

>>>>>>> 8afd7b3 (Update Dockerfile)
FROM ${CACHE_DOCKER_REGISTRY_URL}${CACHE_DOCKER_REGISTRY_PROXY_PROJECT}sonarsource/sonar-scanner-cli:5.0

LABEL version="0.0.1" \
      repository="https://github.com/sonarsource/sonarcloud-github-action" \
      homepage="https://github.com/sonarsource/sonarcloud-github-action" \
      maintainer="SonarSource" \
      com.github.actions.name="SonarCloud Scan" \
      com.github.actions.description="Scan your code with SonarCloud to detect bugs, vulnerabilities and code smells in more than 25 programming languages." \
      com.github.actions.icon="check" \
      com.github.actions.color="green"

ARG SONAR_SCANNER_HOME=/opt/sonar-scanner
ARG NODEJS_HOME=/opt/nodejs

ENV PATH=${PATH}:${SONAR_SCANNER_HOME}/bin:${NODEJS_HOME}/bin

# set up local envs in order to allow for special chars (non-asci) in filenames
ENV LC_ALL="C.UTF-8"

WORKDIR /opt

# https://help.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions#user
USER root

# Prepare entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
