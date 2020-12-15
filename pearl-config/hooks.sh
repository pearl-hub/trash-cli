function post_install(){
    local pkgname=trash-cli
    local giturl=https://github.com/andreafrancia/trash-cli.git
    local location="${PEARL_PKGVARDIR}/trash-cli"

    info "Installing or updating the $pkgname git repository..."
    install_or_update_git_repo $giturl "$location" master

    cd "$location"
    pip install .

    return 0
}

function post_update(){
    post_install
}

function pre_remove(){
    rm -rf "${PEARL_PKGVARDIR}/trash-cli"
}
