function post_install(){
    local pkgname=trash-cli
    local giturl=https://github.com/andreafrancia/trash-cli.git
    local location="${PEARL_PKGVARDIR}/trash-cli"

    info "Installing or updating the $pkgname git repository..."
    install_or_update_git_repo $giturl "$location" master

    cd "$location"
    pip3 install .

    link_to_path ${PEARL_PKGVARDIR}/trash-cli/trash
    link_to_path ${PEARL_PKGVARDIR}/trash-cli/trash-list
    link_to_path ${PEARL_PKGVARDIR}/trash-cli/trash-empty
    link_to_path ${PEARL_PKGVARDIR}/trash-cli/trash-put
    link_to_path ${PEARL_PKGVARDIR}/trash-cli/trash-restore
    link_to_path ${PEARL_PKGVARDIR}/trash-cli/trash-rm

    return 0
}

function post_update(){
    post_install
}

function pre_remove(){
    unlink_from_path ${PEARL_PKGVARDIR}/trash-cli/trash
    unlink_from_path ${PEARL_PKGVARDIR}/trash-cli/trash-list
    unlink_from_path ${PEARL_PKGVARDIR}/trash-cli/trash-empty
    unlink_from_path ${PEARL_PKGVARDIR}/trash-cli/trash-put
    unlink_from_path ${PEARL_PKGVARDIR}/trash-cli/trash-restore
    unlink_from_path ${PEARL_PKGVARDIR}/trash-cli/trash-rm

    rm -rf "${PEARL_PKGVARDIR}/trash-cli"

    return 0
}
