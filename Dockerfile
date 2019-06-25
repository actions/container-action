FROM alpine:3.10

LABEL "name"="Container Action Template"
LABEL "maintainer"="GitHub Actions <support+actions@github.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="GitHub Container Action Template"
LABEL "com.github.actions.description"="Container action template."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"
COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
