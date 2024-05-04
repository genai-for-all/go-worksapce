#!/bin/bash
set -o allexport; source settings.env; set +o allexport

docker run -it --name go-workspace --rm k33g/genai-go-workspace:${VERSION} 
