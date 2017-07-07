# Cloud Config

The file `./util/deploy-init.yml` is a [Cloud Config](http://cloudinit.readthedocs.io/en/latest/index.html)
configuration which can be used to bootstrap new nodes that can be added to the
cluster. New nodes will have a user `deploy` created, who belongs to the `sudo`
group. In addition, this user is allowed full passwordless `sudo` privileges.
SSH keys are added via the GitHub convenience `https://github.com/<user>.keys`.
