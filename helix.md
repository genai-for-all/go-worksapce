sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix

hx --health

gopls

go install golang.org/x/tools/gopls@latest          # LSP
go install github.com/go-delve/delve/cmd/dlv@latest # Debugger
go install golang.org/x/tools/cmd/goimports@latest  # Formatter

export PATH=$PATH:$(go env GOPATH)/bin
# $HOME/go/bin