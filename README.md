# How to use

- Clone the project
- Either run build.sh or build it yourself (if so change the Image name in docker-compose.yml)
- Either run compose.sh or "docker compose up -d"
- After everything is started drop your typo3conf in the new html folder
- Make symlink for typo3_src as typo3, and don't forget du `composer update --no-dev` in typo3_src
